unit Chat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  View.Main, FMX.Effects, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes, sgcWebSocket_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Edit;

type
  TChatFrame = class(TMainFrame)
    sgcWsClient: TsgcWebSocketClient;
    btnSend: TButton;
    mmLog: TMemo;
    GridPanelLayout1: TGridPanelLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Path1: TPath;
    Layout1: TLayout;
    ShadowEffect1: TShadowEffect;
    Memo1: TMemo;
    edtMessage: TEdit;
    edtName: TEdit;
    Connect: TButton;
    Disconnect: TButton;
    Label2: TLabel;

    procedure FormShow(Sender: TObject);
    procedure sgcWsClientConnect(Connection: TsgcWSConnection);
    procedure sgcWsClientDisconnect(Connection: TsgcWSConnection;
      Code: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgcWsClientError(Connection: TsgcWSConnection;
      const Error: string);
    procedure sgcWsClientMessage(Connection: TsgcWSConnection;
      const Text: string);
    procedure btnSendClick(Sender: TObject);
    procedure ConnectClick(Sender: TObject);
    procedure DisconnectClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChatFrame: TChatFrame;

implementation

{$R *.fmx}


procedure TChatFrame.btnSendClick(Sender: TObject);
begin
    if sgcWsClient.Active then
  begin
    if edtName.Text = '' then
      raise Exception.Create('Please, set your name first!');
    if edtMessage.Text = '' then
      raise Exception.Create('Please, insert a message first!');
    sgcWsClient.WriteData(edtName.Text + ': ' + edtMessage.Text);
    edtMessage.Text := '';
  end
  else
    raise Exception.Create('Your are not Connected!');
end;


procedure TChatFrame.FormShow(Sender: TObject);
begin
  sgcWsClient.Active := True;
end;
procedure TChatFrame.sgcWsClientConnect(Connection: TsgcWSConnection);
begin
  Memo1.Lines.Add('You are connected');
end;
procedure TChatFrame.sgcWsClientDisconnect(Connection: TsgcWSConnection;
  Code: Integer);
begin
  Memo1.Lines.Add('#disconnected (' + IntToStr(Code) + ')');
end;
procedure TChatFrame.sgcWsClientError(Connection: TsgcWSConnection;
  const Error: string);
begin
  Memo1.Lines.Add('#error: ' + Error);
end;
procedure TChatFrame.sgcWsClientMessage(Connection: TsgcWSConnection;
  const Text: string);
begin
  Memo1.Lines.Add(Text);
end;
procedure TChatFrame.DisconnectClick(Sender: TObject);
begin
  sgcWsClient.Active :=False;

end;

procedure TChatFrame.ConnectClick(Sender: TObject);
begin
  sgcWsClient.Active :=true;

end;

procedure TChatFrame.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if sgcWsClient.Active = True then begin
    edtMessage.Text := 'User ' + edtName.Text + ' is offline!';
    btnSendClick(nil);
  end;
  sgcWsClient.Active := False;
end;


initialization
  // Register frame
  RegisterClass(TChatFrame);
finalization
  // Unregister frame
  UnRegisterClass(TChatFrame);

end.
