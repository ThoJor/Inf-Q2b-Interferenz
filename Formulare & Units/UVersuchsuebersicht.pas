unit UVersuchsuebersicht;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFormVersuchsuebersicht = class(TForm)
    ImgAufbau: TImage;
    ImgTYoung: TImage;
    LVersuch: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormEinstellungen();
    procedure ImgAufbauEinstellungen();
    procedure ImgTYoungEinstellungen();
    procedure LVersuchEinstellungen();
    procedure Textimport();
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormVersuchsuebersicht: TFormVersuchsuebersicht;

implementation

{$R *.dfm}

procedure TFormVersuchsuebersicht.FormCreate(Sender: TObject);
begin
  FormEinstellungen;
  ImgAufbauEinstellungen;
  ImgTYoungEinstellungen;
  LVersuchEinstellungen;
end;

//Einstellungen bez�glich des Formulars an sich
procedure TFormVersuchsuebersicht.FormEinstellungen();
begin
  FormVersuchsuebersicht.Height := 600;
  FormVersuchsuebersicht.Width := 800;
  FormVersuchsuebersicht.Caption := 'Interferenzo - Versuchs�bersicht';
end;

//Einstellungen f�r das Image, in dem der Versuchsaufbau dargestellt wird
procedure TFormVersuchsuebersicht.ImgAufbauEinstellungen();
begin
  ImgAufbau.Stretch := true;
  ImgAufbau.Width := FormVersuchsuebersicht.Width - (Formversuchsuebersicht.Width div 15);
  ImgAufbau.Height := (ImgAufbau.Width div 3);
  ImgAufbau.Top := (FormVersuchsuebersicht.Height - ImgAufbau.Height) - (FormVersuchsuebersicht.Width div 20);
  ImgAufbau.Left := FormVersuchsuebersicht.Width div 30;
end;

//Einstellungen f�r das Image, das ein Bild von Thomas Young enth�lt
procedure TFormVersuchsuebersicht.ImgTYoungEinstellungen();
begin
  ImgTYoung.Stretch := true;
  ImgTYoung.Width := FormVersuchsuebersicht.Width div 4;
  ImgTYoung.Height := FormVersuchsuebersicht.Height div 4;
  ImgTYoung.Top := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Left := 0 + (FormVersuchsuebersicht.Width div 30);
  //Bild von T. Young fehlt (mit Quelle)
end;

//Einstellungen f�r das Label, das den Versuchsaufbau und den historischen Hintergrund in Textform darstellt
procedure TFormVersuchsuebersicht.LVersuchEinstellungen();
begin
  LVersuch.Top := ImgTYoung.Top;
  LVersuch.Left := ImgTYoung.Left + ImgTYoung.Width + (FormVersuchsuebersicht.Width div 30);
  LVersuch.Width := FormVersuchsuebersicht.Width - ImgTYoung.Width - (FormVersuchsuebersicht.Width div 15);
  LVersuch.Height := ImgTYoung.Height;
  LVersuch.Caption := 'Hier wird mal ein Text aus einer .txt Datei hin importiert.';
  //textimport;
end;

//Prozedur, die aus einer .txt Datei Text importiert, diesen in eine StringList schreibt und von dort in einen String umwandelt, der dann auf ein Label geschrieben wird
procedure TFormVersuchsuebersicht.Textimport;
var
  txt: TStringList;
  i: Integer;
  temp: String;
begin
  txt:= TStringList.Create;
  txt.LoadFromFile('sinnvollesverzeichnis\Versuchsuebersicht.txt');

  for i:= 0 to txt.count - 1 do
    begin
      if (i mod 10 = 0) then
      temp := temp + txt.Strings[i] + #1310
      else
      temp:= temp + txt.Strings[i];
    end;

  LVersuch.Caption:= temp;
end;

end.