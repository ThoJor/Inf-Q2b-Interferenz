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
    EdtWellenlaenge: TEdit;
    LblWellenlaenge: TLabel;
    LblFrequenz: TLabel;
    EdtFrequenz: TEdit;
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
    procedure Linealbasis;
    procedure Zoomleiste;
    procedure TBZoomChange(Sender: TObject);
    procedure Zeichnen(a: real);
    procedure PnlViolettClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure Startbutton;
    procedure Background();
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
    procedure EdtFrequenzKeyPress(Sender: TObject; var Key: Char);
    procedure EdtWellenlaengeKeyPress(Sender: TObject; var Key: Char);
    function dynamicZoom (Zahl: Real):Real;
    procedure Resetbutton;
    procedure Reset;
    procedure BtnResetClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmProjektionsflaeche: TFrmProjektionsflaeche;
  GSchirmAbstand : real;
  GZoomfaktor : Integer;
  GWellenlaenge : real;
  GSpaltabstand : real;
  GMaximaAbstand : real;
  GDynZoom : Real;
  GOverlay : Boolean;
  GLineal : Boolean;

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
  PnlRot.Color:= clRed;
end;

procedure TFrmProjektionsflaeche.Farbe_Orange;
begin
  PnlOrange.Top:= PnlGruen.Top + PnlGruen.Height;
  PnlOrange.Left:= 0;
  PnlOrange.Width:= Round(PnlFarbe.Width / 2);
  PnlOrange.Height:= Round(PnlFarbe.Height * (1/4));
  PnlOrange.Caption:= '';
  PnlOrange.ParentBackground:= false;
  PnlOrange.Color:= StringToColor('$00A5FF');
end;

procedure TFrmProjektionsflaeche.Farbe_Gelb;
begin
  PnlGelb.Top:= PnlBlau.Top + PnlBlau.Height;
  PnlGelb.Left:= PnlGruen.Width;
  PnlGelb.Width:= Round(PnlFarbe.Width / 2);
  PnlGelb.Height:= Round(PnlFarbe.Height * (1/4));
  PnlGelb.Caption:= '';
  PnlGelb.ParentBackground:= false;
  PnlGelb.Color:= clYellow;
end;

procedure TFrmProjektionsflaeche.Farbe_Gruen;
begin
  PnlGruen.Top:= PnlViolett.Top + PnlViolett.Height;
  PnlGruen.Left:= 0;
  PnlGruen.Width:= Round(PnlFarbe.Width / 2);
  PnlGruen.Height:= Round(PnlFarbe.Height * (1/4));
  PnlGruen.Caption:= '';
  PnlGruen.ParentBackground:= false;
  PnlGruen.Color:= clGreen;
end;

procedure TFrmProjektionsflaeche.Farbe_Blau;
begin
  PnlBlau.Top:= PnlFarbeCaption.Top + PnlFarbeCaption.Height;
  PnlBlau.Left:= PnlViolett.Width;
  PnlBlau.Width:= Round(PnlFarbe.Width / 2);
  PnlBlau.Height:= Round(PnlFarbe.Height * (1/4));
  PnlBlau.Caption:= '';
  PnlBlau.ParentBackground:= false;
  PnlBlau.Color:= clBlue;
end;

procedure TFrmProjektionsflaeche.Farbe_Violett;
begin
  PnlViolett.Top:= PnlFarbeCaption.Top + PnlFarbeCaption.Height;
  PnlViolett.Left:= 0;
  PnlViolett.Width:= Round(PnlFarbe.Width / 2);
  PnlViolett.Height:= Round(PnlFarbe.Height * (1/4));
  PnlViolett.Caption:= '';
  PnlViolett.ParentBackground:= false;
  PnlViolett.Color:= clPurple;
end;

procedure TFrmProjektionsflaeche.Farbe_Panel;
begin
  PnlFarbe.Top:= (EdtFrequenz.Top + EdtFrequenz.Height) + 60;
  PnlFarbe.Height:= (BtnOptionen.Top - (EdtFrequenz.Top + EdtFrequenz.Height)) - 70;
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
  EdtSpaltabstand.Height:= Konstantenbox.KEditHoehe;
  EdtSpaltabstand.Top:= LblSpaltanzahl.Top - EdtSpaltabstand.Height - 5;
  EdtSpaltabstand.Left:= Konstantenbox.KEditLeft;
  EdtSpaltabstand.Width:= Schirm.Left - EdtSpaltabstand.Left;
  EdtSpaltabstand.Text:= '1';

  LblSpaltabstand.Height:= Konstantenbox.KLabelHoehe;
  LblSpaltabstand.Top:= EdtSpaltabstand.Top - LblSpaltabstand.Height;
  LblSpaltabstand.Left:= Konstantenbox.KLabelLeft;
  LblSpaltabstand.Width:= Schirm.Left - LblSpaltabstand.Left;
  LblSpaltabstand.Caption:= 'Spaltabstand d in mm';
end;

procedure TFrmProjektionsflaeche.Option_Spaltanzahl;
begin
  //Option Spaltanzahl
  EdtSpaltanzahl.Height:= Konstantenbox.KEditHoehe;
  EdtSpaltanzahl.Top:= LblSchirmAbstand.Top - EdtSpaltanzahl.Height - 5;
  EdtSpaltanzahl.Left:= Konstantenbox.KEditLeft;
  EdtSpaltanzahl.Width:= Schirm.Left - EdtSpaltanzahl.Left;
  EdtSpaltanzahl.Text:= '2';

  LblSpaltanzahl.Height:= Konstantenbox.KLabelHoehe;
  LblSpaltanzahl.Top:= EdtSpaltanzahl.Top - LblSpaltanzahl.Height;
  LblSpaltanzahl.Left:= Konstantenbox.KLabelLeft;
  LblSpaltanzahl.Width:= Schirm.Left - LblSpaltanzahl.Left;
  LblSpaltanzahl.Caption:= 'Spaltanzahl n';
end;

procedure TFrmProjektionsflaeche.Option_Abstand_Blende_Schirm;
begin
  //Option Abstand Blende-Schirm
  EdtSchirmAbstand.Height:= Konstantenbox.KEditHoehe;
  EdtSchirmAbstand.Top:= FrmProjektionsflaeche.ClientHeight - (10 + EdtSchirmAbstand.Height);
  EdtSchirmAbstand.Left:= Konstantenbox.KEditLeft;
  EdtSchirmAbstand.Width:= Schirm.Left - EdtSchirmAbstand.Left;
  EdtSchirmAbstand.Text:= '10';

  LblSchirmAbstand.Height:= Konstantenbox.KLabelHoehe;
  LblSchirmAbstand.Top:= EdtSchirmAbstand.Top - LblSchirmAbstand.Height;
  LblSchirmAbstand.Left:= Konstantenbox.KLabelLeft;
  LblSchirmAbstand.Width:= Schirm.Left - LblSchirmAbstand.Left;
  LblSchirmAbstand.Caption:= 'Abstand Spalt-Schirm e in m';
end;

procedure TFrmProjektionsflaeche.Option_Frequenz;
begin
  //Option Frequenz
  LblFrequenz.Top:= 5 + EdtWellenlaenge.Top + EdtWellenlaenge.Height;
  LblFrequenz.Left:= Konstantenbox.KLabelLeft;
  LblFrequenz.Width:= Schirm.Left - LblFrequenz.Left;
  LblFrequenz.Height:= Konstantenbox.KLabelHoehe;
  LblFrequenz.Caption:= 'Frequenz f in 10^13 Hz';

  EdtFrequenz.Top:= LblFrequenz.Top + LblFrequenz.Height;
  EdtFrequenz.Left:= Konstantenbox.KEditLeft;
  EdtFrequenz.Width:= Schirm.Left - EdtFrequenz.Left;
  EdtFrequenz.Height:= Konstantenbox.KEditHoehe;
  EdtFrequenz.Text:= '';
  EdtFrequenz.ReadOnly:=false;
end;

procedure TFrmProjektionsflaeche.Option_Wellenlaenge;
begin
  //Option Wellenlänge
  LblWellenlaenge.Top:= 5 + PnlOptionen.Top + PnlOptionen.Height;
  LblWellenlaenge.Left:= Konstantenbox.KLabelLeft;
  LblWellenlaenge.Width:= Schirm.Left - LblWellenlaenge.Left;
  LblWellenlaenge.Height:= Konstantenbox.KLabelHoehe;
  LblWellenlaenge.Caption:= 'Wellenlänge λ in nm';

  EdtWellenlaenge.Top:= LblWellenlaenge.Top + LblWellenlaenge.Height;
  EdtWellenlaenge.Left:= Konstantenbox.KEditLeft;
  EdtWellenlaenge.Width:= Schirm.Left - EdtWellenlaenge.Left;
  EdtWellenlaenge.Height:= Konstantenbox.KEditHoehe;
  EdtWellenlaenge.Text:= '500';
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
  BtnOverlay.Top:= 50;
  BtnOverlay.Left:= Schirm.Left;
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

procedure TFrmProjektionsflaeche.FormCreate(Sender: TObject);
begin
  Fenstereinstellungen;
  Canvaseinstellungen;
  Optionen;
  Linealbasis;
  Startbutton;
  Endbutton;
  Resetbutton;
  Zoomleiste;
  OverlayButton;
  Schrifteinstellungen;
end;

procedure TFrmProjektionsflaeche.Startbutton;
begin
  BtnStart.Top:=(EdtFrequenz.Top + EdtFrequenz.Height) + 10;
  BtnStart.Left:=0;
  BtnStart.Width:=60;
  BtnStart.Height:=20;
  BtnStart.Caption:='Start';
end;

procedure TFrmProjektionsflaeche.Endbutton;
begin
  BtnBeenden.Top:=(EdtFrequenz.Top + EdtFrequenz.Height) + 10;
  BtnBeenden.Left:=80;
  BtnBeenden.Width:=60;
  BtnBeenden.Height:=20;
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
  TBZoom.Position:=100;
  TBZoom.Visible:=False;
end;

procedure TFrmProjektionsflaeche.Linealbasis;
begin
  GLineal:=false;
  //Groeße und Position des Image
  ImgLineal.Height:=Round((1/5) * FrmProjektionsflaeche.Height);
  ImgLineal.Width:= Schirm.Width;
  ImgLineal.Left:=FrmProjektionsflaeche.Width-ImgLineal.Width;
  ImgLineal.Top:=Round(FrmProjektionsflaeche.Height*4/5);
  with ImgLineal.canvas do
    begin
      pen.Color:=ClBlack;
    //Umriss des Lineals
      Moveto(ImgLineal.Width-2,2);
      Lineto(2,2);
      Lineto(2,ImgLineal.Height-2);
      Lineto(ImgLineal.Width-2,ImgLineal.Height-2);
      Lineto(ImgLineal.Width-2,2);
    end;
end;




procedure TFrmProjektionsflaeche.Linealskala; //Skala des Lineals
var
  Strichabstand, I,J,K : Integer;
  LDynZoom: Real;
begin
  if GLineal=false then else
  //Graphische Optionen - CBLineal
  // if graphische_Optionen.CBLineal.checked:=true then
  Strichabstand:=100;
  if GDynZoom>0 then LDynZoom:=GDynZoom;
  J:=0;
  K:=0;
  ImgLineal.Picture:=nil;
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
                                   textout(penpos.X-2,penpos.Y,FloatToStr(System.SysUtils.FormatFloat('0.0000',(K/LDynZoom/(TBZoom.position/100)))));
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
                          textout(penpos.X-7,penpos.Y,FloatToStr(System.SysUtils.FormatFloat('0.0000',(K/LDynZoom/(TBZoom.position/100)))));
                        end;

        end;
    end;
end;

procedure TFrmProjektionsflaeche.TBZoomChange(Sender: TObject);
begin
  GZoomfaktor:=100000*TBZoom.Position;
//LINEAL
  //Lineal neu Zeichnen
  Linealskala;
//SCHIRM
  Zeichnen(GMaximaAbstand*(TBZoom.Position)*GDynZoom);
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

//Loeschen von ungewollten Eingaben aus EdtFrequenz (waehrend der Eingabe)
procedure TFrmProjektionsflaeche.EdtFrequenzKeyPress(Sender: TObject;
  var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', Backspace];
var
  Text: string;
begin
  if not (Key in AllowKeys) then
  begin
    Key := #0;
  end;
end;

//Loeschen von ungewollten Eingaben aus EdtWellenlaenge (waehrend der Eingabe)
procedure TFrmProjektionsflaeche.EdtWellenlaengeKeyPress(Sender: TObject;
  var Key: Char);
const
  Backspace = #8;
  AllowKeys: set of Char = ['0'..'9', Backspace];
var
  Text: string;
begin
  if not (Key in AllowKeys) then
  begin
    Key := #0;
  end;
end;

//////////////////////////////////////////////////////////////////////////////////

//Berechnung und Zeichnen über Startbutton
procedure TFrmProjektionsflaeche.BtnStartClick(Sender: TObject);
  var Wellenlaenge,Frequenz: real;
begin
  TBZoom.position:=100;
  TBZoom.Visible:=true;

  Background;

  //fehlerabfrage für doppelte Eingabe
  if not (EdtWellenlaenge.Text = '') and not (EdtFrequenz.Text = '') then
  begin
    Showmessage('Bitte gib eine Wellenlänge ODER eine Frequenz an')
  end;

  //Fehlerabfrage für fehlende Eingabe
  if (EdtWellenlaenge.Text = '') and (EdtFrequenz.Text = '') then
  begin
    Showmessage('Bitte gib eine Wellenlänge oder eine Frequenz an')
  end;


  //Berechnung und Zeichnen über Wellenlaengen-Eingabe
  if (EdtFrequenz.Text = '') and (EdtWellenlaenge.Text <> '') then
  begin

    //Fehlerabfrage für ungueltige Wellenlaenge
    Wellenlaenge := StrToFloat(EdtWellenlaenge.Text)/(Power(10,(9)));
      if ((380.00/(Power(10,(9)))) > Wellenlaenge) or (Wellenlaenge > (780.00/(Power(10,(9))))) then
      begin
        Showmessage('Bitte gib eine Wellenlänge aus dem Bereich des sichtbaren Lichts an.');
        EdtWellenlaenge.Text := '380';
        Wellenlaenge := 380 /(Power(10,(9)));
      end;

    //Frequenz ergaenzen
    Frequenz := UToolbox.WellenlaengeInFrequenz(Wellenlaenge);
    EdtFrequenz.Text := FloatToStr(Frequenz/Power(10,(13)));

    //Aufruf zur Berechnung und zum Zeichnen
    GSchirmAbstand:=StrToFloat(EdtSchirmAbstand.text);
    GSpaltAbstand:=StrToFloat(EdtSpaltabstand.Text)/Power(10,(3));
    GZoomfaktor:=100000*Round(TBZoom.Position/2);
    GWellenlaenge := Wellenlaenge;
    GMaximaAbstand := AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge);
    GDynZoom:=DynamicZoom(GMaximaAbstand);
    GLineal:=true;
    Zeichnen(GMaximaAbstand*(TBZoom.position)*GDynZoom);
    Linealskala;
  end;


  //Berechnung und Zeichnen ueber Frequenz-Eingabe
  if (EdtWellenlaenge.Text = '') and (EdtFrequenz.Text <> '') then
  begin

    //Fehlerabfrage für ungueltige Frequenz
    Wellenlaenge := FrequenzInWellenlaenge(StrToFloat(EdtFrequenz.Text)*(Power(10,13)));
      if ((380.00/(Power(10,(9)))) > Wellenlaenge) or (Wellenlaenge > (780.00/(Power(10,(9))))) then
      begin
        Showmessage('Bitte gib eine Frequenz aus dem Bereich des sichtbaren Lichts an.');
        EdtFrequenz.Text := '47';
        Wellenlaenge := StrToFloat(EdtFrequenz.Text) / (Power(10,(9)));
      end;

    //Wellenlaenge ergaenzen
    EdtWellenlaenge.Text := FloatToStr(Wellenlaenge * Power(10,9));

    //Aufruf zur Berechnung und zum Zeichnen
    GZoomfaktor:=100000*Round(TBZoom.Position/2);
    GWellenlaenge := Wellenlaenge;
    GMaximaAbstand := AbstandMaxima(GSchirmAbstand,GSpaltAbstand,GWellenlaenge);
    //Zeichnen(GMaximaAbstand);

  end;


end;


procedure TFrmProjektionsflaeche.Zeichnen(a: real);
var posx: integer;                                                              //x-Position des Stiftes
    farbe: string;
begin
  if A>0.5 then
   begin
    //Leeren des Schirms
    Schirm.Picture := nil;

    //Zuweisung der Stiftfarbe
    farbe := '$00' + Ufarbtabelle.Farbe(GWellenlaenge*(Power(10,(9))));
    Schirm.Canvas.Pen.Color := Stringtocolor(farbe);

    //Stift in Schirmmitte positionieren
    posx := Schirm.Width div 2;

    //Maximum 0. Ordnung zeichnen
    Schirm.Canvas.MoveTo(posx, Schirm.Height div 30);
    Schirm.Canvas.LineTo(posx, Schirm.Height-(Schirm.Height div 30));

    //Maxima >0. Ordnung zeichnen (Maxima rechts der Mitte)
    posx := Schirm.Width div 2;
    repeat
      posx := round(posx + a);
      Schirm.Canvas.MoveTo(posx, Schirm.Height div 30);
      Schirm.Canvas.LineTo(posx, Schirm.Height-(Schirm.Height div 30));
    until posx > Schirm.Width;


    //Maxima <0. Ordnung zeichnen (Maxima links der Mitte)
    posx := Schirm.Width div 2;
    repeat
      posx := round(posx - a);
      Schirm.Canvas.MoveTo(posx, Schirm.Height div 30);
      Schirm.Canvas.LineTo(posx, Schirm.Height-(Schirm.Height div 30));
    until posx < 0;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

//Berechnung und Zeichnen über die Panels

//Panel Blau
procedure TFrmProjektionsflaeche.PnlBlauClick(Sender: TObject);
begin
  GMaximaAbstand := AbstandMaxima(1000,10,Konstantenbox.KBlau)*(1/TBZoom.Position);
  GWellenlaenge := Konstantenbox.KBlau;
  Zeichnen(GMaximaAbstand);
end;

//Panel Gelb
procedure TFrmProjektionsflaeche.PnlGelbClick(Sender: TObject);
begin
  GMaximaAbstand := AbstandMaxima(1000,10,Konstantenbox.KGelb)*(1/TBZoom.Position);
  GWellenlaenge := Konstantenbox.KGelb;
  Zeichnen(GMaximaAbstand);
end;

//Panel Gruen
procedure TFrmProjektionsflaeche.PnlGruenClick(Sender: TObject);
begin
  GMaximaAbstand := AbstandMaxima(1000,10,Konstantenbox.KGruen)*(1/TBZoom.Position);
  GWellenlaenge := Konstantenbox.KGruen;
  Zeichnen(GMaximaAbstand);
end;

//Panel Orange
procedure TFrmProjektionsflaeche.PnlOrangeClick(Sender: TObject);
begin
  GMaximaAbstand := AbstandMaxima(1000,10,Konstantenbox.KOrange)*(1/TBZoom.Position);
  GWellenlaenge := Konstantenbox.KOrange;
  Zeichnen(GMaximaAbstand);
end;

//Panel Rot
procedure TFrmProjektionsflaeche.PnlRotClick(Sender: TObject);
begin
  GMaximaAbstand := AbstandMaxima(1000,10,Konstantenbox.KRot)*(1/TBZoom.Position);
  GWellenlaenge := Konstantenbox.KRot;
  Zeichnen(GMaximaAbstand);
end;

//Panel Violett
procedure TFrmProjektionsflaeche.PnlViolettClick(Sender: TObject);
begin
  GMaximaAbstand := AbstandMaxima(1000,10,Konstantenbox.KViolett)*(1/TBZoom.Position);
  GWellenlaenge := Konstantenbox.KViolett;
  Zeichnen(GMaximaAbstand);
end;

////////////////////////////////////////////////////////////////////////////////

//HINTERGRUND


//Festlegung des Hintergrundes mit Abstimmung mit den Checkboxen der Graphischen Optionen
procedure TFrmProjektionsflaeche.Background();
begin
  FrmgraphischeOptionen.DrawBackground(Schirm);
end;

procedure TFrmProjektionsflaeche.Schrifteinstellungen;
begin
  //Schriftgroesse
  PnlOptionen.Font.Size:= Konstantenbox.Ueberschrift;
  EdtWellenlaenge.Font.Size:= Konstantenbox.Schrift;
  LblWellenlaenge.Font.Size:= Konstantenbox.Schrift;
  LblFrequenz.Font.Size:= Konstantenbox.Schrift;
  EdtFrequenz.Font.Size:= Konstantenbox.Schrift;
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
  
  //Schriftart
  PnlOptionen.Font.Name:= Konstantenbox.Schriftart;
  EdtWellenlaenge.Font.Name:= Konstantenbox.Schriftart;
  LblWellenlaenge.Font.Name:= Konstantenbox.Schriftart;
  LblFrequenz.Font.Name:= Konstantenbox.Schriftart;
  EdtFrequenz.Font.Name:= Konstantenbox.Schriftart;
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

  //Schriftfarbe
  PnlOptionen.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtWellenlaenge.Font.Color:= Konstantenbox.Schriftfarbe;
  LblWellenlaenge.Font.Color:= Konstantenbox.Schriftfarbe;
  LblFrequenz.Font.Color:= Konstantenbox.Schriftfarbe;
  EdtFrequenz.Font.Color:= Konstantenbox.Schriftfarbe;
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
end;

procedure TFrmProjektionsflaeche.Resetbutton;
begin
  BtnReset.Top := BtnStart.Top;
  BtnReset.Left := 160;
  BtnReset.Width := 60;
  BtnReset.Height := 20;
  BtnReset.Caption := 'Reset';
end;

procedure TFrmProjektionsflaeche.Reset;
begin
  //Schirm zurücksetzen
  Schirm.Picture:=nil;
  Schirm.Canvas;
  Canvaseinstellungen;
  EdtFrequenz.Text := '';

  //Linela zurücksetzen
  Linealbasis;
  Linealskala;
end;


end.
