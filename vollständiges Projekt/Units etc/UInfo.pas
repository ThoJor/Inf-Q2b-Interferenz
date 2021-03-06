unit UInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Konstantenbox;

type
  TFormInfo = class(TForm)
    LNutzungsbedingungenHead: TLabel;
    LNutzungsbedingungenBody: TLabel;
    LImpressumHead: TLabel;
    LImpressumBody: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormEinstellungen();
    procedure HeadingNutzungsbedingungenSettings();
    procedure NutzungsbedingungenSettings();
    procedure HeadingImpressumSettings();
    procedure ImpressumSettings();
    function Textimport(Filename: String):String;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormInfo: TFormInfo;
  Path : String;

implementation

{$R *.dfm}

procedure TFormInfo.FormCreate(Sender: TObject);
begin
  FormInfo.Scaled:=false;
  Path:= GetCurrentDir;
  FormEinstellungen;
  HeadingNutzungsbedingungenSettings;
  NutzungsbedingungenSettings;
  HeadingImpressumSettings;
  ImpressumSettings;
end;

//Eigenschaften des Formulars
procedure TFormInfo.FormEinstellungen;
begin
  FormInfo.Caption := 'Nutzungsbedingungen & Kontaktinformationen';
  FormInfo.Width := 400;
  FormInfo.Height := 900;
  FormInfo.BorderStyle := bsSingle;
  FormInfo.Position:=poDefault;
end;

//Eigenschaften der Ueberschrift f�r die Nutzungsbedingungen
procedure TFormInfo.HeadingNutzungsbedingungenSettings;
begin
  LNutzungsbedingungenHead.AutoSize := false;
  LNutzungsbedingungenHead.Width := FormInfo.Width - (FormInfo.Width div 5);
  LNutzungsbedingungenHead.Font.Size := round(Konstantenbox.Ueberschrift/96*80);
  LNutzungsbedingungenHead.Height := LNutzungsbedingungenHead.Font.Size + 10;
  LNutzungsbedingungenHead.Left := FormInfo.Width div 10;
  LNutzungsbedingungenHead.Top := FormInfo.Height div 30;
  LNutzungsbedingungenHead.Font.Color := Konstantenbox.Schriftfarbe;
  LNutzungsbedingungenHead.Caption := 'Nutzungsbedingungen';
  LNutzungsbedingungenHead.Font.Name:= Konstantenbox.Schriftart;

end;

//Eigenschaften der Nutzungsbedingungen
procedure TFormInfo.NutzungsbedingungenSettings;
var NutzungsbedingungenText, Filename: string;
begin
  LNutzungsbedingungenBody.AutoSize := false;
  LNutzungsbedingungenBody.Width := FormInfo.Width - (FormInfo.Width div 5);
  LNutzungsbedingungenBody.Font.Size := Konstantenbox.Schrift;
  LNutzungsbedingungenBody.Left := FormInfo.Width div 10;
  LNutzungsbedingungenBody.Top := LNutzungsbedingungenHead.Height + (FormInfo.Height div 20);
  LNutzungsbedingungenBody.Height := FormInfo.Height div 2 - LNutzungsbedingungenBody.Top;
  LNutzungsbedingungenBody.Font.Color := Konstantenbox.Schriftfarbe;
  Filename:= Path+'\Nutzungsbedingungen.txt';
  LNutzungsbedingungenBody.Caption := Textimport(Filename);
  LNutzungsbedingungenBody.Font.Name:= Konstantenbox.Schriftart;
  LNutzungsbedingungenBody.Font.Size:=8;
  LNutzungsbedingungenBody.WordWrap:=true;

end;

//Eigenschaften der Ueberschrift des Impressums
procedure TFormInfo.HeadingImpressumSettings;
begin
  LImpressumHead.AutoSize := false;
  LImpressumHead.Width := FormInfo.Width - (FormInfo.Width div 5);
  LImpressumHead.Font.Size := round(Konstantenbox.Ueberschrift/96*80);
  LImpressumHead.Height := LImpressumHead.Font.Size + 10;
  LImpressumHead.Left := FormInfo.Width div 10;
  LImpressumHead.Top := 300;
  LImpressumHead.Font.Color := Konstantenbox.Schriftfarbe;
  LImpressumHead.Caption := 'Kontakt';
  LImpressumHead.Font.Name:= Konstantenbox.Schriftart;
end;

//Eigenschaften des Impressums
procedure TFormInfo.ImpressumSettings;
var ImpressumText, Filename: string;
begin
  LImpressumBody.AutoSize := false;
  LImpressumBody.Width := FormInfo.Width - (FormInfo.Width div 5);
  LImpressumBody.Font.Size := Konstantenbox.Schrift;
  LImpressumBody.Left := FormInfo.Width div 10;
  LImpressumBody.Top := 300 + LImpressumHead.Height;
  LImpressumBody.Height := 10000;
  LImpressumBody.Font.Color := Konstantenbox.Schriftfarbe;
  LImpressumBody.Caption := 'Hier wird dann auch mal Inhalt aus einer .txt Datei' + #13#10 + 'eingelesen, weil 255 Zeichen vermutlich nicht reichen.';
  Filename :=Path+'\Kontaktinformationen.txt';
  LImpressumBody.Caption := TextImport(Filename);
  LImpressumBody.Font.Name:= Konstantenbox.Schriftart;
  LImpressumBody.Font.Size:=8;
  LImpressumBody.WordWrap:=true;
end;

function TFormInfo.Textimport(Filename: string):string;
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
