unit Tasks;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  View.Main, FMX.Effects, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

type
  TTasksFrame = class(TMainFrame)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasksFrame: TTasksFrame;

implementation

{$R *.fmx}

initialization
  // Register profile frame class
  RegisterClass(TTasksFrame);
finalization
  // Unregister profile frame class
  UnRegisterClass(TTasksFrame);


end.
