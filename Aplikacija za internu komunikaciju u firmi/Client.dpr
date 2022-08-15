program Client;

uses
  System.StartUpCopy,
  System.SysUtils,
  View.Main in 'View.Main.pas' {MainFrame: TFrame},
  Model.Constants in 'Model.Constants.pas',
  Model.Types in 'Model.Types.pas',
  Model.Utils in 'Model.Utils.pas',
  View.Menu in 'View.Menu.pas' {MenuFrame: TFrame},
  View.Menu.Item in 'View.Menu.Item.pas' {MenuItemFrame: TFrame},
  Model in 'Model.pas',
  ViewModel in 'ViewModel.pas',
  Model.Data in 'Model.Data.pas' {ModelData: TDataModule},
  View.Data in 'View.Data.pas' {DataFrame: TFrame},
  View.SignIn in 'View.SignIn.pas' {SignInFrame: TFrame},
  View.SignUp in 'View.SignUp.pas' {SignUpFrame: TFrame},
  View.Account in 'View.Account.pas' {AccountFrame: TFrame},
  View.Home in 'View.Home.pas' {HomeFrame: TFrame},
  View.Home.DataRect in 'View.Home.DataRect.pas' {DataRectFrame: TFrame},
  View.Settings.Item in 'View.Settings.Item.pas' {SettingsItemFrame: TFrame},
  View.Settings in 'View.Settings.pas' {SettingsFrame: TFrame},
  View.Placeholder in 'View.Placeholder.pas' {PlaceholderFrame: TFrame},
  View.TermsOfUse in 'View.TermsOfUse.pas' {TermsOfUseFrame: TFrame},
  View.PrivacyPolicy in 'View.PrivacyPolicy.pas' {PrivacyPolicyFrame: TFrame},
  View.About in 'View.About.pas' {AboutFrame: TFrame},
  View.Calls in 'View.Calls.pas' {CallsFrame: TFrame},
  View.ContactsList.Item in 'View.ContactsList.Item.pas' {ContactListItemFrame: TFrame},
  FMX.Forms,
  View in 'View.pas' {ViewForm},
  Chat in 'Chat.pas' {ChatFrame: TFrame},
  Inbox in 'Inbox.pas' {InboxFrame: TFrame},
  Teams in 'Teams.pas' {TeamsFrame: TFrame},
  Tasks in 'Tasks.pas' {TasksFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TViewForm, ViewForm);
  Application.Run;
end.
