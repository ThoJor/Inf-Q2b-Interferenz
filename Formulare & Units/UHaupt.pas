unit UHaupt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UInfo, UVersuchsuebersicht, UToolbox, Projektionsflaeche;

type
  TFrmHaupt = class(TForm)
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
    procedure BtnStartClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormHaupt: TFrmHaupt;

implementation

{$R *.dfm}

//Programm beim Schließen terminieren
procedure TFrmHaupt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrmHaupt.FormCreate(Sender: TObject);
begin
  HomeSettings;
  HeadingSettings;
  BtnStartSettings;
  BtnVersuchsaufbauSettings;
  LInfoSettings;
end;

//Eigenschaften des Hauptmenüs
procedure TFrmHaupt.HomeSettings();
begin
  FormHaupt.Width := 400;
  FormHaupt.Height := 300;
  FormHaupt.BorderStyle := bsDialog;
  FormHaupt.Caption := 'Interferenzo - Home';
  FormHaupt.Position := poDesktopCenter;
end;

//Eigenschaften der Überschrift
procedure TFrmHaupt.HeadingSettings;
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
procedure TFrmHaupt.BtnStartSettings;
begin
  BtnStart.Top := LProgrammname.Top + (FormHaupt.Height div 5);
  BtnStart.Left := FormHaupt.Width div 10;
  BtnStart.Width := FormHaupt.Width - (FormHaupt.Width div 5);
  BtnStart.Caption := 'Start';
end;

//Eigenschaften des Versuchsaufbau-Button
procedure TFrmHaupt.BtnVersuchsaufbauSettings;
begin
  BtnVersuchsaufbau.Top := BtnStart.Top + (FormHaupt.Height div 10);
  BtnVersuchsaufbau.Left := BtnStart.Left;
  BtnVersuchsaufbau.Width := BtnStart.Width;
  BtnVersuchsaufbau.Caption := 'Versuchsübersicht';
end;

//Eigenschaften des Info-Labels (Inhalt: Nutzungsbedingungen und Impressum)
procedure TFrmHaupt.LInfoSettings;
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

procedure TFrmHaupt.BtnStartClick(Sender: TObject);
begin
  FrmProjektionsflaeche.Show;
  FormHaupt.Hide;
end;

procedure TFrmHaupt.BtnVersuchsaufbauClick(Sender: TObject);
begin
  FormVersuchsuebersicht.ShowModal;
end;

procedure TFrmHaupt.LInfoClick(Sender: TObject);
begin
  FormInfo.ShowModal;
end;


end.
