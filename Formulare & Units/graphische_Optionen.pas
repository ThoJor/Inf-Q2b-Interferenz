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
    BtnBeenden: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ChBBgBlackClick(Sender: TObject);
    procedure ChBBgWhiteClick(Sender: TObject);
    procedure ChBBgVerlaufClick(Sender: TObject);
    procedure BtnBeendenClick(Sender: TObject);
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
  FrmGraphischeOptionen.BorderStyle:=bsNone;

  BtnBeenden.font.size:=Konstantenbox.Schrift;
  BtnBeenden.Font.Name:=Konstantenbox.Schriftart;
  BtnBeenden.Font.Color:=Konstantenbox.Schriftfarbe;

  BtnBeenden.Top:=FrmGraphischeOptionen.Height div 6*5 - 5;
  BtnBeenden.Left:=FrmGraphischeOptionen.Width div 5*4;
  BtnBeenden.Caption:='Anwenden';
  BtnBeenden.Height:=Konstantenbox.KLabelHoehe*2;
  BtnBeenden.Width:=95;

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

procedure TFrmGraphischeOptionen.BtnBeendenClick(Sender: TObject);
begin
  FrmGraphischeOptionen.close;
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

end.
