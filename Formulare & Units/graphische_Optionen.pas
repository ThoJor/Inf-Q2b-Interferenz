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
    CBMaxima: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnBeendenClick(Sender: TObject);
    procedure UncheckAll();
    procedure ChBBgBlackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChBBgBlackMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChBBgWhiteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChBBgWhiteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChBBgVerlaufMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChBBgVerlaufMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmGraphischeOptionen: TFrmGraphischeOptionen;

  GBackground: Integer;  //1=Weiß, 2=Schwarz, 3=Verlauf


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
  CBMaxima.Caption:='Maximaumschaltdingens';


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
  CBMaxima.Top:=15*5+Konstantenbox.KCheckBoxHoehe*4;
  CBLineal.Left:= 20;
  ChBBgBlack.Left:= 20;
  ChBBgWhite.Left:= 20;
  ChBBgVerlauf.Left:= 20;
  CBMaxima.Left:=20;

  //Groeße CheckBox
  CBLineal.Height:= Konstantenbox.KCheckBoxHoehe;
  ChBBgBlack.Height := Konstantenbox.KCheckBoxHoehe;
  ChBBgWhite.Height := Konstantenbox.KCheckBoxHoehe;
  ChBBgVerlauf.Height := Konstantenbox.KCheckBoxHoehe;
  CBMaxima.Height:=Konstantenbox.KCheckBoxHoehe;
  CBLineal.Width:= Konstantenbox.KCheckBoxWidth;
  ChBBgBlack.Width := Konstantenbox.KCheckBoxWidth;
  ChBBgWhite.Width := Konstantenbox.KCheckBoxWidth;
  ChBBgVerlauf.Width := Konstantenbox.KCheckBoxWidth;
  CBMaxima.Width:=Konstantenbox.KCheckBoxWidth;

  //Schriftgroesse Checkbox
  CBLineal.Font.Size:= Konstantenbox.Schrift;
  ChBBgBlack.Font.Size:= Konstantenbox.Schrift;
  ChBBgWhite.Font.Size:= Konstantenbox.Schrift;
  ChBBgVerlauf.Font.Size:= Konstantenbox.Schrift;
  CBMaxima.Font.Size:=Konstantenbox.Schrift;

  //Schriftart Checkbox
  CBLineal.Font.Name:= Konstantenbox.Schriftart;
  ChBBgBlack.Font.Name:= Konstantenbox.Schriftart;
  ChBBgWhite.Font.Name:= Konstantenbox.Schriftart;
  ChBBgVerlauf.Font.Name:= Konstantenbox.Schriftart;
  CBMaxima.Font.Name:=Konstantenbox.Schriftart;

  //Schriftfarbe Checkbox;
  CBLineal.Font.Color:= Konstantenbox.Schriftfarbe;
  ChBBgBlack.Font.Color:= Konstantenbox.Schriftfarbe;
  ChBBgWhite.Font.Color:= Konstantenbox.Schriftfarbe;
  ChBBgVerlauf.Font.Color:= Konstantenbox.Schriftfarbe;
  CBMaxima.Font.Color:= Konstantenbox.Schriftfarbe;

  //Lineal per default an und deaktiviert
  CBLineal.Checked:= true;
  CBLineal.Enabled:= false;

  //An
  CBMaxima.Checked:=true;

  //Default Hintergrundeinstellungen - weiß ist Hintergrundfarbe
  ChBBgWhite.Checked := true;
  GBackground := 1;
end;

procedure TFrmGraphischeOptionen.BtnBeendenClick(Sender: TObject);
begin
  FrmGraphischeOptionen.close;
end;

procedure TFrmGraphischeOptionen.UncheckAll();
begin
  if ChBBgBlack.Checked=true then ChBBgBlack.Checked:=false;
  if ChBBgVerlauf.Checked=true then ChBBgVerlauf.Checked:=false;
  if ChBBgWhite.Checked=true then ChBBgWhite.Checked:=false;
end;

procedure TFrmGraphischeOptionen.ChBBgBlackMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UncheckAll;
end;

procedure TFrmGraphischeOptionen.ChBBgBlackMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ChBBgBlack.Checked:=true;
  GBackGround:=2;
end;

procedure TFrmGraphischeOptionen.ChBBgVerlaufMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UncheckAll;
end;

procedure TFrmGraphischeOptionen.ChBBgVerlaufMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ChBBgVerlauf.Checked:=true;
  GBackground:=3;
end;

procedure TFrmGraphischeOptionen.ChBBgWhiteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UncheckAll;
end;

procedure TFrmGraphischeOptionen.ChBBgWhiteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ChBBgWhite.Checked:=true;
  GBackground:=1;
end;

end.
