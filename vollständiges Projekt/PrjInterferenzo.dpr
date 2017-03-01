program PrjInterferenzo;

uses
  Vcl.Forms, graphische_Optionen, Konstantenbox, Projektionsflaeche, UFarbtabelle, UHaupt, UInfo, UToolbox, UVersuchsuebersicht;

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
  Application.Run;
end.
