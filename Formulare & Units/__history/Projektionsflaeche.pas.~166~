unit Projektionsflaeche;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Math,
  graphische_Optionen, UFarbtabelle, UToolbox, Vcl.ComCtrls, Konstantenbox;

type
  TFrmProjektionsflaeche = class(TForm)
    Schirm: TImage;
    PnlOptionen: TPanel;
    EdtEingabe: TEdit;
    EdtAusgabe: TEdit;
    EdtSchirmAbstand: TEdit;
    LblSchirmAbstand: TLabel;
    LblSpaltanzahl: TLabel;
    EdtSpaltanzahl: TEdit;
    LblSpaltabstand: TLabel;
    EdtSpaltabstand: TEdit;
    BtnOptionen: TButton;
    PnlFarbe: TPanel;
    PnlFarbeCaption: TPanel;
    PnlViolett: TPanel;
    PnlBlau: TPanel;
    PnlGruen: TPanel;
    PnlGelb: TPanel;
    PnlOrange: TPanel;
    PnlRot: TPanel;
    ImgLineal: TImage;
    TBZoom: TTrackBar;
    BtnStart: TButton;
    BtnBeenden: TButton;
    LblHilfeSchirm: TLabel;
    BtnHilfe: TButton;
    LblHilfeEinstellungen: TLabel;
    LblHilfeEinstellungen2: TLabel;
    BtnReset: TButton;
    CmbEinheit: TComboBox;
    EdtAusgabeEinheit: TEdit;
    LblLinealEinheit: TLabel;
    ImgIntensitaet: TImage;
    EdtSpaltbreite: TEdit;
    LblSpaltbreite: TLabel;
    EdtEingabeEinheit: TEdit;
    LblEingabe: TLabel;
    LblAusgabe: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnOptionenClick(Sender: TObject);
    procedure Fenstereinstellungen;
    procedure Canvaseinstellungen;
    procedure Optionen;
    procedure Optionspanel;
    procedure Option_Eingabe;
    procedure Option_Ausgabe;
    procedure Option_Abstand_Blende_Schirm;
    procedure Option_Spaltanzahl;
    procedure Option_Spaltabstand;
    procedure Option_Spaltbreite;
    procedure graphische_Optionen;
    procedure Option_Farbe;
    procedure Farbe_Panel;
    procedure Farbe_Violett;
    procedure Farbe_Blau;
    procedure Farbe_Gruen;
    procedure Farbe_Gelb;
    procedure Farbe_Orange;
    procedure Farbe_Rot;
    procedure Linealskala;
    procedure Lineal;
    procedure Zoomleiste;
    procedure TBZoomChange(Sender: TObject);
    procedure Zeichnen(wellenlaenge:Real);
    procedure PnlViolettClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure Startbutton;
    procedure Background();
    procedure DrawBackground(Flaeche: TImage);
    procedure DrawGradientH(Canvas: TCanvas; Color1, Color2: TColor; Rect: TRect);
    procedure PnlBlauClick(Sender: TObject);
    procedure PnlGruenClick(Sender: TObject);
    procedure PnlGelbClick(Sender: TObject);
    procedure PnlOrangeClick(Sender: TObject);
    procedure PnlRotClick(Sender: TObject);
    procedure BtnBeendenClick(Sender: TObject);
    procedure Endbutton;
    procedure BtnHilfeClick(Sender: TObject);
    procedure Hilfe;
    procedure Hilfe_aus;
    procedure HilfeButton;
    procedure Schrifteinstellungen;
    procedure EdtEingabeKeyPress(Sender: TObject; var Key: Char);
    function  dynamicZoom (Zahl: Real):Real;
    procedure Resetbutton;
    procedure Reset;
    procedure BtnResetClick(Sender: TObject);
    procedure Combobox;
    procedure EdtEingabeEinheiten;
    procedure EdtAusgabeEinheiten;
    procedure EdtEingabeChange(Sender: TObject);
    procedure EditFuellerBeiPanelbedienung(Wellenlaenge:Real);
    procedure FormActivate(Sender: TObject);
    procedure CmbEinheitChange(Sender: TObject);
    procedure ImageIntensitaet();
    procedure Intensitaetsverlauf_Einzelspalt(wellenlaenge:real);
    procedure Intensitaetsverlauf_Doppelspalt(wellenlaenge:real);
    procedure Intensitaetsverlauf_Gitter(Wellenlaenge:real);
    procedure EdtSpaltbreiteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSpaltanzahlKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSchirmAbstandKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSpaltabstandKeyPress(Sender: TObject; var Key: Char);
    procedure Strich_Zeichnen(x:Integer;farbe:TColor);
    function Intensitaet_Farbe(Farbe, Hintergrundfarbe: TColor; Intensitaet:real):TColor;
    procedure TBZoomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmProjektionsflaeche: TFrmProjektionsflaeche;
  GSchirmAbstand : real;
  GWellenlaenge : real;
  GSpaltabstand : real;
  GMaximaAbstand : real;
  GDynZoom : Real;
  GZoom : Integer;
  GHilfe : Boolean;
  GLineal : Boolean;
  GStartet : Boolean;    //haha WortWitz->GeStarted haha

implementation

{$R *.dfm}

procedure TFrmProjektionsflaeche.Farbe_Rot;
begin
  PnlRot.Top:= PnlGelb.Top + PnlGelb.Height;
  PnlRot.Left:= PnlOrange.Width;
  PnlRot.Width:= Round(PnlFarbe.Width / 2);
  PnlRot.Height:= Round(PnlFarbe.Height * (1/4));
  PnlRot.Caption:= '';
  PnlRot.ParentBackground:= false;
  PnlRot.Color:= StringToColor('$00' + Ufarbtabelle.Farbe(Konstantenbox.KRot*(Power(10,(9)))));
  TBZoom.Visible:= true;
  PnlRot.Hint:='Klicken, um rotes Licht zu simulieren';
  PnlRot.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Farbe_Orange;
begin
  PnlOrange.Top:= PnlGruen.Top + PnlGruen.Height;
  PnlOrange.Left:= 0;
  PnlOrange.Width:= Round(PnlFarbe.Width / 2);
  PnlOrange.Height:= Round(PnlFarbe.Height * (1/4));
  PnlOrange.Caption:= '';
  PnlOrange.ParentBackground:= false;
  PnlOrange.Color:= StringToColor('$00' + Ufarbtabelle.Farbe(Konstantenbox.KOrange*(Power(10,(9)))));
  TBZoom.Visible:= true;
  PnlOrange.Hint:='Klicken, um oranges Licht zu simulieren';
  PnlOrange.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Farbe_Gelb;
begin
  PnlGelb.Top:= PnlBlau.Top + PnlBlau.Height;
  PnlGelb.Left:= PnlGruen.Width;
  PnlGelb.Width:= Round(PnlFarbe.Width / 2);
  PnlGelb.Height:= Round(PnlFarbe.Height * (1/4));
  PnlGelb.Caption:= '';
  PnlGelb.ParentBackground:= false;
  PnlGelb.Color:= StringToColor('$00' + Ufarbtabelle.Farbe(Konstantenbox.KGelb*(Power(10,(9)))));
  TBZoom.Visible:= true;
  PnlGelb.Hint:='Klicken, um gelbes Licht zu simulieren';
  PnlGelb.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Farbe_Gruen;
begin
  PnlGruen.Top:= PnlViolett.Top + PnlViolett.Height;
  PnlGruen.Left:= 0;
  PnlGruen.Width:= Round(PnlFarbe.Width / 2);
  PnlGruen.Height:= Round(PnlFarbe.Height * (1/4));
  PnlGruen.Caption:= '';
  PnlGruen.ParentBackground:= false;
  PnlGruen.Color:= StringToColor('$00' + Ufarbtabelle.Farbe(Konstantenbox.KGruen*(Power(10,(9)))));
  TBZoom.Visible:= true;
  PnlGruen.Hint:='Klicken, um grünes Licht zu simulieren';
  PnlGruen.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Farbe_Blau;
begin
  PnlBlau.Top:= PnlFarbeCaption.Top + PnlFarbeCaption.Height;
  PnlBlau.Left:= PnlViolett.Width;
  PnlBlau.Width:= Round(PnlFarbe.Width / 2);
  PnlBlau.Height:= Round(PnlFarbe.Height * (1/4));
  PnlBlau.Caption:= '';
  PnlBlau.ParentBackground:= false;
  PnlBlau.Color:= StringToColor('$00' + Ufarbtabelle.Farbe(Konstantenbox.KBlau*(Power(10,(9)))));
  TBZoom.Visible:= true;
  PnlBlau.Hint:='Klicken, um blaues Licht zu simulieren';
  PnlBlau.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Farbe_Violett;
begin
  PnlViolett.Top:= PnlFarbeCaption.Top + PnlFarbeCaption.Height;
  PnlViolett.Left:= 0;
  PnlViolett.Width:= Round(PnlFarbe.Width / 2);
  PnlViolett.Height:= Round(PnlFarbe.Height * (1/4));
  PnlViolett.Caption:= '';
  PnlViolett.ParentBackground:= false;
  PnlViolett.Color:= StringToColor('$00' + Ufarbtabelle.Farbe(Konstantenbox.KViolett*(Power(10,(9)))));
  TBZoom.Visible:= true;
  PnlViolett.Hint:='Klicken, um violettes Licht zu simulieren';
  PnlViolett.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Farbe_Panel;
begin
  PnlFarbe.Top:= (EdtAusgabe.Top + EdtAusgabe.Height) + 60;
  PnlFarbe.Height:=Round(BtnOptionen.Top - (EdtAusgabe.Top + EdtAusgabe.Height))-78;
  PnlFarbe.Left:= 0;
  PnlFarbe.Width:= Schirm.Left - PnlFarbe.Left;
  PnlFarbe.Caption:= '';

  PnlFarbeCaption.Top:= 0;
  PnlFarbeCaption.Left:= 0;
  PnlFarbeCaption.Width:= PnlFarbe.Width;
  PnlFarbeCaption.Height:= Round(PnlFarbe.Height * (1/4));
  PnlFarbeCaption.Caption:= 'Farbe';
end;

procedure TFrmProjektionsflaeche.Option_Farbe;
begin
  Farbe_Panel;
  Farbe_Violett;
  Farbe_Blau;
  Farbe_Gruen;
  Farbe_Gelb;
  Farbe_Orange;
  Farbe_Rot;
end;

procedure TFrmProjektionsflaeche.graphische_Optionen;
begin
  //Button graphische Optionen
  BtnOptionen.Height:= 30;
  BtnOptionen.Top:= LblSpaltbreite.Top - BtnOptionen.Height - 15;
  BtnOptionen.Left:= 20;
  BtnOptionen.Width:= Schirm.Left - (BtnOptionen.Left * 2);
  BtnOptionen.Caption:= 'graphische Optionen';
  BtnOptionen.hint:='Klicken, um graphische Optionen anzuzeigen';
end;

procedure TFrmProjektionsflaeche.Option_Spaltabstand;
begin
  //Option Spaltabstand
  EdtSpaltabstand.Top:= LblSpaltanzahl.Top - EdtSpaltabstand.Height - 5;
  EdtSpaltabstand.Left:= Konstantenbox.KEditLeft;
  EdtSpaltabstand.Width:= Schirm.Left - EdtSpaltabstand.Left;
  EdtSpaltabstand.Text:= '1';
  EdtSpaltabstand.Hint:='Spaltabstand von X bis Y mm eingeben';
  EdtSpaltabstand.ShowHint:=true;

  LblSpaltabstand.Top:= EdtSpaltabstand.Top - LblSpaltabstand.Height;
  LblSpaltabstand.Left:= Konstantenbox.KLabelLeft;
  LblSpaltabstand.Width:= Schirm.Left - LblSpaltabstand.Left;
  LblSpaltabstand.Caption:= 'Spaltabstand d in mm';
end;

procedure TFrmProjektionsflaeche.Option_Spaltanzahl;
begin
  //Option Spaltanzahl
  EdtSpaltanzahl.Top:= LblSchirmAbstand.Top - EdtSpaltanzahl.Height - 5;
  EdtSpaltanzahl.Left:= Konstantenbox.KEditLeft;
  EdtSpaltanzahl.Width:= Schirm.Left - EdtSpaltanzahl.Left;
  EdtSpaltanzahl.Text:= '2';
  EdtSpaltanzahl.Hint:='Spaltanzahl von 1 bis X eingeben';
  EdtSpaltanzahl.ShowHint:=true;

  LblSpaltanzahl.Top:= EdtSpaltanzahl.Top - LblSpaltanzahl.Height;
  LblSpaltanzahl.Left:= Konstantenbox.KLabelLeft;
  LblSpaltanzahl.Width:= Schirm.Left - LblSpaltanzahl.Left;
  LblSpaltanzahl.Caption:= 'Spaltanzahl n';
end;

procedure TFrmProjektionsflaeche.Option_Spaltbreite;
begin
  //Option Spaltbreite
  EdtSpaltbreite.Top:= LblSpaltabstand.Top - EdtSpaltbreite.Height - 5;
  EdtSpaltbreite.Left:= Konstantenbox.KEditLeft;
  EdtSpaltbreite.Width:= Schirm.Left - EdtSpaltbreite.Left;
  EdtSpaltbreite.Text:= '0.1';
  EdtSpaltbreite.Hint:='Spaltbreite von X bis Y mm eingeben';
  EdtSpaltbreite.ShowHint:=true;

  LblSpaltbreite.Top:= EdtSpaltbreite.Top - LblSpaltbreite.Height;
  LblSpaltbreite.Left:= Konstantenbox.KLabelLeft;
  LblSpaltbreite.Width:= Schirm.Left - LblSpaltbreite.Left;
  LblSpaltbreite.Caption:= 'Spaltbreite b in mm';
end;

procedure TFrmProjektionsflaeche.Option_Abstand_Blende_Schirm;
begin
  //Option Abstand Blende-Schirm
  EdtSchirmAbstand.Top:= FrmProjektionsflaeche.ClientHeight - (10 + EdtSchirmAbstand.Height);
  EdtSchirmAbstand.Left:= Konstantenbox.KEditLeft;
  EdtSchirmAbstand.Width:= Schirm.Left - EdtSchirmAbstand.Left;
  EdtSchirmAbstand.Text:= '10';
  EdtSchirmAbstand.Hint:='Abstand zwischen Spalt und Schirm von X bis Y eingeben';
  EdtSchirmAbstand.ShowHint:=true;

  LblSchirmAbstand.Top:= EdtSchirmAbstand.Top - LblSchirmAbstand.Height;
  LblSchirmAbstand.Left:= Konstantenbox.KLabelLeft;
  LblSchirmAbstand.Width:= Schirm.Left - LblSchirmAbstand.Left;
  LblSchirmAbstand.Caption:= 'Abstand Blende-Schirm e in m';
end;

procedure TFrmProjektionsflaeche.Option_Ausgabe;
begin
  //Option Frequenz
  LblAusgabe.Top:= 5 + EdtEingabe.Top + EdtEingabe.Height;
  LblAusgabe.Left:= Konstantenbox.KLabelLeft;
  LblAusgabe.Width:= Schirm.Left - LblAusgabe.Left;
  LblAusgabe.Caption:= 'Frequenz f';

  EdtAusgabe.Top:= LblAusgabe.Top + LblAusgabe.Height;
  EdtAusgabe.Left:= Konstantenbox.KEditLeft;
  EdtAusgabe.Width:= (Schirm.Left - EdtAusgabe.Left) div 3*2;
  EdtAusgabe.Text:= '';
  EdtAusgabe.ReadOnly:=false;
end;

procedure TFrmProjektionsflaeche.Option_Eingabe;
begin
  //Option Wellenlänge
  LblEingabe.Top:= 5 + CmbEinheit.Top + CmbEinheit.Height;
  LblEingabe.Left:= Konstantenbox.KLabelLeft;
  LblEingabe.Width:= Schirm.Left - LblEingabe.Left;
  LblEingabe.Caption:= 'Wellenlänge λ';

  EdtEingabe.Top:= LblEingabe.Top + LblEingabe.Height;
  EdtEingabe.Left:= Konstantenbox.KEditLeft;
  EdtEingabe.Width:= (Schirm.Left - EdtEingabe.Left) div 3*2;
  EdtEingabe.Text:= '500';
  EdtEingabe.ShowHint:=true;
  EdtEingabe.Hint:='Wellenlänge von 380 bis 720 nm eingeben';
end;


procedure TFrmProjektionsflaeche.Optionspanel;
begin
  //Panel Optionen
  PnlOptionen.Caption:= 'Optionen';
  PnlOptionen.Left:= 0;
  PnlOptionen.Top:= 10;
  PnlOptionen.Width:= Schirm.Left;
  PnlOptionen.Height:= Konstantenbox.KPanelHoehe;
end;

procedure TFrmProjektionsflaeche.Optionen;
begin
  Optionspanel;
  Option_Eingabe;
  Option_Ausgabe;
  Option_Abstand_Blende_Schirm;
  Option_Spaltanzahl;
  Option_Spaltabstand;
  Option_Spaltbreite;
  graphische_Optionen;
  Option_Farbe;
end;


procedure TFrmProjektionsflaeche.Canvaseinstellungen;
begin
  //Image zu Canvas
  Schirm.Canvas;

  //Canvasgroeße veraenderbar machen
  Schirm.Stretch:= true;

  //Canvasgroeße
  Schirm.Width:= Round((4/5) * FrmProjektionsflaeche.Width);
  Schirm.Height:= Round((3/5) * FrmProjektionsflaeche.Height);

  //Canvasposition
  Schirm.Left:= FrmProjektionsflaeche.Width - Schirm.Width;
  Schirm.Top:= 0;

end;

procedure TFrmProjektionsflaeche.CmbEinheitChange(Sender: TObject);
begin
  if CmbEinheit.ItemIndex= 0
    then begin
      LblEingabe.caption:='Wellenlänge λ';
      LblAusgabe.caption:='Frequenz f';
      EdtEingabeEinheit.Text:='nm';
      EdtAusgabeEinheit.Text:='10^13Hz';
      EdtEingabe.Hint:='Wellenlänge von 380 bis 780 nm eingeben';
    end
    else begin
      LblEingabe.Caption:='Frequenz f';
      LblAusgabe.Caption:='Wellenlaenge λ';
      EdtEingabeEinheit.Text:='10^13Hz';
      EdtAusgabeEinheit.Text:='nm';
      EdtEingabe.Hint:='Frequenz von 38 bis 79 x10^13Hz eingeben';
    end;
end;

procedure TFrmProjektionsflaeche.Fenstereinstellungen;
begin
  //Namensgebung
  FrmProjektionsflaeche.Caption:= 'Interferenzo - Projektionsfläche';

  //Vollbild
  FrmProjektionsflaeche.BorderStyle:= bsNone;
  FrmProjektionsflaeche.ClientHeight:= Screen.Height;
  FrmProjektionsflaeche.ClientWidth:= Screen.Width;
  FrmProjektionsflaeche.WindowState:= wsMaximized;

  //Fensterposition
  Position:= poScreenCenter;

  //Pixeldichte festlegen (Full-HD 21,5 Zoll)
  PixelsPerInch:= 102;

  //Fontgroeße festlegen (Full-HD 21,5 Zoll)
  Font.Height:= -13;
end;

procedure TFrmProjektionsflaeche.BtnBeendenClick(Sender: TObject);
begin
  FrmProjektionsflaeche.close;
  Reset;
end;

procedure TFrmProjektionsflaeche.BtnOptionenClick(Sender: TObject);
begin
  FrmGraphischeOptionen.Show;
end;

//Hilfebutton Einstellungen bestimmen
procedure TFrmProjektionsflaeche.HilfeButton;
begin
  BtnHilfe.Width:=Round((PnlFarbe.Width-6)/5);
  BtnHilfe.Height:=Konstantenbox.Schrift+10;
  BtnHilfe.Top:=(EdtAusgabe.Top + EdtAusgabe.Height) + 10;
  BtnHilfe.Left:=BtnBeenden.Left+BtnReset.Width+5;
  BtnHilfe.Caption:= 'Hilfe';
  BtnHilfe.Hint:='Klicken, um Hilfe anzuzeigen';
  BtnHilfe.ShowHint:=true;

  //Alle Labels unsichtbar machen
  LblHilfeSchirm.Visible:= false;
  LblHilfeEinstellungen.Visible:= false;
  LblHilfeEinstellungen2.Visible:= false;

  //Hilfe ist inaktiv -> GHilfe:= false
  GHilfe:= false;
end;

procedure TFrmProjektionsflaeche.BtnHilfeClick(Sender: TObject);
begin
  if GHilfe=false then Hilfe else Hilfe_aus;
end;

procedure TFrmProjektionsflaeche.BtnResetClick(Sender: TObject);
begin
  Reset;
end;

procedure TFrmProjektionsflaeche.Hilfe;
begin
  BtnHilfe.Hint:='Klicken, um Hilfe zu verbergen';

  //Hilfe Schirm
  LblHilfeSchirm.Visible:= true;
  LblHilfeSchirm.Top:= 50;
  LblHilfeSchirm.Left:= Round(Schirm.Width / 2);
  LblHilfeSchirm.Transparent:=false;
  LblHilfeSchirm.Color:=clwhite;
  LblHilfeSchirm.Caption:= 'Hier werden die simulierten Maxima angezeigt (siehe Versuchsübersicht).';

  //Hilfe Einstellungen
  LblHilfeEinstellungen.Visible:= true;
  LblHilfeEinstellungen.Top:=Round(Schirm.Height / 2);
  LblHilfeEinstellungen.Left:= Schirm.Left + 20;
  LblHilfeEinstellungen.Transparent:=false;
  LblHilfeEinstellungen.Color:=clwhite;
  LblHilfeEinstellungen.Caption:= '<-- Einstellungen - Veränderbare Werte des Versuchs sind:';

  //Hilfe Einstellungen Details
  LblHilfeEinstellungen2.Visible:= true;
  LblHilfeEinstellungen2.Top:= LblHilfeEinstellungen.Top + LblHilfeEinstellungen.Height;
  LblHilfeEinstellungen2.Left:= LblHilfeEinstellungen.Left;
  LblHilfeEinstellungen2.Transparent:=false;
  LblHilfeEinstellungen2.Color:=clwhite;
  LblHilfeEinstellungen2.Caption:= 'Wellenlänge, Frequenz oder Farbe (zum Auswählen der Farbe auf diese klicken)';

  //experimento v5
  EdtEingabe.ShowHint:=true;
  EdtEingabe.Hint:='Frequenz oder Wellenlaenge eingeben';

  //dem Programm mitteilen, dass das Overlay eingeblendet ist
  GHilfe:= true;
end;

procedure TFrmProjektionsflaeche.Hilfe_aus;
begin
  BtnHilfe.Hint:='Klicken, um Hilfe anzuzeigen';

  //alle Overlay-Labels verstecken
  LblHilfeSchirm.Visible:= false;
  LblHilfeEinstellungen.Visible:= false;
  LblHilfeEinstellungen2.Visible:= false;

  //dem Programm mitteilen, dass das Overlay ausgeblendet ist
  GHilfe:= false;
end;

procedure TFrmProjektionsflaeche.FormActivate(Sender: TObject);
begin
  //graphische Optionen schließen beim Klick in die Projektionsflaeche
  FrmGraphischeOptionen.close;
  //Hintergrund aktualisieren
  Background;
  //Neu Zeichnen
  if GStartet=true then BtnStart.Click;
end;

procedure TFrmProjektionsflaeche.FormCreate(Sender: TObject);
begin
  Schrifteinstellungen;
  Fenstereinstellungen;
  Canvaseinstellungen;
  Optionen;
  Lineal;
  Startbutton;
  Resetbutton;
  Endbutton;
  Zoomleiste;
  HilfeButton;
  ImageIntensitaet;
  //Schrifteinstellungen;
  Combobox;
  EdtEingabeEinheiten;
  EdtAusgabeEinheiten;
  //to be aufgeräumt
  GStartet:=false;
end;

procedure TFrmProjektionsflaeche.Startbutton;
begin
  BtnStart.Top:=(EdtAusgabe.Top + EdtAusgabe.Height) + 10;
  BtnStart.Left:=Round((PnlFarbe.Width)/17);
  BtnStart.Width:=Round((PnlFarbe.Width)/5);
  BtnStart.Height:=Konstantenbox.Schrift+10;
  BtnStart.Caption:='Start';
  BtnStart.Hint:='Klicken, um die Simulation zu starten';
  BtnStart.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Resetbutton;
begin
  BtnReset.Top := BtnStart.Top;
  BtnReset.Left := BtnStart.left+BtnStart.width+5;
  BtnReset.Width :=Round((PnlFarbe.Width-6)/5);
  BtnReset.Height := Konstantenbox.Schrift+10;
  BtnReset.Caption := 'Reset';
  BtnReset.Hint:= 'Klicken, um auf Anfangszustand zurückzusetzen';
  BtnReset.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Endbutton;
begin
  BtnBeenden.Top:=(EdtAusgabe.Top + EdtAusgabe.Height) + 10;
  BtnBeenden.Left:=BtnReset.Left+BtnReset.width+5;
  BtnBeenden.Width:=Round((PnlFarbe.Width-6)/5);
  BtnBeenden.Height:=Konstantenbox.Schrift+10;
  BtnBeenden.Caption:='Beenden';
  BtnBeenden.Hint:='Klicken, um zu Beenden';
  BtnBeenden.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Zoomleiste;
begin
  TBzoom.TickStyle:=tsAuto;
  TBZoom.Height:=20;
  TBZoom.Width:=120;
  TBZoom.Top:=ImgLineal.Top-TBZoom.Height;
  TBZoom.Left:=FrmProjektionsflaeche.Width-TBZoom.Width;
  TBzoom.Max:=200;
  TBZoom.Min:=2;
  TBZoom.Frequency:=2;
  TBZoom.Position:=100;
  TBZoom.Visible:=False;
  TBZoom.Hint:='Verschieben, um die Vergrößerung in Prozent einzustellen';
  TbZoom.ShowHint:=true;
end;

procedure TFrmProjektionsflaeche.Lineal;
var Exponent : Integer;
begin
  Exponent:=1;
  if GDynZoom>0 then Exponent:=GZoom;

  //Groeße und Position des Image
  ImgLineal.Height:=Round((1/15) * FrmProjektionsflaeche.Height);
  ImgLineal.Width:= Schirm.Width;
  ImgLineal.Left:=FrmProjektionsflaeche.Width-ImgLineal.Width;
  ImgLineal.Top:=Round(FrmProjektionsflaeche.Height*3/5);
  with ImgLineal.canvas do
    begin
      pen.Color:=ClBlack;
    //Umriss des Lineals
      Moveto(ImgLineal.Width,0);
      Lineto(0,0);
      //Moveto(Round(ImgLineal.Width*21/22),Round(imgLineal.Height*5/6));
      //Textout(penpos.x,penpos.y,'in m');
    end;
  Linealskala;
  //Einheit-Label
  With LblLinealEinheit do
  begin
    Top:=Round(ImgLineal.Top+ImgLineal.Height*95/115);
    Left:=Round(ImgLineal.Left+ImgLineal.Width*95/100);
    Font.Size:=10;
    AutoSize:=true;
    Caption:='x10^-' +IntToStr(Exponent)+ 'm';
  end;
end;

procedure TFrmProjektionsflaeche.Linealskala; //Skala des Lineals
var
  Strichabstand, I,J,K : Integer;
  Beschriftung: Real;
begin
  if GLineal=false then else
  //Graphische Optionen - CBLineal
  // if graphische_Optionen.CBLineal.checked:=true then
  Strichabstand:=100;
  J:=0;
  K:=0;
  with ImgLineal.Canvas do
    begin
      //Striche von Mitte->Links mit Beschriftung
      for I := Round(ImgLineal.Width/2) to (ImgLineal.Width-11) do
        begin
          J:=J+1;
          if J = Strichabstand then begin
                                   moveto(I,1);
                                   lineto(I,Round(ImgLineal.Height/3*2));
                                   J:=0;
                                   K:=K+1;
                                   //Beschriftung:=K/GDynZoom/(TBZoom.position/100);
                                   Beschriftung:=K/(TBZoom.position/100);
                                   textout(penpos.X-2,penpos.Y,FloatToStr(RoundTo(Beschriftung,-4)));
                                 end;
        end;
      //Striche von Mitte->Rechts mit Beschriftung
      J:=Strichabstand;
      K:=-1;
      for I := Round(ImgLineal.Width/2)+Strichabstand downto 1 do
        begin
          J:=J-1;
          if J = 0 then begin
                          moveto(I,1);
                          lineto(I,Round(ImgLineal.Height/3*2));
                          J:=Strichabstand;
                          K:=K+1;
                          //Beschriftung:=K/GDynZoom/(TBZoom.position/100);
                          Beschriftung:=K/(TBZoom.position/100);
                          textout(penpos.X-2,penpos.Y,FloatToStr(RoundTo(Beschriftung,-4)));
                        end;

        end;
    end;
end;

procedure TFrmProjektionsflaeche.TBZoomChange(Sender: TObject);
begin
  GLineal:=true;
  if TBZoom.Position mod 2 = 0 then Zeichnen(GWellenlaenge)
  else begin
         //if key = leftarrow then
         // position:=position-1
         tbzoom.Position:=tbzoom.Position+1;
         // if key = rightarrow then
         // position:=position+1
       end;
end;

procedure TFrmProjektionsflaeche.TBZoomKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_left then tbzoom.Position:=tbzoom.Position-2;
end;

function TFrmProjektionsflaeche.dynamicZoom (Zahl: Real):Real;
var
  ZahlTest: Real;
  Success: Boolean;
begin
  Success:= false;
  GZoom:=0;
  repeat
  //z.B. 1,234 zu 1 machen oder 5,461 zu 5
  ZahlTest:= StrToFloat(System.SysUtils.FormatFloat('0.', Zahl));
  //wenn ZahlTest 0 oder kleiner ist, dann soll das Komma von Zahl um 1 nach links verschoben werden
  if ZahlTest<= 0 then begin
                         Zahl:= Zahl * 10;
                         GZoom:=GZoom+1;
                       end
                  else begin
                         Success:= true;
                         Result:=Power(10,GZoom);
                       end;
  until Success= true;
end;

//Loeschen von ungewollten Eingaben aus EdtEingabe (waehrend der Eingabe)
procedure TFrmProjektionsflaeche.EdtEingabeChange(Sender: TObject);
begin
  EdtAusgabe.Text:='';
end;

procedure TFrmProjektionsflaeche.EdtEingabeKeyPress(Sender: TObject;
  var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', ',', '.', Backspace];
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

procedure TFrmProjektionsflaeche.EdtSchirmAbstandKeyPress(Sender: TObject;
var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', ',','.' , Backspace];
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

procedure TFrmProjektionsflaeche.EdtSpaltabstandKeyPress(Sender: TObject;
var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', ',','.', Backspace];
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

procedure TFrmProjektionsflaeche.EdtSpaltanzahlKeyPress(Sender: TObject;
var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', Backspace];
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

procedure TFrmProjektionsflaeche.EdtSpaltbreiteKeyPress(Sender: TObject;
 var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', ',','.', Backspace];
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

/////////////////////////////////////////////////////////////////////////////////

//Berechnung und Zeichnen über Startbutton
procedure TFrmProjektionsflaeche.BtnStartClick(Sender: TObject);
var Frequenz: real;
    myFormatSettings : TFormatSettings;
begin
  //Programmstart
  GStartet:=true;
  TbZoom.Position:=100;
  GetLocaleFormatSettings(GetThreadLocale, myFormatSettings);
  //Fehlerabfrage für Spaltanzahl (1 zu 0 ändern, sobald Einzelspalt eingebaut)
  if STrToInt(EdtSpaltanzahl.Text)<1 then
    begin
      ShowMessage('Die angegebene Spaltanzahl ist zu niedrig.');
      exit;
    end;
  if STrToInt(EdtSpaltanzahl.Text)>=1001 then
    begin
      ShowMessage('Die angegebene Spaltanzahl ist zu hoch.');
      exit;
    end;

    //Fehlerabfrage für Spaltabstand

  EdtSpaltAbstand.Text:=StringReplace(EdtSpaltAbstand.Text,',',myFormatSettings.DecimalSeparator,[RfReplaceAll]);
  EdtSpaltAbstand.Text:=StringReplace(EdtSpaltAbstand.Text,'.',myFormatSettings.DecimalSeparator,[RfReplaceAll]);

    if StrToFloat(EdtSpaltabstand.Text)<=0 then
      begin
        ShowMessage('Der angegebene Spaltabstand ist zu niedrig.');
        exit;
      end;
    if StrToFloat(EdtSpaltabstand.Text)>=1001 then
      begin
        ShowMessage('Der angegebene Spaltabstand ist zu hoch.');
        exit;
      end;

    //Fehlerabfrage für Spaltbreite

  EdtSpaltBreite.Text:=StringReplace(EdtSpaltbreite.Text,',',myFormatSettings.DecimalSeparator,[RfReplaceAll]);
  EdtSpaltBreite.Text:=StringReplace(EdtSpaltbreite.Text,'.',myFormatSettings.DecimalSeparator,[RfReplaceAll]);

  if StrToFloat(EdtSpaltbreite.Text)<=0 then
    begin
      ShowMessage('Die angegebene Spaltbreite ist zu niedrig.');
      exit;
    end;
  if StrToFloat(EdtSpaltbreite.Text)>=1001 then
    begin
      ShowMessage('Die angegebene Spaltbreite ist zu hoch.');
      exit;
    end;


    //Fehlerabfrage für Abstand Blende-Spalt

  EdtSchirmAbstand.Text:=StringReplace(EdtSchirmAbstand.Text,',',myFormatSettings.DecimalSeparator,[RfReplaceAll]);
  EdtSchirmAbstand.Text:=StringReplace(EdtSchirmAbstand.Text,'.',myFormatSettings.DecimalSeparator,[RfReplaceAll]);

    if StrToFloat(EdtSchirmAbstand.Text)<= 0 then
      begin
        ShowMessage('Der angegebene Abstand des Schirms zur Blende ist zu niedrig.');
        exit;
      end;
    if StrToFloat(EdtSchirmAbstand.Text)>= 1001 then
      begin
        ShowMessage('Der angegebene Abstand des Schirms zur Blende ist zu hoch.');
        exit;
      end;


  //Fehlerabfrage für fehlende Eingabe
  if (EdtEingabe.Text = '') {and (EdtAusgabe.Text = '')} then
    begin
      Showmessage('Das Fehlen einer Angabe der Wellenlänge/Frequenz war doch ein Versehen, oder?');
      exit;
    end;

  //Berechnung und Zeichnen über Wellenlaengen-Eingabe
  if (CmbEinheit.ItemIndex=0) then
    begin

      //Fehlerabfrage für ungueltige Wellenlaenge
      GWellenlaenge := StrToFloat(EdtEingabe.Text)/(Power(10,(9)));
        if ((380/(Power(10,(9)))) >GWellenlaenge) or (GWellenlaenge >=(781/(power(10,(9))))) then
          begin
            Showmessage('Bitte gib eine Wellenlänge aus dem Bereich des sichtbaren Lichts an. Das sichtbare Licht reicht von 390nm bis 770nm.');
            EdtEingabe.Text := '380';
            GWellenlaenge := 380 /(Power(10,(9)));
          end;

      //Einheit ergänzen
      EdtEingabeEinheit.Text:= 'nm';
      EdtAusgabeEinheit.Text:= '10^13 Hz';

      //Frequenz ergaenzen
      Frequenz := UToolbox.WellenlaengeInFrequenz(GWellenlaenge);
      EdtAusgabe.Text := FloatToStrF((Frequenz/Power(10,(13))),ffNumber,20,5);

      //Label aktualisieren
      LblEingabe.caption:='Wellenlänge λ';
      LblAusgabe.caption:='Frequenz f';
    end;


  //Berechnung und Zeichnen ueber Frequenz-Eingabe
  if (CmbEinheit.ItemIndex=1) then
    begin
      Frequenz:=StrToFloat(EdtEingabe.text)*(Power(10,13));
      GWellenlaenge := FrequenzInWellenlaenge(Frequenz);

      //Fehlerabfrage für ungueltige Frequenz
        if ((379.47/(Power(10,(9)))) > GWellenlaenge) or (GWellenlaenge > (788.93/(Power(10,(9))))) then
          begin
            Showmessage('Bitte gib eine Frequenz aus dem Bereich des sichtbaren Lichts an. Das sichtbare Licht reicht von 77 bis 39 10^13Hz.');
            GWellenlaenge := FrequenzInWellenlaenge(47 * (Power(10,(13))));                                     //hier wird Wert fuer falsche Eingaben eingesetzt
            EdtEingabe.Text:= FloatToStr(WellenlaengeInFrequenz(GWellenlaenge)/(Power(10,(13))));
          end;

      //Einheit ergänzen
       EdtEingabeEinheit.Text:= '10^13 Hz';
       EdtAusgabeEinheit.Text:= 'nm';

      //Wellenlaenge ergaenzen
      EdtAusgabe.Text := FloatToStrF((GWellenlaenge * Power(10,9)),ffNumber,20,5);

      //Label aktualisieren
      LblEingabe.Caption:='Frequenz f';
      LblAusgabe.Caption:='Wellenlaenge λ';
    end;

  //Aufruf zur Berechnung und zum Zeichnen
  Zeichnen(FrequenzInWellenlaenge(Frequenz));
end;

////////////////////////////////////////////////////////////////////////////////

//Berechnung und Zeichnen über die Panels

//Panel Blau
procedure TFrmProjektionsflaeche.PnlBlauClick(Sender: TObject);
begin
    TBzoom.Position:=100;
    GWellenlaenge := Konstantenbox.KBlau;
    EditFuellerBeiPanelbedienung(Konstantenbox.KBlau);
    BtnStart.Click;
end;

//Panel Gelb
procedure TFrmProjektionsflaeche.PnlGelbClick(Sender: TObject);
begin
    TBzoom.Position:=100;
    GWellenlaenge := Konstantenbox.KGelb;
    EditFuellerBeiPanelbedienung(Konstantenbox.KGelb);
    BtnStart.Click;
end;

//Panel Gruen
procedure TFrmProjektionsflaeche.PnlGruenClick(Sender: TObject);
begin
    TBzoom.Position:=100;
    GWellenlaenge := Konstantenbox.KGruen;
    EditFuellerBeiPanelbedienung(Konstantenbox.KGruen);
    BtnStart.Click;
end;

//Panel Orange
procedure TFrmProjektionsflaeche.PnlOrangeClick(Sender: TObject);
begin
    TBzoom.Position:=100;
    GWellenlaenge := Konstantenbox.KOrange;
    EditFuellerBeiPanelbedienung(GWellenlaenge);
    BtnStart.Click;
end;

//Panel Rot
procedure TFrmProjektionsflaeche.PnlRotClick(Sender: TObject);
begin
    TBzoom.Position:=100;
    GWellenlaenge := Konstantenbox.KRot;
    EditFuellerBeiPanelbedienung(Konstantenbox.KRot);
    BtnStart.Click;
end;

//Panel Violett
procedure TFrmProjektionsflaeche.PnlViolettClick(Sender: TObject);
begin
    TBzoom.Position:=100;
    GWellenlaenge := Konstantenbox.KViolett;
    EditFuellerBeiPanelbedienung(Konstantenbox.KViolett);
    BtnStart.Click;
end;

////////////////////////////////////////////////////////////////////////////////

//HINTERGRUND


//Festlegung des Hintergrundes mit Abstimmung mit den Checkboxen der Graphischen Optionen
procedure TFrmProjektionsflaeche.Background();
begin
  DrawBackground(Schirm);
end;

procedure TFrmProjektionsflaeche.DrawBackground(Flaeche: TImage);
begin
  if GBackground = 2 then
  begin
    Flaeche.Canvas.Brush.Color:=clblack;
    Flaeche.Canvas.Pen.Color:=clblack;
    Flaeche.Canvas.Rectangle(0,0,Flaeche.Width,Flaeche.Height);
  end;

  if GBackground = 1 then
  begin
    Flaeche.Canvas.Brush.Color:=clwhite;
    Flaeche.Canvas.Pen.Color:=clwhite;
    Flaeche.Canvas.Rectangle(0,0,Flaeche.Width,Flaeche.Height);
  end;

  if GBackground = 3 then
  begin
    //DrawGradientH(Flaeche.Canvas, $00A2AA77, $00FFFFE3, Rect(0, 0, Width, Height))
    DrawGradientH(Flaeche.Canvas, $00000000, $FFFFFFFF, Rect(0, 0, Width, Height))
  end;
end;

procedure TFrmProjektionsflaeche.DrawGradientH(Canvas: TCanvas; Color1, Color2: TColor; Rect: TRect);
var
  x, r, g, b: integer;
begin

  for X := Rect.Top to Rect.Bottom do
    begin
      R := Round(GetRValue(Color1) + ((GetRValue(Color2) - GetRValue(Color1)) *
        X / (Rect.Bottom - Rect.Top)));
      G := Round(GetGValue(Color1) + ((GetGValue(Color2) - GetGValue(Color1)) *
        X / (Rect.Bottom - Rect.Top)));
      B := Round(GetBValue(Color1) + ((GetBValue(Color2) - GetBValue(Color1)) *
        X / (Rect.Bottom - Rect.Top)));

      Canvas.Pen.Color := RGB(R, G, B);
      Canvas.Pen.Width := 1;
      Canvas.Pen.Style := psInsideFrame;

      Canvas.MoveTo(Rect.Left, X);
      Canvas.LineTo(Rect.Right, X);
    end;
end;

procedure TFrmProjektionsflaeche.Schrifteinstellungen;
begin
  //Schriftgroesse
  PnlOptionen.Font.Size:= Konstantenbox.Ueberschrift;
  EdtEingabe.Font.Size:= Konstantenbox.Schrift;
  LblEingabe.Font.Size:= Konstantenbox.Schrift;
  LblAusgabe.Font.Size:= Konstantenbox.Schrift;
  EdtAusgabe.Font.Size:= Konstantenbox.Schrift;
  EdtSchirmAbstand.Font.Size:= Konstantenbox.Schrift;
  LblSchirmAbstand.Font.Size:= Konstantenbox.Schrift;
  LblSpaltanzahl.Font.Size:= Konstantenbox.Schrift;
  EdtSpaltanzahl.Font.Size:= Konstantenbox.Schrift;
  LblSpaltabstand.Font.Size:= Konstantenbox.Schrift;
  EdtSpaltabstand.Font.Size:= Konstantenbox.Schrift;
  BtnOptionen.Font.Size:= Konstantenbox.Schrift;
  PnlFarbeCaption.Font.Size:= Konstantenbox.Ueberschrift;
  BtnStart.Font.Size:= Konstantenbox.Schrift;
  BtnBeenden.Font.Size:= Konstantenbox.Schrift;
  LblHilfeSchirm.Font.Size:= Konstantenbox.Schrift;
  BtnHilfe.Font.Size:= Konstantenbox.Schrift;
  LblHilfeEinstellungen.Font.Size:= Konstantenbox.Schrift;
  LblHilfeEinstellungen2.Font.Size:= Konstantenbox.Schrift;
  BtnReset.Font.Size := Konstantenbox.Schrift;
  CmbEinheit.Font.Size:= Konstantenbox.Schrift;
  EdtEingabeEinheit.Font.Size:=Konstantenbox.Schrift;
  EdtAusgabeEinheit.Font.Size:=Konstantenbox.Schrift;
  EdtSpaltbreite.Font.Size:=Konstantenbox.Schrift;
  LblSpaltbreite.Font.Size:=Konstantenbox.Schrift;

  //Schriftart
  PnlOptionen.Font.Name:= Konstantenbox.Schriftart;
  EdtEingabe.Font.Name:= Konstantenbox.Schriftart;
  LblEingabe.Font.Name:= Konstantenbox.Schriftart;
  LblAusgabe.Font.Name:= Konstantenbox.Schriftart;
  EdtAusgabe.Font.Name:= Konstantenbox.Schriftart;
  EdtSchirmAbstand.Font.Name:= Konstantenbox.Schriftart;
  LblSchirmAbstand.Font.Name:= Konstantenbox.Schriftart;
  LblSpaltanzahl.Font.Name:= Konstantenbox.Schriftart;
  EdtSpaltanzahl.Font.Name:= Konstantenbox.Schriftart;
  LblSpaltabstand.Font.Name:= Konstantenbox.Schriftart;
  EdtSpaltabstand.Font.Name:= Konstantenbox.Schriftart;
  BtnOptionen.Font.Name:= Konstantenbox.Schriftart;
  PnlFarbeCaption.Font.Name:= Konstantenbox.Schriftart;
  BtnStart.Font.Name:= Konstantenbox.Schriftart;
  BtnBeenden.Font.Name:= Konstantenbox.Schriftart;
  LblHilfeSchirm.Font.Name:= Konstantenbox.Schriftart;
  BtnHilfe.Font.Name:= Konstantenbox.Schriftart;
  LblHilfeEinstellungen.Font.Name:= Konstantenbox.Schriftart;
  LblHilfeEinstellungen2.Font.Name:= Konstantenbox.Schriftart;
  BtnReset.Font.Name:= Konstantenbox.Schriftart;
  CmbEinheit.Font.Name:= Konstantenbox.Schriftart;
  EdtAusgabeEinheit.Font.Name:=Konstantenbox.Schriftart;
  EdtEingabeEinheit.Font.Name:=Konstantenbox.Schriftart;
  EdtSpaltbreite.Font.Name:=Konstantenbox.Schriftart;
  LblSpaltbreite.Font.Name:=Konstantenbox.Schriftart;

  //Schriftfarbe
  PnlOptionen.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtEingabe.Font.Color:= Konstantenbox.Schriftfarbe;
  LblEingabe.Font.Color:= Konstantenbox.Schriftfarbe;
  LblAusgabe.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtAusgabe.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtSchirmAbstand.Font.Color:= Konstantenbox.Schriftfarbe;
  LblSchirmAbstand.Font.Color:= Konstantenbox.Schriftfarbe;
  LblSpaltanzahl.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtSpaltanzahl.Font.Color:= Konstantenbox.Schriftfarbe;
  LblSpaltabstand.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtSpaltabstand.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnOptionen.Font.Color:= Konstantenbox.Schriftfarbe;
  PnlFarbeCaption.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnStart.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnBeenden.Font.Color:= Konstantenbox.Schriftfarbe;
  LblHilfeSchirm.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnHilfe.Font.Color:= Konstantenbox.Schriftfarbe;
  LblHilfeEinstellungen.Font.Color:= Konstantenbox.Schriftfarbe;
  LblHilfeEinstellungen2.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnReset.Font.Color:= Konstantenbox.Schriftfarbe;
  CmbEinheit.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtEingabeEinheit.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtAusgabeEinheit.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtSpaltbreite.Font.color:=Konstantenbox.Schriftfarbe;
  LblSpaltbreite.Font.color:=Konstantenbox.Schriftfarbe;
end;


procedure TFrmProjektionsflaeche.Reset;
begin
  //Schirm zurücksetzen
  Schirm.Picture:=nil;
  Schirm.Canvas;
  Canvaseinstellungen;
  EdtAusgabe.Text := '';

  //Intensitätsverlauf zuruecksetzten
  ImgIntensitaet.Picture:=nil;
  ImgIntensitaet.Canvas;

  //Lineal zurücksetzen
  if GStartet=true then Lineal;

  //Zoomleiste zurücksetzen
  TBZoom.Visible:=false;
  TBZoom.Position:=100;

  //Eingabefelder zurücksetzten
  EdtEingabe.Text:='500';
  EdtAusgabe.Text:='';
  EdtAusgabeEinheit.Text:='10^13 Hz';
  CmbEinheit.ItemIndex:=0;

  //Hilfe
  Hilfe_aus;

  //Projektiosnflaeche uebermalen
  Background;
end;

procedure TFrmProjektionsflaeche.Combobox;
begin
  CmbEinheit.Top:= PnlOptionen.Height + PnlOptionen.Top + 5;
  CmbEinheit.Width:= EdtEingabe.Width div 2;
  CmbEinheit.Left:= Konstantenbox.KEditLeft;
  CmbEinheit.Height:= Konstantenbox.KEditHoehe;
  CmbEinheit.Hint:='Frequenz bzw. Wellenlänge einstellen';
  CmbEinheit.ShowHint:=true;
  CmbEinheit.Style:=csDropDownList;

  CmbEinheit.AddItem('Wellenlänge', nil);
  CmbEinheit.AddItem('Frequenz', nil);
  CmbEInheit.ItemIndex := 0;

  EdtAusgabe.Enabled:=False;
end;

procedure TFrmProjektionsflaeche.EdtEingabeEinheiten;
begin
  EdtEingabeEinheit.Top:= EdtEingabe.Top;
  EdtEingabeEinheit.Width:= EdtEingabe.Width div 2;
  EdtEingabeEinheit.Left:= EdtEingabe.Width;

  EdtEingabeEinheit.Text:='nm';
  EdtEingabeEinheit.Enabled:=False;
end;

procedure TFrmProjektionsflaeche.EdtAusgabeEinheiten;
begin
  EdtAusgabeEinheit.Top:= EdtAusgabe.Top;
  EdtAusgabeEinheit.Width:= EdtAusgabe.Width div 2;
  EdtAusgabeEinheit.Left:= EdtAusgabe.Width;

  EdtAusgabeEinheit.Text:='10^13 Hz';
  EdtAusgabeEinheit.Enabled:=False;
end;

procedure TFrmProjektionsflaeche.EditFuellerBeiPanelbedienung(Wellenlaenge:real);
begin
  if (CmbEinheit.ItemIndex=0) then
    begin
      EdtEingabe.Text:=FloatToStr(GWellenlaenge*(Power(10,(9))));
      EdtAusgabe.Text:=FloatToStrF(WellenlaengeInFrequenz(Wellenlaenge)/(Power(10,(13))),ffNumber,20,5);
      EdtEingabeEinheit.Text:='nm';
      EdtAusgabeEinheit.Text:='10^13 Hz';
    end  ELSE
    begin
      EdtEingabe.Text:=FloatToStrF(WellenlaengeInFrequenz(Wellenlaenge)/(Power(10,(13))),ffNumber,20,5);
      EdtAusgabe.Text:=FloatToStr(GWellenlaenge*(Power(10,(9))));
      EdtEingabeEinheit.Text:='10^13 Hz';
      EdtAusgabeEinheit.Text:='nm';
    end
end;

procedure TFrmProjektionsflaeche.ImageIntensitaet;
begin
      ImgIntensitaet.Width:=ImgLineal.Width;
      ImgIntensitaet.top:=ImgLineal.Height+Schirm.Height;
      ImgIntensitaet.Left:=ImgLineal.Left;
      ImgIntensitaet.Height:=FrmProjektionsflaeche.Height-ImgLineal.Height-Schirm.Height;
      ImgIntensitaet.picture:=nil;
      ImgIntensitaet.Canvas;
end;

procedure TFrmProjektionsflaeche.Intensitaetsverlauf_Einzelspalt(Wellenlaenge:real);
var
  a,b,e,n,ymax,yvor,ynach,y,x:real;
  koordx, koordy,posx,posy,schritte:Integer;
  I: Integer;
  farbe,hintergrundfarbe:string;
begin
    ImgIntensitaet.picture:=nil;
    a:=StrToFloat(EdtSpaltabstand.Text)*0.001;
    e:=StrToFloat(EdtSchirmAbstand.Text);
    b:=StrToFloat(EdtSpaltbreite.Text)*0.001;
    n:=StrToFloat(EdtSpaltanzahl.Text);

    schritte:=100;

    ImgIntensitaet.Canvas.pen.Color:=clblack;
    ymax:=0;

    //Zuweisung der Stiftfarbe
    farbe := '$00' + Ufarbtabelle.Farbe(GWellenlaenge*(Power(10,(9))));

    for I := (-ImgIntensitaet.Width div 2) to (ImgIntensitaet.Width div 2) do      // Berechnet maximalen y-Wert
      begin
       if I<>0 then
          begin x:=I/(GDynZoom*TBZoom.Position);
            y:= Intervall_Einzelspalt(schritte,1/(GDynZoom*TBZoom.Position),b,e,GWellenlaenge,x);
            if y>ymax then ymax:=y;
          end;

      end;                                                                         // weil Funktion nicht fuer x = 0 definiert ist
    for posx := (-ImgIntensitaet.Width div 2) to (ImgIntensitaet.Width div 2) do   //  --> allerdings bei kleinem Zoom fehlerhaft!!
      begin
        if posx<>0 then
          begin
            x:=posx/(GDynZoom*TBZoom.Position);                                    //x = realer Abstand auf Schirm von Mitte in METERN … theoretisch zumindest…
            y:=Intervall_Einzelspalt(schritte,1/(GDynZoom*TBZoom.Position),b,e,GWellenlaenge,x);

            posy:=Round(ImgIntensitaet.Height*4 div 5*y/ymax);                     // Hilfswert fuer y als Anteil des Images
            koordy:=ImgIntensitaet.Height-(ImgIntensitaet.Height div 5)-posy;      // Berechunung der gezeichneten x-Werte
            koordx:=(ImgIntensitaet.Width div 2)+posx;                             // Berechnung der gezeichneten y-Werte


            if (GReal=true) then
              begin
                case GBackground of
                    2:hintergrundfarbe:='$00000000';
                    1:hintergrundfarbe:='$00ffffff';
                  end;
                Strich_Zeichnen(Schirm.Width div 2,stringtocolor(farbe));
                Strich_Zeichnen(koordx,Intensitaet_Farbe(stringtocolor(farbe),stringtocolor(hintergrundfarbe),y/ymax));
              end;

            if koordx=0 then ImgIntensitaet.Canvas.MoveTo(+1,koordy)
              else ImgIntensitaet.Canvas.LineTo(koordx+1,koordy);

           ynach:=UToolbox.Intervall_Einzelspalt(schritte,1/(GDynZoom*TBZoom.Position),b,e,GWellenlaenge,(posx+1)/(GDynZoom*TBZoom.Position));

           if (yvor<y) and (ynach<y) and (posy<>0) and (GReal=false) then
                Strich_Zeichnen(posx+(Schirm.Width div 2),stringtocolor(farbe));

           yvor:=y;

          end else
          begin
            ImgIntensitaet.Canvas.LineTo((ImgIntensitaet.Width div 2),0);
          end;
      end;
end;

procedure TFrmProjektionsflaeche.Intensitaetsverlauf_Doppelspalt(wellenlaenge:real);
var
  a,b,e,ymax,y,x,yvor,ynach:real;
  koordx, koordy,posx,posy:Integer;
  I: Integer;
  farbe, hintergrundfarbe:string;
begin
    ImgIntensitaet.picture:=nil;
    a:=StrToFloat(EdtSpaltabstand.Text)*0.001;
    e:=StrToFloat(EdtSchirmAbstand.Text);
    b:=StrToFloat(EdtSpaltbreite.Text)*0.001; //0.0001;

    //Hintergrund zeichnen
    Background;

    //Zuweisung der Stiftfarbe
    Schirm.Canvas.Pen.Color := Stringtocolor('$00' + Ufarbtabelle.Farbe(GWellenlaenge*(Power(10,(9)))));

    ImgIntensitaet.Canvas.pen.Color:=clblack;
    ymax:=0;

    //Zuweisung der Stiftfarbe
    farbe := '$00' + Ufarbtabelle.Farbe(GWellenlaenge*(Power(10,(9))));

    for I := (-ImgIntensitaet.Width div 2) to (ImgIntensitaet.Width div 2) do      // Berechnet maximalen y-Wert
      begin
       if I<>0 then
          begin x:=I/(GDynZoom*TBZoom.Position);
            y:= UToolbox.Intensitaet_Doppelspalt(a,b,e,GWellenlaenge,x);
            if y>ymax then ymax:=y;
          end;
      end;

    if Greal=true then Strich_Zeichnen(Schirm.Width div 2,stringtocolor(farbe));
    yvor:=0;                                                                         // weil Funktion nicht fuer x = 0 definiert ist
    for posx := (-ImgIntensitaet.Width div 2) to (ImgIntensitaet.Width div 2) do   //  --> allerdings bei kleinem Zoom fehlerhaft!!
      begin
        if posx<>0 then
          begin
            x:=posx/(GDynZoom*TBZoom.Position);                                    //x = realer Abstand auf Schirm von Mitte in METERN … theoretisch zumindest…
            y:=Intensitaet_Doppelspalt(a,b,e,GWellenlaenge,x);

            posy:=Round(ImgIntensitaet.Height*4 div 5*y/ymax);                     // Hilfswert fuer y als Anteil des Images
            koordy:=ImgIntensitaet.Height-(ImgIntensitaet.Height div 5)-posy;      // Berechunung der gezeichneten x-Werte
            koordx:=(ImgIntensitaet.Width div 2)+posx;                             // Berechnung der gezeichneten y-Werte

            if koordx=0 then ImgIntensitaet.Canvas.MoveTo(0,koordy)
              else ImgIntensitaet.Canvas.LineTo(koordx,koordy);


            ynach:=Intensitaet_Doppelspalt(a,b,e,GWellenlaenge,(posx+1)/(GDynZoom*TBZoom.Position));

            if (GReal=true) then
              begin
                case GBackground of
                    2:hintergrundfarbe:='$00000000';
                    1:hintergrundfarbe:='$00ffffff';
                  end;

                Strich_Zeichnen(koordx,Intensitaet_Farbe(stringtocolor(farbe),stringtocolor(hintergrundfarbe),y/ymax));
              end;

            if (yvor<y) and (ynach<y) and (posy<>0) and (GReal=false) then
                Strich_Zeichnen(posx+(Schirm.Width div 2),stringtocolor(farbe));

                yvor:=y;
          end else
          begin
            ImgIntensitaet.Canvas.LineTo((ImgIntensitaet.Width div 2),0);
          end;
      end;


end;

procedure TFrmProjektionsflaeche.Intensitaetsverlauf_Gitter(Wellenlaenge:real);
var
  a,b,e,n,ymax,y,x:real;
  koordx, koordy,posx,posy,schritte:Integer;
  I: Integer;
  farbe,hintergrundfarbe:string;
begin
    ImgIntensitaet.picture:=nil;
    a:=StrToFloat(EdtSpaltabstand.Text)*0.001;
    e:=StrToFloat(EdtSchirmAbstand.Text);
    b:=StrToFloat(EdtSpaltbreite.Text)*0.001; //0.0001;
    n:=StrToFloat(EdtSpaltanzahl.Text);

    ImgIntensitaet.Canvas.pen.Color:=clblack;
    ymax:=0;
    schritte:=50;

    //Zuweisung der Stiftfarbe
    farbe := '$00' + Ufarbtabelle.Farbe(GWellenlaenge*(Power(10,(9))));

    for I := (-ImgIntensitaet.Width div 2) to (ImgIntensitaet.Width div 2) do      // Berechnet maximalen y-Wert
      begin
       if I<>0 then
          begin x:=I/(GDynZoom*TBZoom.Position);
            y:= UToolbox.Intervall_Gitter(schritte,1/(GDynZoom*TBZoom.Position),a,b,e,n,GWellenlaenge,x);
            //Intensitaet_Gitter(a,b,e,n,GWellenlaenge,x);
            if y>ymax then ymax:=y;
          end;

      end;                                                                         // weil Funktion nicht fuer x = 0 definiert ist
    for posx := (-ImgIntensitaet.Width div 2) to (ImgIntensitaet.Width div 2) do   //  --> allerdings bei kleinem Zoom fehlerhaft!!
      begin
        if posx<>0 then
          begin
            x:=posx/(GDynZoom*TBZoom.Position);                                    //x = realer Abstand auf Schirm von Mitte in METERN … theoretisch zumindest…
            y:=UToolbox.Intervall_Gitter(schritte,1/(GDynZoom*TBZoom.Position),a,b,e,n,GWellenlaenge,x);

            posy:=Round(ImgIntensitaet.Height*4 div 5*y/ymax);                     // Hilfswert fuer y als Anteil des Images
            koordy:=ImgIntensitaet.Height-(ImgIntensitaet.Height div 5)-posy;      // Berechunung der gezeichneten x-Werte
            koordx:=(ImgIntensitaet.Width div 2)+posx;                             // Berechnung der gezeichneten y-Werte



            // 0.Maximum zeichnen
            Strich_Zeichnen(Schirm.Width div 2,stringtocolor(farbe));

            if (GReal=true) then
              begin
                case GBackground of
                    2:hintergrundfarbe:='$00000000';
                    1:hintergrundfarbe:='$00ffffff';
                  end;

                Strich_Zeichnen(koordx,Intensitaet_Farbe(stringtocolor(farbe),stringtocolor(hintergrundfarbe),y/ymax));
              end;

            if koordx=0 then ImgIntensitaet.Canvas.MoveTo(+1,koordy)
              else ImgIntensitaet.Canvas.LineTo(koordx+1,koordy);


           if (posy<>0) and MaximaCheck_Gitter(a,e,GWellenlaenge,x) and (GReal=false) then
                Strich_Zeichnen(posx+(Schirm.Width div 2),stringtocolor(farbe));

          end else
          begin
            ImgIntensitaet.Canvas.LineTo((ImgIntensitaet.Width div 2),0);
          end;
      end;
end;

procedure TFrmProjektionsflaeche.Strich_Zeichnen(x:Integer;farbe:TColor);
begin
  Schirm.Canvas.Pen.Color := farbe;
  Schirm.Canvas.MoveTo(x+1, Schirm.Height div 30);
  Schirm.Canvas.LineTo(x+1, Schirm.Height-(Schirm.Height div 30));
end;

procedure TFrmProjektionsflaeche.Zeichnen(wellenlaenge:real);
var farbe: string;
begin
  GSchirmAbstand:=StrToFloat(EdtSchirmAbstand.text);
  GSpaltAbstand:=StrToFloat(EdtSpaltabstand.Text)/Power(10,(3));
  if GWellenlaenge>0 then

   begin
    GMaximaAbstand := RoundTo(AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge,1),-10);
    GDynZoom:=DynamicZoom(GMaximaAbstand);
    
    //Hintergrund zeichnen
    Background;

    //Verlauf zeichnen
    if StrToInt(EdtSpaltanzahl.Text)=1 then
      Intensitaetsverlauf_Einzelspalt(GWellenlaenge);
    if StrToInt(EdtSpaltanzahl.Text)=2 then
      Intensitaetsverlauf_Doppelspalt(GWellenlaenge);
    if StrToInt(EdtSpaltanzahl.Text)>2 then
      Intensitaetsverlauf_Gitter(GWellenlaenge);

    //Lineal Zeichnen
    GLineal:=true;
    Lineal;
    TBZoom.Visible:=true;
   end;
end;

function TFrmProjektionsflaeche.Intensitaet_Farbe(Farbe, Hintergrundfarbe: TColor; Intensitaet:real):TColor;
var r, g, b: integer;
begin
  R := Round(GetRValue(Hintergrundfarbe) + ((GetRValue(Farbe) - GetRValue(Hintergrundfarbe)) * Intensitaet));
  G := Round(GetGValue(Hintergrundfarbe) + ((GetGValue(Farbe) - GetGValue(Hintergrundfarbe)) * Intensitaet));
  B := Round(GetBValue(Hintergrundfarbe) + ((GetBValue(Farbe) - GetBValue(Hintergrundfarbe)) * Intensitaet));

  result:=RGB(R, G, B);
end;

end.
