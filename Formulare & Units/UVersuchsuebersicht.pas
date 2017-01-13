unit UVersuchsuebersicht;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Konstantenbox;

type
  TFormVersuchsuebersicht = class(TForm)
    ImgAufbau: TImage;
    ImgTYoung: TImage;
    LVersuch: TLabel;
    LQuelle: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormEinstellungen();
    procedure ImgAufbauEinstellungen();
    procedure ImgTYoungEinstellungen();
    procedure LVersuchEinstellungen();
    procedure LQuelleEinstellungen();
    function Textimport(Filename: string):string;
    procedure ImgTYoungClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormVersuchsuebersicht: TFormVersuchsuebersicht;
  Path: String;
  Vergroessert : Boolean;

implementation

{$R *.dfm}

procedure TFormVersuchsuebersicht.FormCreate(Sender: TObject);
begin
  Path:= GetCurrentDir;
  FormEinstellungen;
  ImgAufbauEinstellungen;
  ImgTYoungEinstellungen;
  LQuelleEinstellungen;
  LVersuchEinstellungen;
end;

//Einstellungen bezueglich des Formulars an sich
procedure TFormVersuchsuebersicht.FormEinstellungen();
begin
  FormVersuchsuebersicht.Height := 600;
  FormVersuchsuebersicht.Width := 800;
  FormVersuchsuebersicht.Caption := 'Interferenzo - Versuchsübersicht';
end;

//Einstellungen fuer das Image, in dem der Versuchsaufbau dargestellt wird
procedure TFormVersuchsuebersicht.ImgAufbauEinstellungen();
begin
  ImgAufbau.Stretch := true;
  ImgAufbau.Width := FormVersuchsuebersicht.Width - (Formversuchsuebersicht.Width div 15);
  ImgAufbau.Height := (ImgAufbau.Width div 3);
  ImgAufbau.Top := (FormVersuchsuebersicht.Height - ImgAufbau.Height) - (FormVersuchsuebersicht.Width div 20);
  ImgAufbau.Left := FormVersuchsuebersicht.Width div 30;
end;

//Einstellungen fuer das Image, das ein Bild von Thomas Young enthaelt
procedure TFormVersuchsuebersicht.ImgTYoungClick(Sender: TObject);
begin
  if Vergroessert=false then begin
                          ImgTYoung.Width :=400;
                          ImgTYoung.Height :=507;
                          ImgTYoung.Top := 0 + (FormVersuchsuebersicht.Width div 30);
                          ImgTYoung.Left := 0 + (FormVersuchsuebersicht.Width div 30);
                          ImgTYoung.Picture.LoadFromFile(Path+'\TYoung.png');
                          Vergroessert:=True;
                          LquelleEinstellungen;
                          LQuelle.Visible:=true;
                        end
  else begin
    ImgTYoung.Stretch := true;
    ImgTYoung.Width := FormVersuchsuebersicht.Width div 4;
    ImgTYoung.Height := (FormVersuchsuebersicht.Height div 25)*10;
    ImgTYoung.Top := 0 + (FormVersuchsuebersicht.Width div 30);
    ImgTYoung.Left := 0 + (FormVersuchsuebersicht.Width div 30);
    ImgTYoung.Picture.LoadFromFile(Path+'\TYoung.png');
    Vergroessert:=False;
    LQuelle.Visible:=false;
  end;
end;

procedure TFormVersuchsuebersicht.ImgTYoungEinstellungen();
begin
  ImgTYoung.Stretch := true;
  ImgTYoung.Width := FormVersuchsuebersicht.Width div 4;
  ImgTYoung.Height := (FormVersuchsuebersicht.Height div 25)*10;
  ImgTYoung.Top := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Left := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Picture.LoadFromFile(Path+'\TYoung.png');
  ImgTYoung.Stretch:=True;
  Vergroessert:=False;
end;

procedure TFormVersuchsuebersicht.LQuelleEinstellungen();
begin
  LQuelle.Visible:=false;
  lQuelle.Height:=50;
  lQuelle.Width:=400;
  lQuelle.Caption:='https://en.wikipedia.org/wiki/Thomas_Young_(scientist)#/media/File:Thomas_Young_(scientist).jpg';
  lQuelle.Left:=ImgTYoung.Left;
  lQuelle.Top:=ImgTYoung.Top+ImgTYoung.Height-LQuelle.Height;
  Lquelle.Font.Color:=clred;
end;

//Einstellungen fuer das Label, das den Versuchsaufbau und den historischen Hintergrund in Textform darstellt
procedure TFormVersuchsuebersicht.LVersuchEinstellungen();
begin
  LVersuch.Top := ImgTYoung.Top;
  LVersuch.Left := ImgTYoung.Left + ImgTYoung.Width + (FormVersuchsuebersicht.Width div 30);
  LVersuch.Width := FormVersuchsuebersicht.Width - ImgTYoung.Width - (FormVersuchsuebersicht.Width div 15);
  LVersuch.Height := ImgTYoung.Height;
  LVersuch.Caption := Textimport(Path+'\Versuchsuebersicht.txt');
  LVersuch.Font.Size:= 8;
  LVersuch.Font.Color:= Konstantenbox.Schriftfarbe;
  LVersuch.Font.Name:= Konstantenbox.Schriftart;
end;

//experimento  v4
function TFormVersuchsuebersicht.Textimport(Filename: string):string;
var
  txt: TStringList;
  i,k: Integer;
  temp: String;
begin
  temp:='';
  k:=0;
  txt:= TStringList.Create;
  txt.LoadFromFile(Filename);
  for i:= 0 to txt.count - 1 do
    begin
    k:=k+1;
    system.UTF8Decode(txt.Strings[i]);
    if k=1 then
      begin
        temp := temp + txt.Strings[i]+ sLineBreak;
        k:=0;
      end
    else temp := temp + txt.Strings[i];

    end;
  result := temp;
end;

end.
