unit UHaupt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UInfo, UVersuchsuebersicht, UToolbox, Projektionsflaeche,
  Vcl.ExtCtrls, Vcl.StdCtrls, Konstantenbox;

type
  TFrmHaupt = class(TForm)
    LProgrammname: TLabel;
    BtnStart: TButton;
    BtnVersuchsaufbau: TButton;
    LInfo: TLabel;
    TimerProjektionsflaeche: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure HomeSettings();
    procedure HeadingSettings();
    procedure BtnStartSettings();
    procedure BtnVersuchsaufbauSettings();
    procedure LInfoSettings();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnStartClick(Sender: TObject);
    procedure BtnVersuchsaufbauClick(Sender: TObject);
    procedure LInfoClick(Sender: TObject);
    procedure TimerProjektionsflaecheTimer(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmHaupt: TFrmHaupt;

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

  TimerProjektionsflaeche.Enabled:= false;
end;

//Eigenschaften des Hauptmenues
procedure TFrmHaupt.HomeSettings();
begin
  FrmHaupt.Width := 400;
  FrmHaupt.Height := 300;
  FrmHaupt.BorderStyle := bsDialog;
  FrmHaupt.Caption := 'Interferenzo - Home';
  FrmHaupt.Position := poScreenCenter;
end;

//Eigenschaften der Ueberschrift
procedure TFrmHaupt.HeadingSettings;
begin
  LProgrammname.AutoSize := false;
  LProgrammname.Left := 0;
  LProgrammname.Top := FrmHaupt.Height div 20;
  LProgrammname.Width := FrmHaupt.Width;
  LProgrammname.Font.Size := Konstantenbox.Ueberschrift;
  LProgrammname.Height := LProgrammname.Font.Size + 10;
  LProgrammname.Alignment := tacenter;
  LProgrammname.Layout := tlcenter;
  LProgrammname.Caption := 'Interferenzo';
  LProgrammname.Font.Color := Konstantenbox.Schriftfarbe;
  LProgrammname.Font.Style := [fsunderline];
  LProgrammname.Font.Name:= Konstantenbox.Schriftart;
end;

//Zeigen der Projektionsflaeche und Verstecken des Hauptmenues
procedure TFrmHaupt.BtnStartClick(Sender: TObject);
begin
  FrmProjektionsflaeche.Show;
  FrmHaupt.Hide;
  TimerProjektionsflaeche.Enabled:= true;
end;


//Eigenschaften des Start-Buttons
procedure TFrmHaupt.BtnStartSettings;
begin
  BtnStart.Top := LProgrammname.Top + (FrmHaupt.Height div 5);
  BtnStart.Left := FrmHaupt.Width div 10;
  BtnStart.Width := FrmHaupt.Width - (FrmHaupt.Width div 5);
  BtnStart.Caption := 'Start';
  BtnStart.Font.Size:= Konstantenbox.Schrift;
  BtnStart.Font.Color:= Konstantenbox.Schriftfarbe;
  BtnStart.Font.Name:= Konstantenbox.Schriftart;
end;


procedure TFrmHaupt.BtnVersuchsaufbauClick(Sender: TObject);
begin
  FormVersuchsuebersicht.ShowModal;
end;

//Eigenschaften des Versuchsaufbau-Buttons
procedure TFrmHaupt.BtnVersuchsaufbauSettings;
begin
  BtnVersuchsaufbau.Top := BtnStart.Top + (FrmHaupt.Height div 10);
  BtnVersuchsaufbau.Left := BtnStart.Left;
  BtnVersuchsaufbau.Width := BtnStart.Width;
  BtnVersuchsaufbau.Caption := 'Versuchsübersicht';
  //BtnVersuchsaufbau.Size:= Konstantenbox.Schrift;
  //BtnVersuchsaufbau.Color:= Konstantenbox.Schriftfarbe;
  BtnVersuchsaufbau.Name:= Konstantenbox.Schriftart;
end;


procedure TFrmHaupt.LInfoClick(Sender: TObject);
begin
  FormInfo.ShowModal;
end;

//Eigenschaften des Info-Labels (Inhalt: Nutzungsbedingungen und Kontakt)
procedure TFrmHaupt.LInfoSettings;
begin
  LInfo.Autosize := false;
  LInfo.Left := 0;
  LInfo.Top := FrmHaupt.Height - (FrmHaupt.Height div 5);
  LInfo.Width := FrmHaupt.Width;
  LInfo.Font.Size := Konstantenbox.Schrift;
  LInfo.Height := LInfo.Font.Size + 10;
  LInfo.Alignment := tacenter;
  LInfo.Layout := tlcenter;
  LInfo.Caption := 'Nutzungsbedingungen & Kontaktinformationen';
  LInfo.Font.Color := Konstantenbox.Schriftfarbe;
  LInfo.Font.Name:= Konstantenbox.Schriftart;
end;

//Oeffnen des Hauptmenues beim Schließen der Projektionsflaeche
procedure TFrmHaupt.TimerProjektionsflaecheTimer(Sender: TObject);
begin
  if FrmProjektionsflaeche.Visible= false then
  begin
    FrmHaupt.Visible:= true;
    TimerProjektionsflaeche.Enabled:= false;
  end;
end;

end.
