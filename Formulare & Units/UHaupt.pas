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
    BtnBeenden: TButton;
    ImgLogo: TImage;
    procedure FormCreate(Sender: TObject);
    procedure HomeSettings;
    procedure HeadingSettings;
    procedure BtnStartSettings;
    procedure LogoSettings;
    procedure BtnVersuchsaufbauSettings;
    procedure LInfoSettings;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnStartClick(Sender: TObject);
    procedure BtnVersuchsaufbauClick(Sender: TObject);
    procedure LInfoClick(Sender: TObject);
    procedure BtnBeendenClick(Sender: TObject);
    procedure dynamischeKonstanten;
    procedure TabOrder;
    procedure BtnBeendenSettings;
    procedure FensterSettings;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmHaupt: TFrmHaupt;
  //Hilfsvariable für LInfo - enthaelt BtnVersuchsaufbau.Top
  VUTop: Integer;
  //Hilfsvariable für LInfo - enthält BtnVersuchsaufbau.Height
  VUHeight: Integer;

implementation

{$R *.dfm}

procedure TFrmHaupt.FormCreate(Sender: TObject);
begin
  //Um Skalierung von dem OS zu verhindern
  FrmHaupt.Scaled:= false;

  dynamischeKonstanten;
  TabOrder;
  HomeSettings;
  HeadingSettings;
  LogoSettings;
  BtnStartSettings;
  BtnVersuchsaufbauSettings;
  LInfoSettings;
  BtnBeendenSettings;
  Fenstersettings;
end;

procedure TFrmHaupt.dynamischeKonstanten;
begin
  //Festlegen der Bildschirmspezifischen Konstanten (Abhaengig von der Aufloesung des Bildschirms)

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

procedure TFrmHaupt.TabOrder;
begin
  BtnStart.TabStop:= true;
  BtnStart.TabOrder:= 0;
  BtnVersuchsaufbau.TabStop:= true;
  BtnVersuchsaufbau.TabOrder:= 1;
  BtnBeenden.TabStop:= true;
  BtnBeenden.TabOrder:= 2;
end;

//Eigenschaften des Hauptmenues
procedure TFrmHaupt.HomeSettings;
begin
  FrmHaupt.BorderStyle:= bsNone;
  FrmHaupt.Caption:= 'Interferenzo - Home';
end;

//Eigenschaften der Ueberschrift
procedure TFrmHaupt.HeadingSettings;
begin
  LProgrammname.AutoSize:= true;
  LProgrammname.WordWrap:= false;
  LProgrammname.Left:= 0;
  LProgrammname.Top:= Screen.Height div 54;
  LProgrammname.Alignment:= taCenter;
  LProgrammname.Caption:= 'Interferenzo';
  LProgrammname.Font.Style:= [fsunderline];
  LProgrammname.Font.Size:= Konstantenbox.Ueberschrift;
  LProgrammname.Font.Color:= Konstantenbox.Schriftfarbe;
  LProgrammname.Font.Name:= Konstantenbox.Schriftart;
end;

procedure TFrmHaupt.LogoSettings;
var Path: String;
begin
  Path:= GetCurrentDir;

  ImgLogo.Stretch:= true;
  ImgLogo.Top:= LProgrammname.Top + LProgrammname.Height + (Screen.Height div 54);
  ImgLogo.Height:= Screen.Height div 5;
  ImgLogo.Width:= ImgLogo.Height;
  //ImgLogo.Left:= FrmHaupt.Width div 2 - ImgLogo.Width div 2;
  ImgLogo.Picture.LoadFromFile(Path+'\Interferenzo_Logo.png');
end;

//Eigenschaften des Start-Buttons
procedure TFrmHaupt.BtnStartSettings;
begin
  BtnStart.Top:= ImgLogo.Top + ImgLogo.Height + (Screen.Height div 54);
  BtnStart.Left := 0; //FrmHaupt.Width div 10;
  BtnStart.Width:= Screen.Width div 6;
  BtnStart.Caption:= 'Start';
  BtnStart.Font.Size:= Konstantenbox.Ueberschrift;
  BtnStart.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnStart.Font.Name:= Konstantenbox.Schriftart;
  BtnStart.Height:= (-1 * BtnStart.Font.Height) + (Screen.Height div 100);
end;

//Eigenschaften des Versuchsaufbau-Buttons
procedure TFrmHaupt.BtnVersuchsaufbauSettings;
begin
  BtnVersuchsaufbau.Top:= BtnStart.Top + BtnStart.Height + (Screen.Height div 54);
  //VUTop:= BtnVersuchsaufbau.Top;
  BtnVersuchsaufbau.Left := 0; //BtnStart.Left;
  BtnVersuchsaufbau.Width:= Screen.Width div 7;
  BtnVersuchsaufbau.Caption:= 'Versuchsübersicht';
  BtnVersuchsaufbau.Font.Size:= Konstantenbox.Schrift;
  BtnVersuchsaufbau.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnVersuchsaufbau.Font.Name:= Konstantenbox.Schriftart;
  BtnVersuchsaufbau.Height:= (-1 * BtnVersuchsaufbau.Font.Height) + (Screen.Height div 100);
end;

//Eigenschaften des Info-Labels (Inhalt: Nutzungsbedingungen und Kontakt)
procedure TFrmHaupt.LInfoSettings;
begin
  LInfo.Autosize:= true;
  LInfo.WordWrap:= false;
  LInfo.Left := Screen.Height div 54;
  LInfo.Top:=  BtnVersuchsaufbau.Top + BtnVersuchsaufbau.Height + (Screen.Height div 54);
  LInfo.Alignment:= tacenter;
  LInfo.Caption:= 'Nutzungsbedingungen und Kontaktinformationen';
  LInfo.Font.Style:=[fsUnderline];
  LInfo.Font.Size:= Konstantenbox.Schrift;
  LInfo.Font.Color:= Konstantenbox.Schriftfarbe;
  LInfo.Font.Name:= Konstantenbox.Schriftart;
end;

procedure TFrmHaupt.BtnBeendenSettings;
begin
  BtnBeenden.Top:= LInfo.Top + LInfo.Height + (Screen.Height div 54);
  BtnBeenden.Width:= BtnStart.Width div 3;
  BtnBeenden.Caption:= 'Beenden';
  BtnBeenden.Font.Size:= Konstantenbox.Schrift;
  BtnBeenden.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnBeenden.Font.Name:= Konstantenbox.Schriftart;
  BtnBeenden.Height:= (-1 * BtnBeenden.Font.Height) + (Screen.Height div 100);
  BtnBeenden.Left:= 0 //(FrmHaupt.ClientWidth div 5)*4;}
end;

procedure TFrmHaupt.FensterSettings;
begin
  FrmHaupt.Width:= LInfo.Width + (2 * (Screen.Height div 54));
  FrmHaupt.Height:= BtnBeenden.Top + BtnBeenden.Height + (Screen.Height div 54);
  LProgrammname.Left:= (FrmHaupt.Width div 2) - (LProgrammname.Width div 2);
  ImgLogo.Left:= (FrmHaupt.Width div 2) - (ImgLogo.Width div 2);
  BtnStart.Left:= (FrmHaupt.Width div 2) - (BtnStart.Width div 2);
  BtnVersuchsaufbau.Left:= (FrmHaupt.Width div 2) - (BtnVersuchsaufbau.Width div 2);
  BtnBeenden.Left:= FrmHaupt.Width - BtnBeenden.Width - (Screen.Height div 54);

  FrmHaupt.Position:= poScreenCenter;
end;

procedure TFrmHaupt.BtnStartClick(Sender: TObject);
begin
  FrmProjektionsflaeche.ShowModal;
  FrmProjektionsflaeche.Reset;
end;

procedure TFrmHaupt.BtnVersuchsaufbauClick(Sender: TObject);
begin
  FormVersuchsuebersicht.ShowModal;
end;

procedure TFrmHaupt.LInfoClick(Sender: TObject);
begin
  FormInfo.ShowModal;
end;

//Programm beim Schliessen terminieren
procedure TFrmHaupt.BtnBeendenClick(Sender: TObject);
begin
  Application.Terminate;
end;
procedure TFrmHaupt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
