unit UHaupt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UInfo, UVersuchsuebersicht, UToolbox, Projektionsflaeche,
  Vcl.ExtCtrls, Vcl.StdCtrls, Konstantenbox;

type
  TFrmHaupt = class(TForm)
    LProgrammname: TLabel;
    BtnStart: TButton;
    BtnVersuchsaufbau: TButton;
    LInfo: TLabel;
    TimerProjektionsflaeche: TTimer;
    BtnBeenden: TButton;
    ImgLogo: TImage;
    procedure FormCreate(Sender: TObject);
    procedure HomeSettings();
    procedure HeadingSettings();
    procedure BtnStartSettings();
    procedure LogoSettings();
    procedure BtnVersuchsaufbauSettings();
    procedure LInfoSettings();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnStartClick(Sender: TObject);
    procedure BtnVersuchsaufbauClick(Sender: TObject);
    procedure LInfoClick(Sender: TObject);
    procedure TimerProjektionsflaecheTimer(Sender: TObject);
    procedure BtnBeendenClick(Sender: TObject);
    procedure dynamischeKonstanten;
    procedure TabOrder;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmHaupt: TFrmHaupt;

implementation

{$R *.dfm}


//Programm beim Schliessen terminieren
procedure TFrmHaupt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrmHaupt.TabOrder;
begin
  BtnStart.TabStop:= true;
  BtnStart.TabOrder:= 0;
  BtnVersuchsaufbau.TabStop:= true;
  BtnVersuchsaufbau.TabOrder:= 1;
  BtnBeenden.TabStop:= true;
  BtnBeenden.TabOrder:= 2;
end;

procedure TFrmHaupt.dynamischeKonstanten;
begin
  {Festlegen der Bildschirmspezifischen Konstanten (Abhaengig von der Aufloesung des Bildschirms)}

  //Objekte
  Konstantenbox.KCheckBoxHoehe:= Screen.Height div 54;
  Konstantenbox.KCheckBoxWidth:= Screen.Width div 6;
  Konstantenbox.KLabelHoehe:= Screen.Height div 54;
  Konstantenbox.KLabelLeft:= Screen.Width div 192;
  Konstantenbox.KEditHoehe:= Screen.Height div 54;
  Konstantenbox.KPanelHoehe:= Screen.Height div 22;

  //Schrift
  Konstantenbox.Ueberschrift:= Screen.Width div 96;
  Konstantenbox.Schrift:= Screen.Width div 160
end;

procedure TFrmHaupt.FormCreate(Sender: TObject);
begin
  dynamischeKonstanten;
  TabOrder;
  HomeSettings;
  HeadingSettings;
  BtnStartSettings;
  LogoSettings;
  BtnVersuchsaufbauSettings;
  LInfoSettings;

  TimerProjektionsflaeche.Enabled:= false;

  FrmHaupt.BorderStyle:= bsNone;

  BtnBeenden.Caption:= 'Beenden';
  BtnBeenden.Top:=(FrmHaupt.ClientHeight div 6)*5+15;
  BtnBeenden.Left:=(FrmHaupt.ClientWidth div 5)*4;
end;

//Eigenschaften des Hauptmenues
procedure TFrmHaupt.HomeSettings();
begin
  FrmHaupt.Width := 400;
  FrmHaupt.Height := 400;
  FrmHaupt.BorderStyle := bsDialog;
  FrmHaupt.Caption := 'Interferenzo - Home';
  FrmHaupt.Position := poScreenCenter;
end;

//Eigenschaften der Ueberschrift
procedure TFrmHaupt.HeadingSettings;
begin
  LProgrammname.AutoSize := false;
  LProgrammname.Left := 0;
  LProgrammname.Top := FrmHaupt.Height div 20;
  LProgrammname.Width := FrmHaupt.Width;
  LProgrammname.Font.Size := Konstantenbox.Ueberschrift;
  LProgrammname.Height := LProgrammname.Font.Size + 10;
  LProgrammname.Alignment := tacenter;
  LProgrammname.Layout := tlcenter;
  LProgrammname.Caption := 'Interferenzo';
  LProgrammname.Font.Color := Konstantenbox.Schriftfarbe;
  LProgrammname.Font.Style := [fsunderline];
  LProgrammname.Font.Name:= Konstantenbox.Schriftart;
end;

//Zeigen der Projektionsflaeche und Verstecken des Hauptmenues
procedure TFrmHaupt.BtnBeendenClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmHaupt.BtnStartClick(Sender: TObject);
begin
  FrmProjektionsflaeche.Show;
  TimerProjektionsflaeche.Enabled:= true;
  FrmProjektionsflaeche.Reset;
end;


//Eigenschaften des Start-Buttons
procedure TFrmHaupt.BtnStartSettings;
begin
  BtnStart.Top := LProgrammname.Top + Round(2.5*(FrmHaupt.Height div 5));
  BtnStart.Left := FrmHaupt.Width div 10;
  BtnStart.Width := FrmHaupt.Width - (FrmHaupt.Width div 5);
  BtnStart.Caption := 'Start';
  BtnStart.Font.Size:= Konstantenbox.Schrift;
  BtnStart.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnStart.Font.Name:= Konstantenbox.Schriftart;
end;

procedure TFrmHaupt.LogoSettings;
var Path: String;
begin
  Path:= GetCurrentDir;

  ImgLogo.Stretch:= true;
  ImgLogo.Top:= LProgrammname.Top + LProgrammname.Height + FrmHaupt.Height div 20;
  ImgLogo.Height:= BtnStart.Top - ImgLogo.Top - FrmHaupt.Height div 20;
  ImgLogo.Width:= ImgLogo.Height;
  ImgLogo.Left:= FrmHaupt.Width div 2 - ImgLogo.Width div 2;
  ImgLogo.Picture.LoadFromFile(Path+'\Interferenzo_Logo.png');
end;


procedure TFrmHaupt.BtnVersuchsaufbauClick(Sender: TObject);
begin
  FormVersuchsuebersicht.ShowModal;
end;

//Eigenschaften des Versuchsaufbau-Buttons
procedure TFrmHaupt.BtnVersuchsaufbauSettings;
begin
  BtnVersuchsaufbau.Top := BtnStart.Top + (FrmHaupt.Height div 10);
  BtnVersuchsaufbau.Left := BtnStart.Left;
  BtnVersuchsaufbau.Width := BtnStart.Width;
  BtnVersuchsaufbau.Caption := 'Versuchsübersicht';
  //BtnVersuchsaufbau.Size:= Konstantenbox.Schrift;
  //BtnVersuchsaufbau.Color:= Konstantenbox.Schriftfarbe;
  BtnVersuchsaufbau.Name:= Konstantenbox.Schriftart;
end;


procedure TFrmHaupt.LInfoClick(Sender: TObject);
begin
  FormInfo.ShowModal;
end;

//Eigenschaften des Info-Labels (Inhalt: Nutzungsbedingungen und Kontakt)
procedure TFrmHaupt.LInfoSettings;
begin
  LInfo.Autosize := false;
  LInfo.Left := 0;
  LInfo.Top := FrmHaupt.Height - (FrmHaupt.Height div 5);
  LInfo.Width := FrmHaupt.Width;
  LInfo.Font.Size := Konstantenbox.Schrift;
  LInfo.Height := LInfo.Font.Size + 10;
  LInfo.Alignment := tacenter;
  LInfo.Layout := tlcenter;
  LInfo.Caption := 'Nutzungsbedingungen und Kontaktinformationen';
  LInfo.Font.Style:=[fsUnderline];
  LInfo.Font.Color := Konstantenbox.Schriftfarbe;
  LInfo.Font.Name:= Konstantenbox.Schriftart;
end;

//Oeffnen des Hauptmenues beim Schließen der Projektionsflaeche
procedure TFrmHaupt.TimerProjektionsflaecheTimer(Sender: TObject);
begin
  if FrmProjektionsflaeche.Visible= false then
  begin
    FrmHaupt.Visible:= true;
    TimerProjektionsflaeche.Enabled:= false;
  end;
end;

end.
