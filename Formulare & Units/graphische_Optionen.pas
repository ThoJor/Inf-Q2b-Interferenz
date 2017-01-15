unit graphische_Optionen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Konstantenbox,
  Vcl.ExtCtrls;

type
  TFrmGraphischeOptionen = class(TForm)
    CBLineal: TCheckBox;
    ChBBgBlack: TCheckBox;
    ChBBgWhite: TCheckBox;
    ChBBgVerlauf: TCheckBox;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ChBBgBlackClick(Sender: TObject);
    procedure ChBBgWhiteClick(Sender: TObject);
    procedure ChBBgVerlaufClick(Sender: TObject);
    procedure DrawBackground(Flaeche: TImage);
    procedure DrawGradientH(Canvas: TCanvas; Color1, Color2: TColor; Rect: TRect);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmGraphischeOptionen: TFrmGraphischeOptionen;

  GBackgroundBlack: boolean;
  GBackgroundWhite: boolean;
  GBackgroundGradient: boolean;


implementation

{$R *.dfm}

procedure TFrmGraphischeOptionen.FormCreate(Sender: TObject);
begin
  //Namensgebung
  FrmGraphischeOptionen.Caption:= 'Interferenzo - Optionen';
  CBLineal.Caption:= 'Lineal';
  ChBBgBlack.Caption:= 'Schwarz';
  ChBBgWhite.Caption:= 'Weiß';
  ChBBgVerlauf.Caption:= 'Verlauf';


  //Fenstergroeße
  FrmGraphischeOptionen.Width:= 500;
  FrmGraphischeOptionen.Height:= (50 * Konstantenbox.KAnzahlCheckboxen) + 50;

  //Fensterposition
  Position:= poScreenCenter;

  //Position CheckBox
  CBLineal.Top:= 15;
  ChBBgBlack.Top:= 15*2+Konstantenbox.KCheckBoxHoehe;
  ChBBgWhite.Top:= 15*3+Konstantenbox.KCheckBoxHoehe*2;
  ChBBgVerlauf.Top:= 15*4+Konstantenbox.KCheckBoxHoehe*3;
  CBLineal.Left:= 20;
  ChBBgBlack.Left:= 20;
  ChBBgWhite.Left:= 20;
  ChBBgVerlauf.Left:= 20;

  //Groeße CheckBox
  CBLineal.Height:= Konstantenbox.KCheckBoxHoehe;
  ChBBgBlack.Height := Konstantenbox.KCheckBoxHoehe;
  ChBBgWhite.Height := Konstantenbox.KCheckBoxHoehe;
  ChBBgVerlauf.Height := Konstantenbox.KCheckBoxHoehe;
  CBLineal.Width:= Konstantenbox.KCheckBoxWidth;
  ChBBgBlack.Width := Konstantenbox.KCheckBoxWidth;
  ChBBgWhite.Width := Konstantenbox.KCheckBoxWidth;
  ChBBgVerlauf.Width := Konstantenbox.KCheckBoxWidth;

  //Schriftgroesse Checkbox
  CBLineal.Font.Size:= Konstantenbox.Schrift;
  ChBBgBlack.Font.Size:= Konstantenbox.Schrift;
  ChBBgWhite.Font.Size:= Konstantenbox.Schrift;
  ChBBgVerlauf.Font.Size:= Konstantenbox.Schrift;

  //Schriftart Checkbox
  CBLineal.Font.Name:= Konstantenbox.Schriftart;
  ChBBgBlack.Font.Name:= Konstantenbox.Schriftart;
  ChBBgWhite.Font.Name:= Konstantenbox.Schriftart;
  ChBBgVerlauf.Font.Name:= Konstantenbox.Schriftart;

  //Schriftfarbe Checkbox;
  CBLineal.Font.Color:= Konstantenbox.Schriftfarbe;
  ChBBgBlack.Font.Color:= Konstantenbox.Schriftfarbe;
  ChBBgWhite.Font.Color:= Konstantenbox.Schriftfarbe;
  ChBBgVerlauf.Font.Color:= Konstantenbox.Schriftfarbe;

  //Lineal per default an und deaktiviert
  CBLineal.Checked:= true;
  CBLineal.Enabled:= false;

  //Default Hintergrundeinstellungen - weiß ist Hintergrundfarbe
  ChBBgWhite.Checked := true;
  GBackgroundWhite := true;
  GBackgroundBlack := false;
  GBackgroundGradient := false;
end;

procedure TFrmGraphischeOptionen.ChBBgBlackClick(Sender: TObject);
begin
  ChBBgWhite.Checked := false;
  ChBBgVerlauf.Checked := false;

  GBackgroundWhite := false;
  GBackgroundBlack := true;
  GBackgroundGradient := false;
end;

procedure TFrmGraphischeOptionen.ChBBgVerlaufClick(Sender: TObject);
begin
  ChBBgBlack.Checked := false;
  ChBBgWhite.Checked := false;

  GBackgroundWhite := false;
  GBackgroundBlack := false;
  GBackgroundGradient := true;
end;

procedure TFrmGraphischeOptionen.ChBBgWhiteClick(Sender: TObject);
begin
  ChBBgBlack.Checked := false;
  ChBBgVerlauf.Checked := false;

  GBackgroundWhite := true;
  GBackgroundBlack := false;
  GBackgroundGradient := false;
end;

procedure TFrmGraphischeOptionen.DrawBackground(Flaeche: TImage);
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
    DrawGradientH(Flaeche.Canvas, $00A2AA77, $00FFFFE3, Rect(0, 0, Width, Height))
  end;


end;

procedure TFrmGraphischeOptionen.DrawGradientH(Canvas: TCanvas; Color1, Color2: TColor; Rect: TRect);
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

end.
