program PrjInterferenzo;

uses
  Vcl.Forms,
  graphische_Optionen in 'graphische_Optionen.pas' {FrmGraphischeOptionen},
  Konstantenbox in 'Konstantenbox.pas',
  Projektionsflaeche in 'Projektionsflaeche.pas' {FrmProjektionsflaeche},
  UFarbtabelle in 'UFarbtabelle.pas',
  UHaupt in 'UHaupt.pas' {FrmHaupt},
  UInfo in 'UInfo.pas' {FormInfo},
  UToolbox in 'UToolbox.pas',
  UVersuchsuebersicht in 'UVersuchsuebersicht.pas' {FormVersuchsuebersicht};

{$R *.res}

begin
  Application.Initialize;
  Application.Icon.LoadFromFile('Interferenzo_Logo.ico');
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmHaupt, FrmHaupt);
  Application.CreateForm(TFrmGraphischeOptionen, FrmGraphischeOptionen);
  Application.CreateForm(TFrmProjektionsflaeche, FrmProjektionsflaeche);
  Application.CreateForm(TFormInfo, FormInfo);
  Application.CreateForm(TFormVersuchsuebersicht, FormVersuchsuebersicht);
  Application.CreateForm(TFrmGraphischeOptionen, FrmGraphischeOptionen);
  Application.CreateForm(TFrmProjektionsflaeche, FrmProjektionsflaeche);
  Application.CreateForm(TFrmHaupt, FrmHaupt);
  Application.CreateForm(TFormInfo, FormInfo);
  Application.CreateForm(TFormVersuchsuebersicht, FormVersuchsuebersicht);
  Application.Run;
end.
