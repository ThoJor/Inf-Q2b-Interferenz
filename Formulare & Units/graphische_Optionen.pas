unit graphische_Optionen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Konstantenbox;

type
  TFrmGraphischeOptionen = class(TForm)
    CBLineal: TCheckBox;
    ChBBgBlack: TCheckBox;
    ChBBgWhite: TCheckBox;
    ChBBgVerlauf: TCheckBox;
    procedure FormCreate(Sender: TObject);
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
  AnzahlCheckboxen= 4;

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
  FrmGraphischeOptionen.Height:= (50 * AnzahlCheckboxen) + 50;

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

  //Groeße CheckBox
  CBLineal.Height:= CheckBoxHoehe;
  ChBBgBlack.Height := CheckBoxHoehe;
  ChBBgWhite.Height := CheckBoxHoehe;
  ChBBgVerlauf.Height := CheckBoxHoehe;
  CBLineal.Width:= CheckBoxWidth;
  ChBBgBlack.Width := CheckBoxWidth;
  ChBBgWhite.Width := CheckBoxWidth;
  ChBBgVerlauf.Width := CheckBoxWidth;

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

  //Lineal per default an
  CBLineal.Checked:= true;


end;

end.
