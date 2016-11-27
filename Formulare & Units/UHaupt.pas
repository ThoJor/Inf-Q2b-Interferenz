unit UHaupt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UInfo, UVersuchsuebersicht, UToolbox;

type
  TForm1 = class(TForm)
    LProgrammname: TLabel;
    BtnStart: TButton;
    BtnVersuchsaufbau: TButton;
    LInfo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LInfoClick(Sender: TObject);
    procedure BtnVersuchsaufbauClick(Sender: TObject);
    procedure HomeSettings();
    procedure HeadingSettings();
    procedure BtnStartSettings();
    procedure BtnVersuchsaufbauSettings();
    procedure LInfoSettings();
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormHaupt: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  HomeSettings;
  HeadingSettings;
  BtnStartSettings;
  BtnVersuchsaufbauSettings;
  LInfoSettings;
end;

//Eigenschaften des Hauptmenüs
procedure TForm1.HomeSettings();
begin
  FormHaupt.Width := 400;
  FormHaupt.Height := 300;
  FormHaupt.BorderStyle := bsDialog;
  FormHaupt.Caption := 'Interferenzo - Home';
end;

//Eigenschaften der Überschrift
procedure TForm1.HeadingSettings;
begin
  LProgrammname.AutoSize := false;
  LProgrammname.Left := 0;
  LProgrammname.Top := FormHaupt.Height div 20;
  LProgrammname.Width := FormHaupt.Width;
  LProgrammname.Font.Size := 16;
  LProgrammname.Height := LProgrammname.Font.Size + 10;
  LProgrammname.Alignment := tacenter;
  LProgrammname.Layout := tlcenter;
  LProgrammname.Caption := 'Interferenzo';
  LProgrammname.Font.Color := clteal;
  LProgrammname.Font.Style := [fsunderline];
end;

//Eigenschaften des Start-Button
procedure TForm1.BtnStartSettings;
begin
  BtnStart.Top := LProgrammname.Top + (FormHaupt.Height div 5);
  BtnStart.Left := FormHaupt.Width div 10;
  BtnStart.Width := FormHaupt.Width - (FormHaupt.Width div 5);
  BtnStart.Caption := 'Start';
end;

//Eigenschaften des Versuchsaufbau-Button
procedure TForm1.BtnVersuchsaufbauSettings;
begin
  BtnVersuchsaufbau.Top := BtnStart.Top + (FormHaupt.Height div 10);
  BtnVersuchsaufbau.Left := BtnStart.Left;
  BtnVersuchsaufbau.Width := BtnStart.Width;
  BtnVersuchsaufbau.Caption := 'Versuchsübersicht';
end;

//Eigenschaften des Info-Labels (Inhalt: Nutzungsbedingungen und Impressum)
procedure TForm1.LInfoSettings;
begin
  LInfo.Autosize := false;
  LInfo.Left := 0;
  LInfo.Top := FormHaupt.Height - (FormHaupt.Height div 5);
  LInfo.Width := FormHaupt.Width;
  LInfo.Font.Size := 8;
  LInfo.Height := LInfo.Font.Size + 10;
  LInfo.Alignment := tacenter;
  LInfo.Layout := tlcenter;
  LInfo.Caption := 'Nutzungsbedingungen und Impressum';
  LInfo.Font.Color := clgray;
end;

procedure TForm1.BtnVersuchsaufbauClick(Sender: TObject);
begin
  FormVersuchsuebersicht.ShowModal;
end;

procedure TForm1.LInfoClick(Sender: TObject);
begin
  FormInfo.ShowModal;
end;


end.
