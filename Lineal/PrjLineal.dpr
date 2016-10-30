program PrjLineal;

uses
  Vcl.Forms,
  ULineal in 'ULineal.pas' {FrmLineal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLineal, FrmLineal);
  Application.Run;
end.
