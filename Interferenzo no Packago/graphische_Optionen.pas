unit graphische_Optionen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Projektionsflaeche;

type
  TFrmGraphischeOptionen = class(TForm)
    CBLineal: TCheckBox;
    ChBBgBlack: TCheckBox;
    ChBBgWhite: TCheckBox;
    ChBBgVerlauf: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DrawGradientH(Canvas: TCanvas; Color1, Color2: TColor; Rect: TRect);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmGraphischeOptionen: TFrmGraphischeOptionen;

const
  CheckBoxHoehe= 20;
  CheckBoxWidth= 300;

implementation

{$R *.dfm}

procedure TFrmGraphischeOptionen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  begin
  if ChBBgBlack.Checked = true then
  begin
    FrmProjektionsflaeche.Schirm.Picture := nil;
    FrmProjektionsflaeche.Schirm.Canvas.Brush.Color:=clblack;
    FrmProjektionsflaeche.Schirm.Canvas.Pen.Color:=clblack;
    FrmProjektionsflaeche.Schirm.Canvas.Rectangle(0,0,FrmProjektionsflaeche.Schirm.Width,FrmProjektionsflaeche.Schirm.Height);
  end;

  if ChBBgWhite.Checked = True then
  begin
    FrmProjektionsflaeche.Schirm.Picture := nil;
    FrmProjektionsflaeche.Schirm.Canvas.Brush.Color:=clWhite;
    FrmProjektionsflaeche.Schirm.Canvas.Pen.Color:=clWhite;
    FrmProjektionsflaeche.Schirm.Canvas.Rectangle(0,0,FrmProjektionsflaeche.Schirm.Width,FrmProjektionsflaeche.Schirm.Height);
  end;

  if ChBBgVerlauf.Checked = True then
  begin
    DrawGradientH(FrmProjektionsflaeche.Schirm.Canvas, $00A2AA77, $00FFFFE3, Rect(0, 0, Width, Height));
  end;
end;
end;

procedure TFrmGraphischeOptionen.FormCreate(Sender: TObject);
begin
  //Namensgebung
  FrmGraphischeOptionen.Caption:= 'Interferenzo - Optionen';
  CBLineal.Caption:= 'Lineal';
  ChBBgBlack.Caption:= 'Schwarz';
  ChBBgWhite.Caption:= 'Weiß';
  ChBBgVerlauf.Caption:= 'Verlauf';


  //Fenstergröße
  FrmGraphischeOptionen.Width:= 500;
  FrmGraphischeOptionen.Height:= 100;

  //Fensterposition
  Position:= poScreenCenter;

  //Position CheckBox
  CBLineal.Top:= 15;
  ChBBgBlack.Top:= 15*2+CheckBoxHoehe;
  ChBBgWhite.Top:= 15*3+CheckBoxHoehe*2;
  ChBBgVerlauf.Top:= 15*4+CheckBoxHoehe*3;
  CBLineal.Left:= 20;
  ChBBgBlack.Left:= 20;
  ChBBgWhite.Left:= 20;
  ChBBgVerlauf.Left:= 20;

  //Größe CheckBox
  CBLineal.Height:= CheckBoxHoehe;
  ChBBgBlack.Height := CheckBoxHoehe;
  ChBBgWhite.Height := CheckBoxHoehe;
  ChBBgVerlauf.Height := CheckBoxHoehe;
  CBLineal.Width:= CheckBoxWidth;
  ChBBgBlack.Width := CheckBoxWidth;
  ChBBgWhite.Width := CheckBoxWidth;
  ChBBgVerlauf.Width := CheckBoxWidth;

end;

procedure TFrmGraphischeOptionen.DrawGradientH(Canvas: TCanvas; Color1, Color2: TColor; Rect: TRect);
var
  X, R, G, B: Integer;
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
