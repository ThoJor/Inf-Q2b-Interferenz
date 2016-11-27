unit UInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    procedure Textimport(Text, Filename: String);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormInfo: TFormInfo;

implementation

{$R *.dfm}

procedure TFormInfo.FormCreate(Sender: TObject);
begin
  FormEinstellungen;
  HeadingNutzungsbedingungenSettings;
  NutzungsbedingungenSettings;
  HeadingImpressumSettings;
  ImpressumSettings;
end;

//Eigenschaften des Formulars
procedure TFormInfo.FormEinstellungen;
begin
  FormInfo.Caption := 'Nutzungsbedingungen & Impressum';
  FormInfo.Width := 400;
  FormInfo.Height := 600;
  FormInfo.BorderStyle := bsDialog;
end;

//Eigenschaften der Überschrift für die Nutzungsbedingungen
procedure TFormInfo.HeadingNutzungsbedingungenSettings;
begin
  LNutzungsbedingungenHead.AutoSize := false;
  LNutzungsbedingungenHead.Width := FormInfo.Width - (FormInfo.Width div 5);
  LNutzungsbedingungenHead.Font.Size := 16;
  LNutzungsbedingungenHead.Height := LNutzungsbedingungenHead.Font.Size + 10;
  LNutzungsbedingungenHead.Left := FormInfo.Width div 10;
  LNutzungsbedingungenHead.Top := FormInfo.Height div 10;
  LNutzungsbedingungenHead.Font.Color := clTeal;
  LNutzungsbedingungenHead.Caption := 'Nutzungsbedingungen';
end;

//Eigenschaften der Nutzungsbedingungen
procedure TFormInfo.NutzungsbedingungenSettings;
var NutzungsbedingungenText, Filename: string;
begin
  LNutzungsbedingungenBody.AutoSize := false;
  LNutzungsbedingungenBody.Width := FormInfo.Width - (FormInfo.Width div 5);
  LNutzungsbedingungenBody.Font.Size := 10;
  LNutzungsbedingungenBody.Left := FormInfo.Width div 10;
  LNutzungsbedingungenBody.Top := LNutzungsbedingungenHead.Height + 2*(FormInfo.Height div 10);
  LNutzungsbedingungenBody.Height := FormInfo.Height div 2 - LNutzungsbedingungenBody.Top;
  LNutzungsbedingungenBody.Font.Color := clblack;
  LNutzungsbedingungenBody.Caption := 'Hier wird dann mal Inhalt aus einer .txt Datei' + #13#10 + 'eingelesen, weil 255 Zeichen vermutlich nicht reichen.';
  //Filename := 'sinnvollesverzeichnis\Versuchsuebersicht.txt';
  //Textimport(NutzungsbedingungenText, Filename);
  //LNutzungsbedingungenBody.Caption := NutzungsbedingungenText;

end;

//Eigenschaften der Überschrift des Impressums
procedure TFormInfo.HeadingImpressumSettings;
begin
  LImpressumHead.AutoSize := false;
  LImpressumHead.Width := FormInfo.Width - (FormInfo.Width div 5);
  LImpressumHead.Font.Size := 16;
  LImpressumHead.Height := LImpressumHead.Font.Size + 10;
  LImpressumHead.Left := FormInfo.Width div 10;
  LImpressumHead.Top := (FormInfo.Height div 2) + FormInfo.Height div 10;
  LImpressumHead.Font.Color := clTeal;
  LImpressumHead.Caption := 'Impressum';
end;

//Eigenschaften des Impressums
procedure TFormInfo.ImpressumSettings;
var ImpressumText, Filename: string;
begin
  LImpressumBody.AutoSize := false;
  LImpressumBody.Width := FormInfo.Width - (FormInfo.Width div 5);
  LImpressumBody.Font.Size := 10;
  LImpressumBody.Left := FormInfo.Width div 10;
  LImpressumBody.Top := (FormInfo.Height div 2) + LImpressumHead.Height + 2*(FormInfo.Height div 10);
  LImpressumBody.Height := FormInfo.Height div 2 - LNutzungsbedingungenBody.Top;
  LImpressumBody.Font.Color := clblack;
  LImpressumBody.Caption := 'Hier wird dann auch mal Inhalt aus einer .txt Datei' + #13#10 + 'eingelesen, weil 255 Zeichen vermutlich nicht reichen.';
  //Filename := 'sinnvollesverzeichnis\Versuchsuebersicht.txt';
  //Textimport(ImpressumText, Filename);
  //LImpressumBody.Caption := ImpressumText;
end;

//Prozedur zum Textimport (aus einer .txt Datei in einen String)
procedure TFormInfo.Textimport(Text, Filename: string);
var
  txt: TStringList;
  i: Integer;
  temp: String;
begin
  txt:= TStringList.Create;
  txt.LoadFromFile(Filename);

  for i:= 0 to txt.count - 1 do
    begin
      if (i mod 10 = 0) then
      temp := temp + txt.Strings[i] + #1310
      else
      temp := temp + txt.Strings[i];
    end;

  Text := temp;
end;

end.
