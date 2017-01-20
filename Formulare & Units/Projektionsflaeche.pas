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
    LblWellenlaenge: TLabel;
    LblFrequenz: TLabel;
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
    LblOverlaySchirm: TLabel;
    BtnOverlay: TButton;
    LblOverlayEinstellungen: TLabel;
    LblOverlayEinstellungen2: TLabel;
    BtnReset: TButton;
    CmbEinheit: TComboBox;
    EdtAusgabeEinheit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnOptionenClick(Sender: TObject);
    procedure Fenstereinstellungen;
    procedure Canvaseinstellungen;
    procedure Optionen;
    procedure Optionspanel;
    procedure Option_Wellenlaenge;
    procedure Option_Frequenz;
    procedure Option_Abstand_Blende_Schirm;
    procedure Option_Spaltanzahl;
    procedure Option_Spaltabstand;
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
    procedure Zeichnen;
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
    procedure BtnOverlayClick(Sender: TObject);
    procedure Overlay;
    procedure Overlay_aus;
    procedure OverlayButton;
    procedure Schrifteinstellungen;
    procedure EdtEingabeKeyPress(Sender: TObject; var Key: Char);
    function  dynamicZoom (Zahl: Real):Real;
    procedure Resetbutton;
    procedure Reset;
    procedure BtnResetClick(Sender: TObject);
    procedure Combobox;
    procedure EdtAusgabeEinheiten;
    procedure EdtEingabeChange(Sender: TObject);
    procedure EditFuellerBeiPanelbedienung(Wellenlaenge:Real);
    procedure FormActivate(Sender: TObject);
    procedure EdtSpaltabstandKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSchirmAbstandKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSpaltanzahlKeyPress(Sender: TObject; var Key: Char);
    procedure CmbEinheitChange(Sender: TObject);
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
  GOverlay : Boolean;
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
  BtnOptionen.Top:= LblSpaltabstand.Top - BtnOptionen.Height - 15;
  BtnOptionen.Left:= 20;
  BtnOptionen.Width:= Schirm.Left - (BtnOptionen.Left * 2);
  BtnOptionen.Caption:= 'graphische Optionen';
end;

procedure TFrmProjektionsflaeche.Option_Spaltabstand;
begin
  //Option Spaltabstand
  EdtSpaltabstand.Top:= LblSpaltanzahl.Top - EdtSpaltabstand.Height - 5;
  EdtSpaltabstand.Left:= Konstantenbox.KEditLeft;
  EdtSpaltabstand.Width:= Schirm.Left - EdtSpaltabstand.Left;
  EdtSpaltabstand.Text:= '1';

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

  LblSpaltanzahl.Top:= EdtSpaltanzahl.Top - LblSpaltanzahl.Height;
  LblSpaltanzahl.Left:= Konstantenbox.KLabelLeft;
  LblSpaltanzahl.Width:= Schirm.Left - LblSpaltanzahl.Left;
  LblSpaltanzahl.Caption:= 'Spaltanzahl n';
end;

procedure TFrmProjektionsflaeche.Option_Abstand_Blende_Schirm;
begin
  //Option Abstand Blende-Schirm
  EdtSchirmAbstand.Top:= FrmProjektionsflaeche.ClientHeight - (10 + EdtSchirmAbstand.Height);
  EdtSchirmAbstand.Left:= Konstantenbox.KEditLeft;
  EdtSchirmAbstand.Width:= Schirm.Left - EdtSchirmAbstand.Left;
  EdtSchirmAbstand.Text:= '10';

  LblSchirmAbstand.Top:= EdtSchirmAbstand.Top - LblSchirmAbstand.Height;
  LblSchirmAbstand.Left:= Konstantenbox.KLabelLeft;
  LblSchirmAbstand.Width:= Schirm.Left - LblSchirmAbstand.Left;
  LblSchirmAbstand.Caption:= 'Abstand Blende-Schirm e in m';
end;

procedure TFrmProjektionsflaeche.Option_Frequenz;
begin
  //Option Frequenz
  LblFrequenz.Top:= 5 + EdtEingabe.Top + EdtEingabe.Height;
  LblFrequenz.Left:= Konstantenbox.KLabelLeft;
  LblFrequenz.Width:= Schirm.Left - LblFrequenz.Left;
  LblFrequenz.Caption:= 'Frequenz f';

  EdtAusgabe.Top:= LblFrequenz.Top + LblFrequenz.Height;
  EdtAusgabe.Left:= Konstantenbox.KEditLeft;
  EdtAusgabe.Width:= (Schirm.Left - EdtAusgabe.Left) div 3*2;
  EdtAusgabe.Text:= '';
  EdtAusgabe.ReadOnly:=false;
end;

procedure TFrmProjektionsflaeche.Option_Wellenlaenge;
begin
  //Option Wellenlänge
  LblWellenlaenge.Top:= 5 + PnlOptionen.Top + PnlOptionen.Height;
  LblWellenlaenge.Left:= Konstantenbox.KLabelLeft;
  LblWellenlaenge.Width:= Schirm.Left - LblWellenlaenge.Left;
  LblWellenlaenge.Caption:= 'Wellenlänge λ';

  EdtEingabe.Top:= LblWellenlaenge.Top + LblWellenlaenge.Height;
  EdtEingabe.Left:= Konstantenbox.KEditLeft;
  EdtEingabe.Width:= (Schirm.Left - EdtEingabe.Left) div 3*2;
  EdtEingabe.Text:= '500';
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
  Option_Wellenlaenge;
  Option_Frequenz;
  Option_Abstand_Blende_Schirm;
  Option_Spaltanzahl;
  Option_Spaltabstand;
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
  Schirm.Height:= Round((4/5) * FrmProjektionsflaeche.Height);

  //Canvasposition
  Schirm.Left:= FrmProjektionsflaeche.Width - Schirm.Width;
  Schirm.Top:= 0;

end;

procedure TFrmProjektionsflaeche.CmbEinheitChange(Sender: TObject);
begin
  if CMBEinheit.ItemIndex= 0
    then begin
      LblWellenlaenge.caption:='Wellenlänge λ';
      LblFrequenz.caption:='Frequenz f';
      EdtAusgabeEinheit.Text:='10^-13Hz';
    end
    else begin
      LblWellenlaenge.Caption:='Frequenz f';
      LblFrequenz.Caption:='Wellenlaenge λ';
      EdtAusgabeEinheit.Text:='nm';
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

//Overlaybutton Einstellungen bestimmen
procedure TFrmProjektionsflaeche.OverlayButton;
begin
  BtnOverlay.Width:=Round((PnlFarbe.Width-6)/5);
  BtnOverlay.Height:=Konstantenbox.Schrift+10;
  BtnOverlay.Top:=(EdtAusgabe.Top + EdtAusgabe.Height) + 10;
  BtnOverlay.Left:=BtnBeenden.Left+BtnReset.Width+5;
  BtnOverlay.Caption:= 'Hilfe';

  //Alle Labels unsichtbar machen
  LblOverlaySchirm.Visible:= false;
  LblOverlayEinstellungen.Visible:= false;
  LblOverlayEinstellungen2.Visible:= false;

  //Overlay ist inaktiv -> GOverlay:= false
  GOverlay:= false;
end;

procedure TFrmProjektionsflaeche.BtnOverlayClick(Sender: TObject);
begin
  if GOverlay=false then Overlay else Overlay_aus;
end;

procedure TFrmProjektionsflaeche.BtnResetClick(Sender: TObject);
begin
  Reset;
end;

procedure TFrmProjektionsflaeche.Overlay;
begin
  //Overlay Schirm
  LblOverlaySchirm.Visible:= true;
  LblOverlaySchirm.Top:= 50;
  LblOverlaySchirm.Left:= Round(Schirm.Width / 2);
  LblOverlaySchirm.Caption:= 'Schirm - Die Projektionsfläche auf die der Laser strahlt.';

  //Overlay Einstellungen
  LblOverlayEinstellungen.Visible:= true;
  LblOverlayEinstellungen.Top:=Round(Schirm.Height / 2);
  LblOverlayEinstellungen.Left:= Schirm.Left + 20;
  LblOverlayEinstellungen.Caption:= '<-- Einstellungen - Veränderbare Werte des Versuchs sind:';

  //Overlay Einstellungen Details
  LblOverlayEinstellungen2.Visible:= true;
  LblOverlayEinstellungen2.Top:= LblOverlayEinstellungen.Top + LblOverlayEinstellungen.Height;
  LblOverlayEinstellungen2.Left:= LblOverlayEinstellungen.Left;
  LblOverlayEinstellungen2.Caption:= 'Wellenlänge, Frequenz oder Farbe (zum Auswählen der Farbe auf diese klicken)';

  //dem Programm mitteilen, dass das Overlay eingeblendet ist
  GOverlay:= true;
end;

procedure TFrmProjektionsflaeche.Overlay_aus;
begin
  //alle Overlay-Labels verstecken
  LblOverlaySchirm.Visible:= false;
  LblOverlayEinstellungen.Visible:= false;
  LblOverlayEinstellungen2.Visible:= false;

  //dem Programm mitteilen, dass das Overlay ausgeblendet ist
  GOverlay:= false;
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
  OverlayButton;
  //Schrifteinstellungen;
  Combobox;
  EdtAusgabeEinheiten;
  //to be aufgeräumt
  GStartet:=false;
  //nur vorrübergehend
  EdtSpaltanzahl.Enabled:= false;
end;

procedure TFrmProjektionsflaeche.Startbutton;
begin
  BtnStart.Top:=(EdtAusgabe.Top + EdtAusgabe.Height) + 10;
  BtnStart.Left:=Round((PnlFarbe.Width)/17);
  BtnStart.Width:=Round((PnlFarbe.Width)/5);
  BtnStart.Height:=Konstantenbox.Schrift+10;
  BtnStart.Caption:='Start';
end;

procedure TFrmProjektionsflaeche.Resetbutton;
begin
  BtnReset.Top := BtnStart.Top;
  BtnReset.Left := BtnStart.left+BtnStart.width+5;
  BtnReset.Width :=Round((PnlFarbe.Width-6)/5);
  BtnReset.Height := Konstantenbox.Schrift+10;
  BtnReset.Caption := 'Reset';
end;

procedure TFrmProjektionsflaeche.Endbutton;
begin
  BtnBeenden.Top:=(EdtAusgabe.Top + EdtAusgabe.Height) + 10;
  BtnBeenden.Left:=BtnReset.Left+BtnReset.width+5;
  BtnBeenden.Width:=Round((PnlFarbe.Width-6)/5);
  BtnBeenden.Height:=Konstantenbox.Schrift+10;
  BtnBeenden.Caption:='Beenden';
end;

procedure TFrmProjektionsflaeche.Zoomleiste;
begin
  TBZoom.Height:=20;
  TBZoom.Width:=120;
  TBZoom.Top:=ImgLineal.Top-TBZoom.Height;
  TBZoom.Left:=FrmProjektionsflaeche.Width-TBZoom.Width;
  TBzoom.Max:=200;
  TBZoom.Min:=1;
  TBZoom.Frequency:=1;
  TBZoom.Position:=100;
  TBZoom.Visible:=False;
end;

procedure TFrmProjektionsflaeche.Lineal;
begin
  ImgLineal.Picture:=nil;
  //Groeße und Position des Image
  ImgLineal.Height:=Round((1/5) * FrmProjektionsflaeche.Height);
  ImgLineal.Width:= Schirm.Width;
  ImgLineal.Left:=FrmProjektionsflaeche.Width-ImgLineal.Width;
  ImgLineal.Top:=Round(FrmProjektionsflaeche.Height*4/5);
  with ImgLineal.canvas do
    begin
      pen.Color:=ClBlack;
    //Umriss des Lineals
      Moveto(ImgLineal.Width,0);
      Lineto(0,0);
      Moveto(Round(ImgLineal.Width*21/22),Round(imgLineal.Height*5/6));
      Textout(penpos.x,penpos.y,'in m');
    end;
  Linealskala;
end;

procedure TFrmProjektionsflaeche.Linealskala; //Skala des Lineals
var
  Strichabstand, I,J,K : Integer;
  LDynZoom, Beschriftung: Real;
begin
  if GLineal=false then else
  //Graphische Optionen - CBLineal
  // if graphische_Optionen.CBLineal.checked:=true then
  Strichabstand:=100;
  if GDynZoom>0 then LDynZoom:=GDynZoom;
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
                                   lineto(I,Round(ImgLineal.Height/3));
                                   J:=0;
                                   K:=K+1;
                                   Beschriftung:=K/LDynZoom/(TBZoom.position/100);
                                   textout(penpos.X-2,penpos.Y,FloatToStr(RoundTo(Beschriftung,-4)));
                                 end;
        end;
      //Striche von Mitte->Rechts mit Beschriftung
      J:=Strichabstand;
      K:=1;
      for I := Round(ImgLineal.Width/2)+Strichabstand downto 1 do
        begin
          J:=J-1;
          if J = 0 then begin
                          moveto(I,1);
                          lineto(I,Round(ImgLineal.Height/3));
                          J:=Strichabstand;
                          K:=K-1;
                          Beschriftung:=K/LDynZoom/(TBZoom.position/100);
                          textout(penpos.X-2,penpos.Y,FloatToStr(RoundTo(Beschriftung,-4)));
                        end;

        end;
    end;
end;

procedure TFrmProjektionsflaeche.TBZoomChange(Sender: TObject);
begin
   GLineal:=true;
  Zeichnen;
end;

function TFrmProjektionsflaeche.dynamicZoom (Zahl: Real):Real;
var
  ZahlTest: Real;
  Success: Boolean;
  Zoom:Integer;
begin
  Success:= false;
  Zoom:=0;
  repeat
  //z.B. 1,234 zu 1 machen oder 5,461 zu 5
  ZahlTest:= StrToFloat(System.SysUtils.FormatFloat('0.', Zahl));
  //wenn ZahlTest 0 oder kleiner ist, dann soll das Komma von Zahl um 1 nach links verschoben werden
  if ZahlTest<= 0 then begin
                         Zahl:= Zahl * 10;
                         Zoom:=Zoom+1;
                       end
                  else begin
                         Success:= true;
                         Result:=Power(10,Zoom);
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
var
  Text: string;
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

procedure TFrmProjektionsflaeche.EdtSchirmAbstandKeyPress(Sender: TObject;
  var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', ',', '.', Backspace];
var
  Text: string;
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

procedure TFrmProjektionsflaeche.EdtSpaltabstandKeyPress(Sender: TObject;
  var Key: Char);
const
  Backspace = #8;
  Enter= #13;
  AllowKeys: set of Char = ['0'..'9', ',', '.', Backspace, Enter];
var
  Text: string;
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

procedure TFrmProjektionsflaeche.EdtSpaltanzahlKeyPress(Sender: TObject;
  var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', Backspace];
var
  Text: string;
begin
  if Key=#13 then BtnStart.Click;
  if not (Key in AllowKeys) then Key := #0;
end;

//////////////////////////////////////////////////////////////////////////////////

//Berechnung und Zeichnen über Startbutton
procedure TFrmProjektionsflaeche.BtnStartClick(Sender: TObject);
var Frequenz: real;
begin
  //Programmstart
  GStartet:=true;
  //Fehlerabfrage für Spaltanzahl (1 zu 0 ändern, sobald Einzelspalt eingebaut)
  if STrToInt(EdtSpaltanzahl.Text)<=1 then
    begin
      ShowMessage('Die angegebene Spaltanzahl ist zu niedrig.');
      exit;
    end;

    //Fehlerabfrage für Spaltabstand
    if StrToFloat(EdtSpaltabstand.Text)<=0 then
    begin
      ShowMessage('Der angegebene Spaltabstand ist zu niedrig.');
      exit;
    end;

    //Fehlerabfrage für Abstand Blende-Spalt
    if StrToFloat(EdtSchirmAbstand.Text)<= 0 then
    begin
      ShowMessage('Der angegebene Abstand des Schirms zur Blende ist zu niedrig.');
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
            Showmessage('Bitte gib eine Wellenlänge aus dem Bereich des sichtbaren Lichts an.');
            EdtEingabe.Text := '380';
            GWellenlaenge := 380 /(Power(10,(9)));
          end;

      //Einheit ergänzen
      EdtAusgabeEinheit.Text:= '10^13 Hz';

      //Frequenz ergaenzen
      Frequenz := UToolbox.WellenlaengeInFrequenz(GWellenlaenge);
      EdtAusgabe.Text := FloatToStrF((Frequenz/Power(10,(13))),ffNumber,20,5);

      //Label aktualisieren
      LblWellenlaenge.caption:='Wellenlänge λ';
      LblFrequenz.caption:='Frequenz f';
    end;


  //Berechnung und Zeichnen ueber Frequenz-Eingabe
  if (CmbEinheit.ItemIndex=1) then
    begin
      GWellenlaenge := FrequenzInWellenlaenge(StrToFloat(EdtEingabe.Text)*(Power(10,13)));

      //Fehlerabfrage für ungueltige Frequenz
        if ((379.47/(Power(10,(9)))) > GWellenlaenge) or (GWellenlaenge > (788.93/(Power(10,(9))))) then
          begin
            Showmessage('Bitte gib eine Frequenz aus dem Bereich des sichtbaren Lichts an.');
            GWellenlaenge := FrequenzInWellenlaenge(47 * (Power(10,(13))));                                     //hier wird Wert fuer falsche Eingaben eingesetzt
            EdtEingabe.Text:= FloatToStr(WellenlaengeInFrequenz(GWellenlaenge)/(Power(10,(13))));
          end;

      //Einheit ergänzen
       EdtAusgabeEinheit.Text:= 'nm';

      //Wellenlaenge ergaenzen
      EdtAusgabe.Text := FloatToStrF((GWellenlaenge * Power(10,9)),ffNumber,20,5);

      //Label aktualisieren
      LblWellenlaenge.Caption:='Frequenz f';
      LblFrequenz.Caption:='Wellenlaenge λ';
    end;

  //Aufruf zur Berechnung und zum Zeichnen
  Zeichnen;


end;



//    GSchirmAbstand:=StrToFloat(EdtSchirmAbstand.text);
//    GSpaltAbstand:=StrToFloat(EdtSpaltabstand.Text)/Power(10,(3));
//    GWellenlaenge := Konstantenbox.KOrange;
//    GMaximaAbstand := AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge,1);
//    GDynZoom:=DynamicZoom(GMaximaAbstand);
//    GLineal:=true;
//    Zeichnen(GMaximaAbstand*(TBZoom.position)*GDynZoom);
//    Linealskala;



procedure TFrmProjektionsflaeche.Zeichnen;
var posx: integer;                                                              //x-Position des Stiftes
    farbe: string;
    a: real;
    n: integer;
    debug,debug2: real;
begin
  GSchirmAbstand:=StrToFloat(EdtSchirmAbstand.text);
  GSpaltAbstand:=StrToFloat(EdtSpaltabstand.Text)/Power(10,(3));
  if GWellenlaenge>0 then

   begin
    //Leeren des Schirms
    Schirm.Picture := nil;

    //Hintergrund zeichnen
    Background;

    //Zuweisung der Stiftfarbe
    farbe := '$00' + Ufarbtabelle.Farbe(GWellenlaenge*(Power(10,(9))));
    Schirm.Canvas.Pen.Color := Stringtocolor(farbe);

    //Stift in Schirmmitte positionieren
    posx := Schirm.Width div 2;

    //Maximum 0. Ordnung zeichnen
    Schirm.Canvas.MoveTo(posx, Schirm.Height div 30);
    Schirm.Canvas.LineTo(posx, Schirm.Height-(Schirm.Height div 30));

    //Maxima >0. Ordnung zeichnen (Maxima rechts der Mitte)
    n:=0;
    posx := Schirm.Width div 2;

    GMaximaAbstand := RoundTo(AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge,1),-10);
    GDynZoom:=DynamicZoom(GMaximaAbstand);

    repeat
      //Berechnen von a
      n:=n+1;
      if (AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge,n))=-1 then break;
      GMaximaAbstand := RoundTo(AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge,n),-10);
      A:=GMaximaAbstand*GDynZoom*TBZoom.Position;
      //Zeichnen;
      posx := round(posx + a);
      Schirm.Canvas.MoveTo(posx, Schirm.Height div 30);
      Schirm.Canvas.LineTo(posx, Schirm.Height-(Schirm.Height div 30));
    until posx > Schirm.Width;
    //Maxima <0. Ordnung zeichnen (Maxima links der Mitte)
    n:=0;
    posx := Schirm.Width div 2;
    repeat
      //Berechnen von a
      n:=n+1;
      if (AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge,n))=-1 then break;
      GMaximaAbstand := RoundTo(AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge,n),-10);
      A:=GMaximaAbstand*GDynZoom*TBZoom.Position;
      //Zeichnen
      posx := round(posx - a);
      Schirm.Canvas.MoveTo(posx, Schirm.Height div 30);
      Schirm.Canvas.LineTo(posx, Schirm.Height-(Schirm.Height div 30));
    until posx < 0;

    //Lineal Zeichnen
    GLineal:=true;
    Lineal;
    TBZoom.Visible:=true;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

//Berechnung und Zeichnen über die Panels

//Panel Blau
procedure TFrmProjektionsflaeche.PnlBlauClick(Sender: TObject);
begin
  GWellenlaenge := Konstantenbox.KBlau;
  Zeichnen;
  EditFuellerBeiPanelbedienung(GWellenlaenge);
end;

//Panel Gelb
procedure TFrmProjektionsflaeche.PnlGelbClick(Sender: TObject);
begin
    GWellenlaenge := Konstantenbox.KGelb;
    Zeichnen;
    EditFuellerBeiPanelbedienung(GWellenlaenge);
end;

//Panel Gruen
procedure TFrmProjektionsflaeche.PnlGruenClick(Sender: TObject);
begin
    GWellenlaenge := Konstantenbox.KGruen;
    Zeichnen;
    EditFuellerBeiPanelbedienung(GWellenlaenge);
end;

//Panel Orange
procedure TFrmProjektionsflaeche.PnlOrangeClick(Sender: TObject);
begin
    GWellenlaenge := Konstantenbox.KOrange;
    Zeichnen;
    EditFuellerBeiPanelbedienung(GWellenlaenge);
end;

//Panel Rot
procedure TFrmProjektionsflaeche.PnlRotClick(Sender: TObject);
begin
    GWellenlaenge := Konstantenbox.KRot;
    Zeichnen;
    EditFuellerBeiPanelbedienung(GWellenlaenge);
end;

//Panel Violett
procedure TFrmProjektionsflaeche.PnlViolettClick(Sender: TObject);
begin
    GWellenlaenge := Konstantenbox.KViolett;
    Zeichnen;
    EditFuellerBeiPanelbedienung(GWellenlaenge);
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
  if GBackgroundBlack = true then
  begin
    Flaeche.Picture := nil;
    Flaeche.Canvas.Brush.Color:=clblack;
    Flaeche.Canvas.Pen.Color:=clblack;
    Flaeche.Canvas.Rectangle(0,0,Flaeche.Width,Flaeche.Height);
  end;

  if GBackgroundWhite = true then
  begin
    Flaeche.Picture := nil;
    Flaeche.Canvas.Brush.Color:=clwhite;
    Flaeche.Canvas.Pen.Color:=clwhite;
    Flaeche.Canvas.Rectangle(0,0,Flaeche.Width,Flaeche.Height);
  end;

  if GBackgroundGradient = true then
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
  LblWellenlaenge.Font.Size:= Konstantenbox.Schrift;
  LblFrequenz.Font.Size:= Konstantenbox.Schrift;
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
  LblOverlaySchirm.Font.Size:= Konstantenbox.Schrift;
  BtnOverlay.Font.Size:= Konstantenbox.Schrift;
  LblOverlayEinstellungen.Font.Size:= Konstantenbox.Schrift;
  LblOverlayEinstellungen2.Font.Size:= Konstantenbox.Schrift;
  BtnReset.Font.Size := Konstantenbox.Schrift;
  CmbEinheit.Font.Size:= Konstantenbox.Schrift;
  EdtAusgabeEinheit.Font.Size:=Konstantenbox.Schrift;

  //Schriftart
  PnlOptionen.Font.Name:= Konstantenbox.Schriftart;
  EdtEingabe.Font.Name:= Konstantenbox.Schriftart;
  LblWellenlaenge.Font.Name:= Konstantenbox.Schriftart;
  LblFrequenz.Font.Name:= Konstantenbox.Schriftart;
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
  LblOverlaySchirm.Font.Name:= Konstantenbox.Schriftart;
  BtnOverlay.Font.Name:= Konstantenbox.Schriftart;
  LblOverlayEinstellungen.Font.Name:= Konstantenbox.Schriftart;
  LblOverlayEinstellungen2.Font.Name:= Konstantenbox.Schriftart;
  BtnReset.Font.Name:= Konstantenbox.Schriftart;
  CmbEinheit.Font.Name:= Konstantenbox.Schriftart;
  EdtAusgabeEinheit.Font.Name:=Konstantenbox.Schriftart;

  //Schriftfarbe
  PnlOptionen.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtEingabe.Font.Color:= Konstantenbox.Schriftfarbe;
  LblWellenlaenge.Font.Color:= Konstantenbox.Schriftfarbe;
  LblFrequenz.Font.Color:= Konstantenbox.Schriftfarbe;
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
  LblOverlaySchirm.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnOverlay.Font.Color:= Konstantenbox.Schriftfarbe;
  LblOverlayEinstellungen.Font.Color:= Konstantenbox.Schriftfarbe;
  LblOverlayEinstellungen2.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnReset.Font.Color:= Konstantenbox.Schriftfarbe;
  CmbEinheit.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtAusgabeEinheit.Font.Color:= Konstantenbox.Schriftfarbe;
end;


procedure TFrmProjektionsflaeche.Reset;
begin
  //Schirm zurücksetzen
  Schirm.Picture:=nil;
  Schirm.Canvas;
  Canvaseinstellungen;
  EdtAusgabe.Text := '';

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

  //Overlay
  Overlay_aus;

  //Projektiosnflaeche uebermalen
  Background;
end;

procedure TFrmProjektionsflaeche.Combobox;
begin
  CmbEinheit.Top:= EdtEingabe.Top;
  CmbEinheit.Width:= EdtEingabe.Width div 2;
  CmbEinheit.Left:= EdtEingabe.Width;
  CmbEinheit.Height:= Konstantenbox.KEditHoehe;

  CmbEinheit.AddItem('nm', nil);
  CmbEinheit.AddItem('10^13 Hz', nil);
  CmbEInheit.ItemIndex := 0;

  EdtAusgabe.Enabled:=False;
end;

procedure TFrmProjektionsflaeche.EdtAusgabeEinheiten;
begin
  EdtAusgabeEinheit.Top:= EdtAusgabe.Top;
  EdtAusgabeEinheit.Width:= EdtAusgabe.Width div 2;
  EdtAusgabeEinheit.Left:= CmbEinheit.Left;

  EdtAusgabeEinheit.Text:='';
  EdtAusgabeEinheit.Enabled:=False;
end;

procedure TFrmProjektionsflaeche.EditFuellerBeiPanelbedienung(Wellenlaenge:real);
begin
  if (CmbEinheit.ItemIndex=0) then
    begin
      EdtEingabe.Text:=FloatToStr(GWellenlaenge*(Power(10,(9))));
      EdtAusgabe.Text:=FloatToStrF(WellenlaengeInFrequenz(Wellenlaenge)/(Power(10,(13))),ffNumber,20,5);
      EdtAusgabeEinheit.Text:='10^13 Hz';
    end  ELSE
    begin
      EdtEingabe.Text:=FloatToStrF(WellenlaengeInFrequenz(Wellenlaenge)/(Power(10,(13))),ffNumber,20,5);
      EdtAusgabe.Text:=FloatToStr(GWellenlaenge*(Power(10,(9))));
      EdtAusgabeEinheit.Text:='nm';
    end
end;

end.
