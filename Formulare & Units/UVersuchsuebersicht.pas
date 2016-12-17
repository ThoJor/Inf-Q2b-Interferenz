unit UVersuchsuebersicht;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

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
    function Textimport(Filename: string):string;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormVersuchsuebersicht: TFormVersuchsuebersicht;
  Path: String;

implementation

{$R *.dfm}

procedure TFormVersuchsuebersicht.FormCreate(Sender: TObject);
begin
  Path:= GetCurrentDir;
  FormEinstellungen;
  ImgAufbauEinstellungen;
  ImgTYoungEinstellungen;
  LVersuchEinstellungen;
end;

//Einstellungen bezüglich des Formulars an sich
procedure TFormVersuchsuebersicht.FormEinstellungen();
begin
  FormVersuchsuebersicht.Height := 600;
  FormVersuchsuebersicht.Width := 800;
  FormVersuchsuebersicht.Caption := 'Interferenzo - Versuchsübersicht';
end;

//Einstellungen für das Image, in dem der Versuchsaufbau dargestellt wird
procedure TFormVersuchsuebersicht.ImgAufbauEinstellungen();
begin
  ImgAufbau.Stretch := true;
  ImgAufbau.Width := FormVersuchsuebersicht.Width - (Formversuchsuebersicht.Width div 15);
  ImgAufbau.Height := (ImgAufbau.Width div 3);
  ImgAufbau.Top := (FormVersuchsuebersicht.Height - ImgAufbau.Height) - (FormVersuchsuebersicht.Width div 20);
  ImgAufbau.Left := FormVersuchsuebersicht.Width div 30;
end;

//Einstellungen für das Image, das ein Bild von Thomas Young enthält
procedure TFormVersuchsuebersicht.ImgTYoungEinstellungen();
begin
  ImgTYoung.Stretch := true;
  ImgTYoung.Width := FormVersuchsuebersicht.Width div 4;
  ImgTYoung.Height := FormVersuchsuebersicht.Height div 4;
  ImgTYoung.Top := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Left := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Picture.LoadFromFile(Path+'\TYoung.png');
  ImgTYoung.Stretch:=true;
end;

//Einstellungen für das Label, das den Versuchsaufbau und den historischen Hintergrund in Textform darstellt
procedure TFormVersuchsuebersicht.LVersuchEinstellungen();
begin
  LVersuch.Top := ImgTYoung.Top;
  LVersuch.Left := ImgTYoung.Left + ImgTYoung.Width + (FormVersuchsuebersicht.Width div 30);
  LVersuch.Width := FormVersuchsuebersicht.Width - ImgTYoung.Width - (FormVersuchsuebersicht.Width div 15);
  LVersuch.Height := ImgTYoung.Height;
  LVersuch.Caption := Textimport(Path+'\Versuchsuebersicht.txt');
end;

//Prozedur zum Textimport (aus einer .txt Datei in einen String)
function TFormVersuchsuebersicht.Textimport(Filename: string):string;
var
  txt: TStringList;
  i: Integer;
  temp: String;
begin
  temp:='';
  txt:= TStringList.Create;
  txt.LoadFromFile(Filename);
  for i:= 0 to txt.count - 1 do
    begin
    temp := temp + txt.Strings[i];
      if (i mod 10)=0 then
      temp := temp + txt.Strings[i] + #13#10
      else
      temp := temp + txt.Strings[i];
    end;

  result := temp;
end;

end.
