unit View.Data;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  View.Main, FMX.Effects, FMX.Layouts, FMX.Ani, FMX.Objects,
  FMX.Controls.Presentation, Data.Bind.Controls, Fmx.Bind.Navigator,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBLiteDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListView, FMX.Grid.Style,
  Fmx.Bind.Grid, Data.Bind.Grid, FMX.ScrollBox, FMX.Grid, Model.Types,
  Model.Constants, Model.Utils,
  IOUtils;

type
  // Implements access to database data through LiveBindings.
  TDataFrame = class(TMainFrame)
    BindingsList: TBindingsList;
    VertScrollBox: TVertScrollBox;
    Grid: TGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkFillControlToField: TLinkFillControlToField;
    ListView: TListView;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure ListViewItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure GridDrawColumnCell(Sender: TObject; const Canvas: TCanvas;
      const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates);
  private
    FModelData: TDataModule;
  public
    constructor Create(Owner: TComponent);  override;
  end;

implementation

uses
  Model;

{$R *.fmx}

constructor TDataFrame.Create;
begin
  inherited Create(nil);
  FModelData := Model.ModelData;
  (FModelData as IModelData).GetFDConnection.Connected := True;
  (FModelData as IModelData).GetFDQueryListView.Active := True;
  (FModelData as IModelData).GetFDQueryGrid.Active := True;
end;

// Autosize Grid columns.
procedure TDataFrame.GridDrawColumnCell(Sender: TObject; const Canvas: TCanvas;
  const Column: TColumn; const Bounds: TRectF; const Row: Integer;
  const Value: TValue; const State: TGridDrawStates);
var
  LGrid: TGrid absolute Sender;
begin
  inherited;
  Column.Size.Width := LGrid.Width / LGrid.ColumnCount - LGrid.Content.ScrollBox.VScrollBar.Width;
end;

// Filter Table data by FIRST_NAME.
procedure TDataFrame.ListViewItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  (FModelData as IModelData).GetFDQueryGrid.Filter := Concat(sFilterbyFirstName, AItem.Text, sSingleQuoteChar)
end;

initialization
  // Register TDataFrame.
  RegisterClass(TDataFrame);
finalization
  // Unregister TDataFrame.
  UnRegisterClass(TDataFrame);

end.
