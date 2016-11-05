unit graphische_Optionen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmGraphischeOptionen = class(TForm)
    CBLineal: TCheckBox;
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

implementation

{$R *.dfm}

procedure TFrmGraphischeOptionen.FormCreate(Sender: TObject);
begin
  //Namensgebung
  FrmGraphischeOptionen.Caption:= 'Interferenzo - Optionen';
  CBLineal.Caption:= 'Lineal';

  //Fenstergröße
  FrmGraphischeOptionen.Width:= 500;
  FrmGraphischeOptionen.Height:= 100;

  //Fensterposition
  Position:= poScreenCenter;

  //Position CheckBox
  CBLineal.Top:= 15;
  CBLineal.Left:= 20;

  //Größe CheckBox
  CBLineal.Height:= CheckBoxHoehe;
  CBLineal.Width:= CheckBoxWidth;
end;

end.
