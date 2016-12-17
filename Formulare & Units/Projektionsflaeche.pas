﻿unit Projektionsflaeche;

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
    EdtAbstand: TEdit;
    LblAbstand: TLabel;
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
    procedure DrawGradientH(Canvas: TCanvas; Color1, Color2: TColor; Rect: TRect);
    procedure Background();
    procedure PnlBlauClick(Sender: TObject);
    procedure PnlGruenClick(Sender: TObject);
    procedure PnlGelbClick(Sender: TObject);
    procedure PnlOrangeClick(Sender: TObject);
    procedure PnlRotClick(Sender: TObject);
    procedure BtnBeendenClick(Sender: TObject);
    procedure Endbutton;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmProjektionsflaeche: TFrmProjektionsflaeche;
  Zentimeter : Integer;
  Abstand : real;
  Zoomfaktor : Integer;

const
  LabelHoehe= 20;
  LabelLeft= 10;
  EditHoehe= 20;
  EditLeft= 0;
  PanelHoehe= 50;

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
  PnlFarbe.Top:= (EdtFrequenz.Top + EdtFrequenz.Height) + 10;
  PnlFarbe.Height:= (BtnOptionen.Top - (EdtFrequenz.Top + EdtFrequenz.Height)) - 20;
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
  EdtSpaltabstand.Height:= EditHoehe;
  EdtSpaltabstand.Top:= LblSpaltanzahl.Top - EdtSpaltabstand.Height - 5;
  EdtSpaltabstand.Left:= EditLeft;
  EdtSpaltabstand.Width:= Schirm.Left - EdtSpaltabstand.Left;
  EdtSpaltabstand.Text:= '';

  LblSpaltabstand.Height:= LabelHoehe;
  LblSpaltabstand.Top:= EdtSpaltabstand.Top - LblSpaltabstand.Height;
  LblSpaltabstand.Left:= LabelLeft;
  LblSpaltabstand.Width:= Schirm.Left - LblSpaltabstand.Left;
  LblSpaltabstand.Caption:= 'Spaltabstand b in ?';
end;

procedure TFrmProjektionsflaeche.Option_Spaltanzahl;
begin
  //Option Spaltanzahl
  EdtSpaltanzahl.Height:= EditHoehe;
  EdtSpaltanzahl.Top:= LblAbstand.Top - EdtSpaltanzahl.Height - 5;
  EdtSpaltanzahl.Left:= EditLeft;
  EdtSpaltanzahl.Width:= Schirm.Left - EdtSpaltanzahl.Left;
  EdtSpaltanzahl.Text:= '';

  LblSpaltanzahl.Height:= LabelHoehe;
  LblSpaltanzahl.Top:= EdtSpaltanzahl.Top - LblSpaltanzahl.Height;
  LblSpaltanzahl.Left:= LabelLeft;
  LblSpaltanzahl.Width:= Schirm.Left - LblSpaltanzahl.Left;
  LblSpaltanzahl.Caption:= 'Spaltanzahl n';
end;

procedure TFrmProjektionsflaeche.Option_Abstand_Blende_Schirm;
begin
  //Option Abstand Blende-Schirm
  EdtAbstand.Height:= EditHoehe;
  EdtAbstand.Top:= FrmProjektionsflaeche.ClientHeight - (10 + EdtAbstand.Height);
  EdtAbstand.Left:= EditLeft;
  EdtAbstand.Width:= Schirm.Left - EdtAbstand.Left;
  EdtAbstand.Text:= '';

  LblAbstand.Height:= LabelHoehe;
  LblAbstand.Top:= EdtAbstand.Top - LblAbstand.Height;
  LblAbstand.Left:= LabelLeft;
  LblAbstand.Width:= Schirm.Left - LblAbstand.Left;
  LblAbstand.Caption:= 'Abstand a in m';
end;

procedure TFrmProjektionsflaeche.Option_Frequenz;
begin
  //Option Frequenz
  LblFrequenz.Top:= 5 + EdtWellenlaenge.Top + EdtWellenlaenge.Height;
  LblFrequenz.Left:= LabelLeft;
  LblFrequenz.Width:= Schirm.Left - LblFrequenz.Left;
  LblFrequenz.Height:= LabelHoehe;
  LblFrequenz.Caption:= 'Frequenz f in Hz';

  EdtFrequenz.Top:= LblFrequenz.Top + LblFrequenz.Height;
  EdtFrequenz.Left:= EditLeft;
  EdtFrequenz.Width:= Schirm.Left - EdtFrequenz.Left;
  EdtFrequenz.Height:= EditHoehe;
  EdtFrequenz.Text:= '';
  EdtFrequenz.ReadOnly:=true;
end;

procedure TFrmProjektionsflaeche.Option_Wellenlaenge;
begin
  //Option Wellenlänge
  LblWellenlaenge.Top:= 5 + PnlOptionen.Top + PnlOptionen.Height;
  LblWellenlaenge.Left:= LabelLeft;
  LblWellenlaenge.Width:= Schirm.Left - LblWellenlaenge.Left;
  LblWellenlaenge.Height:= LabelHoehe;
  LblWellenlaenge.Caption:= 'Wellenlänge λ in nm';

  EdtWellenlaenge.Top:= LblWellenlaenge.Top + LblWellenlaenge.Height;
  EdtWellenlaenge.Left:= EditLeft;
  EdtWellenlaenge.Width:= Schirm.Left - EdtWellenlaenge.Left;
  EdtWellenlaenge.Height:= EditHoehe;
  EdtWellenlaenge.Text:= '';
end;


procedure TFrmProjektionsflaeche.Optionspanel;
begin
  //Panel Optionen
  PnlOptionen.Caption:= 'Optionen';
  PnlOptionen.Left:= 0;
  PnlOptionen.Top:= 10;
  PnlOptionen.Width:= Schirm.Left;
  PnlOptionen.Height:= PanelHoehe;
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

  //Canvasgröße veränderbar machen
  Schirm.Stretch:= true;

  //Canvasgröße
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

  //Fenstergröße (Vollbild)
  FrmProjektionsflaeche.ClientWidth:= Screen.Width;
  FrmProjektionsflaeche.ClientHeight:= Screen.Height;

  //Fensterposition
  Position:= poScreenCenter;

  //Pixeldichte festlegen (Full-HD 21,5 Zoll)
  PixelsPerInch:= 102;

  //Textgröße festlegen (Full-HD 21,5 Zoll)
  //TextHeight:= 14;

  //Fontgröße festlegen (Full-HD 21,5 Zoll)
  Font.Height:= -13;
end;

procedure TFrmProjektionsflaeche.BtnBeendenClick(Sender: TObject);
begin
  FrmProjektionsflaeche.Hide;
end;

procedure TFrmProjektionsflaeche.BtnOptionenClick(Sender: TObject);
begin
  FrmGraphischeOptionen.Show;
end;

procedure TFrmProjektionsflaeche.FormCreate(Sender: TObject);
begin
  Fenstereinstellungen;
  Canvaseinstellungen;
  Optionen;
  Linealbasis;
  Linealskala;
  Startbutton;
  Endbutton;
  Zoomleiste;
end;

procedure TFrmProjektionsflaeche.Startbutton;
begin
  BtnStart.Top:=BtnOptionen.Top+(BtnOptionen.Height*2)+5;
  BtnStart.Left:=Schirm.Left;
  BtnStart.Width:=50;
  BtnStart.Height:=20;
  BtnStart.Caption:='Start';
end;

procedure TFrmProjektionsflaeche.Endbutton;
begin
  BtnBeenden.Top:=BtnOptionen.Top+(BtnOptionen.Height*2)+50;
  BtnBeenden.Left:=Schirm.Left;
  BtnBeenden.Width:=20;
  BtnBeenden.Height:=20;
  BtnBeenden.Caption:='X';
end;

procedure TFrmProjektionsflaeche.Zoomleiste;
begin
  TBZoom.Height:=20;
  TBZoom.Width:=120;
  TBZoom.Top:=ImgLineal.Top-TBZoom.Height;
  TBZoom.Left:=FrmProjektionsflaeche.Width-TBZoom.Width;
  TBzoom.Max:=100;
  TBZoom.Min:=1;
  TBZoom.Position:=50;
  TBZoom.Visible:=False;
end;

procedure TFrmProjektionsflaeche.Linealbasis;
begin
  //Größe und Position des Image
  ImgLineal.Height:=Round((1/5) * FrmProjektionsflaeche.Height);
  ImgLineal.Width:= Schirm.Width;
  ImgLineal.Left:=FrmProjektionsflaeche.Width-ImgLineal.Width;
  ImgLineal.Top:=Round(FrmProjektionsflaeche.Height*4/5);
  with ImgLineal.canvas do
    begin
      pen.Color:=ClBlack;
    //Umriss des Lineals
      Moveto(ImgLineal.Width-1,1);
      Lineto(1,1);
      Lineto(1,ImgLineal.Height-1);
      Lineto(ImgLineal.Width-1,ImgLineal.Height-1);
      Lineto(ImgLineal.Width-1,1);
    end;
end;

procedure TFrmProjektionsflaeche.Linealskala; //Skala des Lineals
var
  I,J,K : Integer;
begin
  //Graphische Optionen - CBLineal
  // if graphische_Optionen.CBLineal.checked:=true then
  Zentimeter:=Round(ImgLineal.Width/20);
  J:=0;
  K:=0;
  ImgLineal.Picture:=nil;
  with ImgLineal.Canvas do
    begin
      //Striche von Mitte->Links mit Beschriftung
      for I := Round(ImgLineal.Width/2) to (ImgLineal.Width-11) do
        begin
          J:=J+1;
          if J = Zentimeter then begin
                                   moveto(I,1);
                                   lineto(I,Round(ImgLineal.Height/3));
                                   J:=0;
                                   K:=K+1;
                                   textout(penpos.X-2,penpos.Y,IntToStr(K));
                                 end;
        end;
      //Striche von Mitte->Rechts mit Beschriftung
      J:=Zentimeter;
      K:=1;
      for I := Round(ImgLineal.Width/2)+Zentimeter downto 1 do
        begin
          J:=J-1;
          if J = 0 then begin
                          moveto(I,1);
                          lineto(I,Round(ImgLineal.Height/3));
                          J:=Zentimeter;
                          K:=K-1;
                          textout(penpos.X-7,penpos.Y,IntToStr(K));
                        end;

        end;
    end;
end;

procedure TFrmProjektionsflaeche.TBZoomChange(Sender: TObject);
begin
  Zoomfaktor:=100000*TBZoom.Position;
//LINEAL
  //Lineal neu Zeichnen
  Linealskala;
//SCHIRM
  Zeichnen(Abstand*Zoomfaktor);
end;

//////////////////////////////////////////////////////////////////////////////////

//Berechnung und Zeichnen über Startbutton
procedure TFrmProjektionsflaeche.BtnStartClick(Sender: TObject);
  var Wellenlaenge,Frequenz: real;
begin
  TBZoom.position:=50;
  TBZoom.Visible:=true;
  //Berechnung und Zeichnen über Wellenlängen-Eingabe
  if EdtFrequenz.Text = '' then
    if EdtWellenlaenge.Text<> '' then
    begin
      //Fehlerabfrage für doppelte Eingabe
      if not (EdtFrequenz.Text = '') then
        Showmessage('Bitte gib eine Wellenlänge ODER eine Frequenz an')
        else
          //Frequenz ergänzen
          Frequenz:=Konstantenbox.KLichtgeschwindigkeit/(StrToFloat(EdtWellenlaenge.Text)*(Power(10,(-9))));
          EdtFrequenz.text:=FloatToStr(Frequenz);
          begin
            //Fehlerabfrage für ungültige Wellenlänge
            Wellenlaenge := StrToFloat(EdtWellenlaenge.Text)*(Power(10,(-9)));
              if ((380.00*(Power(10,(-9)))) > Wellenlaenge) or (Wellenlaenge > (780.00*(Power(10,(-9))))) then
                begin
                  Showmessage('Bitte gib eine Wellenlänge aus dem Bereich des sichtbaren Lichts an.');
                  EdtWellenlaenge.Text := '380';
                  Wellenlaenge := 380 *(Power(10,(-9)));
                end;
            //Aufruf zur Berechnung und zum Zeichnen
            Zoomfaktor:=100000*Round(TBZoom.Position/2);
            Abstand := AbstandMaxima(1000,Wellenlaenge)*(1/TBZoom.position);
            Zeichnen(Abstand*Zoomfaktor);
          end;
    end;
end;


procedure TFrmProjektionsflaeche.Zeichnen(a: real);
var posx: integer;                                                              //x-Position des Stiftes
    color: string;
begin
//Leeren des Schirms
Schirm.Picture := nil;

//Zuweisung der Stiftfarbe
color := '$' + Ufarbtabelle.Farbe((EdtWellenlaenge.Text));
Schirm.Canvas.Pen.Color := Stringtocolor(color);

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

////////////////////////////////////////////////////////////////////////////////

//Berechnung und Zeichnen über die Panels

//Panel Blau
procedure TFrmProjektionsflaeche.PnlBlauClick(Sender: TObject);
begin
  Abstand := AbstandMaxima(1000,Konstantenbox.KBlau)*(1/TBZoom.Position);
  Zeichnen(Abstand);
end;

//Panel Gelb
procedure TFrmProjektionsflaeche.PnlGelbClick(Sender: TObject);
begin
  Abstand := AbstandMaxima(1000,Konstantenbox.KGelb)*(1/TBZoom.Position);
  Zeichnen(Abstand);
end;

//Panel Grün
procedure TFrmProjektionsflaeche.PnlGruenClick(Sender: TObject);
begin
  Abstand := AbstandMaxima(1000,Konstantenbox.KGruen)*(1/TBZoom.Position);
  Zeichnen(Abstand);
end;

//Panel Orange
procedure TFrmProjektionsflaeche.PnlOrangeClick(Sender: TObject);
begin
  Abstand := AbstandMaxima(1000,Konstantenbox.KOrange)*(1/TBZoom.Position);
  Zeichnen(Abstand);
end;

//Panel Rot
procedure TFrmProjektionsflaeche.PnlRotClick(Sender: TObject);
begin
  Abstand := AbstandMaxima(1000,Konstantenbox.KRot)*(1/TBZoom.Position);
  Zeichnen(Abstand);
end;

//Panel Violett
procedure TFrmProjektionsflaeche.PnlViolettClick(Sender: TObject);
begin
  Abstand := AbstandMaxima(1000,Konstantenbox.KViolett)*(1/TBZoom.Position);
  Zeichnen(Abstand);
end;

////////////////////////////////////////////////////////////////////////////////

//HINTERGRUND

//Farbverlauf von einer beliebigen Farbe Color1 zu einer beliebigen Farbe Color2 (horizontal)
procedure TFrmProjektionsflaeche.DrawGradientH(Canvas: TCanvas; Color1, Color2: TColor; Rect: TRect);
var
  x, r, g, b: integer;
begin

  for X := Rect.Top to Rect.Bottom do begin
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

//Festlegung des Hintergrundes mit Abstimmung mit den Checkboxen der Graphischen Optionen
procedure TFrmProjektionsflaeche.Background();
begin

  begin
  if FrmgraphischeOptionen.ChBBgBlack.Checked = true then
  begin
    Schirm.Picture := nil;
    Schirm.Canvas.Brush.Color:=clblack;
    Schirm.Canvas.Pen.Color:=clblack;
    Schirm.Canvas.Rectangle(0,0,Schirm.Width,Schirm.Height);
  end;

  if FrmgraphischeOptionen.ChBBgWhite.Checked = true then
  begin
    Schirm.Picture := nil;
    Schirm.Canvas.Brush.Color:=clWhite;
    Schirm.Canvas.Pen.Color:=clWhite;
    Schirm.Canvas.Rectangle(0,0,Schirm.Width,Schirm.Height);
  end;

  if FrmgraphischeOptionen.ChBBgVerlauf.Checked = true then
  begin
    DrawGradientH(Schirm.Canvas, $00A2AA77, $00FFFFE3, Rect(0, 0, Width, Height));
  end;
end;

end;


end.
