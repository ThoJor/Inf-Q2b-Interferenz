program PrjHauptmen�;

uses
  Vcl.Forms,
  UHaupt in 'UHaupt.pas' {FrmMainMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMainMenu, FrmMainMenu);
  Application.Run;
end.
