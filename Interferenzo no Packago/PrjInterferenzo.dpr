program PrjInterferenzo;

uses
  Vcl.Forms,
  Konstantenbox in '..\Download\Formulare & Units\Konstantenbox.pas',
  Projektionsflaeche in '..\Download\Formulare & Units\Projektionsflaeche.pas' {FrmProjektionsflaeche},
  UFarbtabelle in '..\Download\Formulare & Units\UFarbtabelle.pas',
  UToolbox in '..\Download\Formulare & Units\UToolbox.pas',
  UVersuchsuebersicht in '..\Download\Formulare & Units\UVersuchsuebersicht.pas' {FormVersuchsuebersicht},
  UInfo in '..\Download\Formulare & Units\UInfo.pas' {FormInfo},
  UHaupt in '..\Download\Formulare & Units\UHaupt.pas' {FrmHaupt},
  graphische_Optionen in '..\..\..\Neuer Ordner (3)\graphische_Optionen.pas' {FrmGraphischeOptionen};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormHaupt, FormHaupt);
  Application.CreateForm(TFrmProjektionsflaeche, FrmProjektionsflaeche);
  Application.CreateForm(TFormVersuchsuebersicht, FormVersuchsuebersicht);
  Application.CreateForm(TFormInfo, FormInfo);
  Application.CreateForm(TFrmGraphischeOptionen, FrmGraphischeOptionen);
  Application.Run;
end.
