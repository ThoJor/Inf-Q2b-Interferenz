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
    LWellen: TLabel;
    LWellenHeader: TLabel;
    LVersuchHeader: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormEinstellungen();
    procedure ImgAufbauEinstellungen();
    procedure ImgTYoungKlein();
    procedure ImgTYoungZoomed();
    procedure LEinstellungen();
    procedure LQuelleEinstellungen();
    function Textimport(Filename: string):string;
    procedure ImgTYoungClick(Sender: TObject);
    procedure LQuelleClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormVersuchsuebersicht: TFormVersuchsuebersicht;
  Path: String;
  GVergroessert : Boolean;

implementation

{$R *.dfm}

procedure TFormVersuchsuebersicht.FormCreate(Sender: TObject);
begin
  Path:= GetCurrentDir;
  FormEinstellungen;
  ImgAufbauEinstellungen;
  ImgTYoungKlein;
  LQuelleEinstellungen;
  LEinstellungen;
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
  if GVergroessert=false then ImgTYoungZoomed
  else ImgTYoungKlein;
end;

procedure TFormVersuchsuebersicht.ImgTYoungKlein();
begin
  ImgTYoung.Stretch := true;
  ImgTYoung.Width := FormVersuchsuebersicht.Width div 4;
  ImgTYoung.Height := (FormVersuchsuebersicht.Height div 25)*10;
  ImgTYoung.Top := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Left := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Picture.LoadFromFile(Path+'\TYoung.png');
  ImgTYoung.Stretch:=True;
  GVergroessert:=False;
  LQuelle.Visible:=false;
end;

procedure TFormVersuchsuebersicht.ImgTYoungZoomed();
begin
  ImgTYoung.Width :=400;
  ImgTYoung.Height :=507;
  ImgTYoung.Top := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Left := 0 + (FormVersuchsuebersicht.Width div 30);
  ImgTYoung.Picture.LoadFromFile(Path+'\TYoung.png');
  GVergroessert:=True;
  LquelleEinstellungen;
  LQuelle.Visible:=true;
end;

procedure TFormVersuchsuebersicht.LQuelleClick(Sender: TObject);
begin
  if GVergroessert=false then ImgTYoungZoomed
  else ImgTYoungKlein;
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

//Einstellungen fuer die Label, die den Versuchsaufbau und den historischen Hintergrund in Textform darstellt
procedure TFormVersuchsuebersicht.LEinstellungen();
begin
  //Ueberschrift Wellennatur
  LWellenHeader.Top:=ImgTYoung.Top;
  LWellenHeader.Left:=ImgTYoung.Left+ImgTYoung.Width+ (FormVersuchsuebersicht.Width div 30);
  LWellenHeader.Width := FormVersuchsuebersicht.Width - ImgTYoung.Width - (FormVersuchsuebersicht.Width div 15);
  LWellenHeader.Height := FormVersuchsuebersicht.Height div 35;
  LWellenHeader.Caption := 'Die Wellennatur des Lichts';
  LWellenHeader.Font.Size := 12;
  LWellenHeader.Font.Color:= Konstantenbox.Schriftfarbe;
  LWellenHeader.Font.Name:= Konstantenbox.Schriftart;
  //Wellennatur Body
  LWellen.Top:=ImgTYoung.Top+LWellenHeader.Height+(FormVersuchsuebersicht.Height div 200);
  LWellen.Left:=ImgTYoung.Left+ImgTYoung.Width+ (FormVersuchsuebersicht.Width div 30);
  LWellen.Width:= FormVersuchsuebersicht.Width - ImgTYoung.Width - (FormVersuchsuebersicht.Width div 15);
  LWellen.Height:= FormVersuchsuebersicht.Height div 35-LWellenHeader.Height;
  LWellen.AutoSize:=true;
  LWellen.WordWrap:=false;
  LWellen.Caption:= Textimport(Path+'\Wellen.txt');
  LWellen.Font.Size:= 10;
  LWellen.Font.Color:= Konstantenbox.Schriftfarbe;
  Lwellen.Font.Name:= Konstantenbox.Schriftart;
  //Überschrift Versuchsaufbau
  LVersuchHeader.Top:= ImgTYoung.Top+LWellenHeader.Height+LWellen.Height;
  LVersuchHeader.Left:= ImgTYoung.Left+ImgTYoung.Width+ (FormVersuchsuebersicht.Width div 30);
  LVersuchHeader.Width:= FormVersuchsuebersicht.Width - ImgTYoung.Width - (FormVersuchsuebersicht.Width div 15);
  LVersuchHeader.Height:= FormVersuchsuebersicht.Height div 35;
  LVersuchHeader.Caption:= 'Versuchsaufbau';
  LVersuchHeader.Font.Size:=12;
  LVersuchHeader.Font.Color:=Konstantenbox.Schriftfarbe;
  LVersuchHeader.Font.Name:=Konstantenbox.Schriftart;
  //Versuchsaufbau
  //LVersuch.AutoSize:=false;
  LVersuch.Top := ImgTYoung.Top+LWellenHeader.Height+LWellen.Height+LVersuchheader.Height+(FormVersuchsuebersicht.Height div 200);
  LVersuch.Left := ImgTYoung.Left + ImgTYoung.Width + (FormVersuchsuebersicht.Width div 30);
  LVersuch.Width := FormVersuchsuebersicht.Width - ImgTYoung.Width - (FormVersuchsuebersicht.Width div 15);
  LVersuch.Height := ImgTYoung.Height;
  LVersuch.AutoSize:=true;
  LVersuch.WordWrap:=false;
  LVersuch.Caption := Textimport(Path+'\Versuch.txt');
  LVersuch.Font.Size:= 10;
  LVersuch.Font.Color:= Konstantenbox.Schriftfarbe;
  LVersuch.Font.Name:= Konstantenbox.Schriftart;
end;

//Textimport
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
