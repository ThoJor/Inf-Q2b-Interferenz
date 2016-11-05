unit Projektionsflaeche;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, graphische_Optionen,
  Vcl.ComCtrls;

type
  TFrmProjektionsflaeche = class(TForm)
    Schirm: TImage;
    PnlOptionen: TPanel;
    EdtWellenlaenge: TEdit;
    LblWellenlaenge: TLabel;
    LblFrequenz: TLabel;
    EdtFrequenz: TEdit;
    EdtAbstand: TEdit;
    LblAbstand: TLabel;
    LblSpaltanzahl: TLabel;
    EdtSpaltanzahl: TEdit;
    LblSpaltabstand: TLabel;
    EdtSpaltabstand: TEdit;
    BtnOptionen: TButton;
    PnlFarbe: TPanel;
    PnlFarbeCaption: TPanel;
    PnlViolett: TPanel;
    PnlBlau: TPanel;
    PnlGruen: TPanel;
    PnlGelb: TPanel;
    PnlOrange: TPanel;
    PnlRot: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BtnOptionenClick(Sender: TObject);
    procedure Fenstereinstellungen;
    procedure Canvaseinstellungen;
    procedure Optionen;
    procedure Optionspanel;
    procedure Option_Wellenlaenge;
    procedure Option_Frequenz;
    procedure Option_Abstand_Blende_Schirm;
    procedure Option_Spaltanzahl;
    procedure Option_Spaltabstand;
    procedure graphische_Optionen;
    procedure Option_Farbe;
    procedure Farbe_Panel;
    procedure Farbe_Violett;
    procedure Farbe_Blau;
    procedure Farbe_Gruen;
    procedure Farbe_Gelb;
    procedure Farbe_Orange;
    procedure Farbe_Rot;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmProjektionsflaeche: TFrmProjektionsflaeche;

const
  LabelHoehe= 20;
  LabelLeft= 10;
  EditHoehe= 20;
  EditLeft= 0;
  PanelHoehe= 50;

implementation

{$R *.dfm}

procedure TFrmProjektionsflaeche.Farbe_Rot;
begin
  PnlRot.Top:= PnlGelb.Top + PnlGelb.Height;
  PnlRot.Left:= PnlOrange.Width;
  PnlRot.Width:= Round(PnlFarbe.Width / 2);
  PnlRot.Height:= Round(PnlFarbe.Height * (1/4));
  PnlRot.Caption:= '';
  PnlRot.ParentBackground:= false;
  PnlRot.Color:= clRed;
end;

procedure TFrmProjektionsflaeche.Farbe_Orange;
begin
  PnlOrange.Top:= PnlGruen.Top + PnlGruen.Height;
  PnlOrange.Left:= 0;
  PnlOrange.Width:= Round(PnlFarbe.Width / 2);
  PnlOrange.Height:= Round(PnlFarbe.Height * (1/4));
  PnlOrange.Caption:= '';
  PnlOrange.ParentBackground:= false;
  PnlOrange.Color:= clFuchsia;                                                  //nur Platzhalter
end;

procedure TFrmProjektionsflaeche.Farbe_Gelb;
begin
  PnlGelb.Top:= PnlBlau.Top + PnlBlau.Height;
  PnlGelb.Left:= PnlGruen.Width;
  PnlGelb.Width:= Round(PnlFarbe.Width / 2);
  PnlGelb.Height:= Round(PnlFarbe.Height * (1/4));
  PnlGelb.Caption:= '';
  PnlGelb.ParentBackground:= false;
  PnlGelb.Color:= clYellow;
end;

procedure TFrmProjektionsflaeche.Farbe_Gruen;
begin
  PnlGruen.Top:= PnlViolett.Top + PnlViolett.Height;
  PnlGruen.Left:= 0;
  PnlGruen.Width:= Round(PnlFarbe.Width / 2);
  PnlGruen.Height:= Round(PnlFarbe.Height * (1/4));
  PnlGruen.Caption:= '';
  PnlGruen.ParentBackground:= false;
  PnlGruen.Color:= clGreen;
end;

procedure TFrmProjektionsflaeche.Farbe_Blau;
begin
  PnlBlau.Top:= PnlFarbeCaption.Top + PnlFarbeCaption.Height;
  PnlBlau.Left:= PnlViolett.Width;
  PnlBlau.Width:= Round(PnlFarbe.Width / 2);
  PnlBlau.Height:= Round(PnlFarbe.Height * (1/4));
  PnlBlau.Caption:= '';
  PnlBlau.ParentBackground:= false;
  PnlBlau.Color:= clBlue;
end;

procedure TFrmProjektionsflaeche.Farbe_Violett;
begin
  PnlViolett.Top:= PnlFarbeCaption.Top + PnlFarbeCaption.Height;
  PnlViolett.Left:= 0;
  PnlViolett.Width:= Round(PnlFarbe.Width / 2);
  PnlViolett.Height:= Round(PnlFarbe.Height * (1/4));
  PnlViolett.Caption:= '';
  PnlViolett.ParentBackground:= false;
  PnlViolett.Color:= clPurple;
end;

procedure TFrmProjektionsflaeche.Farbe_Panel;
begin
  PnlFarbe.Top:= (EdtFrequenz.Top + EdtFrequenz.Height) + 10;
  PnlFarbe.Height:= (BtnOptionen.Top - (EdtFrequenz.Top + EdtFrequenz.Height)) - 20;
  PnlFarbe.Left:= 0;
  PnlFarbe.Width:= Schirm.Left - PnlFarbe.Left;
  PnlFarbe.Caption:= '';

  PnlFarbeCaption.Top:= 0;
  PnlFarbeCaption.Left:= 0;
  PnlFarbeCaption.Width:= PnlFarbe.Width;
  PnlFarbeCaption.Height:= Round(PnlFarbe.Height * (1/4));
  PnlFarbeCaption.Caption:= 'Farbe';
end;

procedure TFrmProjektionsflaeche.Option_Farbe;
begin
  Farbe_Panel;
  Farbe_Violett;
  Farbe_Blau;
  Farbe_Gruen;
  Farbe_Gelb;
  Farbe_Orange;
  Farbe_Rot;
end;

procedure TFrmProjektionsflaeche.graphische_Optionen;
begin
  //Button graphische Optionen
  BtnOptionen.Height:= 30;
  BtnOptionen.Top:= LblSpaltabstand.Top - BtnOptionen.Height - 15;
  BtnOptionen.Left:= 20;
  BtnOptionen.Width:= Schirm.Left - (BtnOptionen.Left * 2);
  BtnOptionen.Caption:= 'graphische Optionen';
end;

procedure TFrmProjektionsflaeche.Option_Spaltabstand;
begin
  //Option Spaltabstand
  EdtSpaltabstand.Height:= EditHoehe;
  EdtSpaltabstand.Top:= LblSpaltanzahl.Top - EdtSpaltabstand.Height - 5;
  EdtSpaltabstand.Left:= EditLeft;
  EdtSpaltabstand.Width:= Schirm.Left - EdtSpaltabstand.Left;
  EdtSpaltabstand.Text:= '';

  LblSpaltabstand.Height:= LabelHoehe;
  LblSpaltabstand.Top:= EdtSpaltabstand.Top - LblSpaltabstand.Height;
  LblSpaltabstand.Left:= LabelLeft;
  LblSpaltabstand.Width:= Schirm.Left - LblSpaltabstand.Left;
  LblSpaltabstand.Caption:= 'Spaltabstand b in ?';
end;

procedure TFrmProjektionsflaeche.Option_Spaltanzahl;
begin
  //Option Spaltanzahl
  EdtSpaltanzahl.Height:= EditHoehe;
  EdtSpaltanzahl.Top:= LblAbstand.Top - EdtSpaltanzahl.Height - 5;
  EdtSpaltanzahl.Left:= EditLeft;
  EdtSpaltanzahl.Width:= Schirm.Left - EdtSpaltanzahl.Left;
  EdtSpaltanzahl.Text:= '';

  LblSpaltanzahl.Height:= LabelHoehe;
  LblSpaltanzahl.Top:= EdtSpaltanzahl.Top - LblSpaltanzahl.Height;
  LblSpaltanzahl.Left:= LabelLeft;
  LblSpaltanzahl.Width:= Schirm.Left - LblSpaltanzahl.Left;
  LblSpaltanzahl.Caption:= 'Spaltanzahl n';
end;

procedure TFrmProjektionsflaeche.Option_Abstand_Blende_Schirm;
begin
  //Option Abstand Blende-Schirm
  EdtAbstand.Height:= EditHoehe;
  EdtAbstand.Top:= FrmProjektionsflaeche.ClientHeight - (15 + EdtAbstand.Height);
  EdtAbstand.Left:= EditLeft;
  EdtAbstand.Width:= Schirm.Left - EdtAbstand.Left;
  EdtAbstand.Text:= '';

  LblAbstand.Height:= LabelHoehe;
  LblAbstand.Top:= EdtAbstand.Top - LblAbstand.Height;
  LblAbstand.Left:= LabelLeft;
  LblAbstand.Width:= Schirm.Left - LblAbstand.Left;
  LblAbstand.Caption:= 'Abstand a in m';
end;

procedure TFrmProjektionsflaeche.Option_Frequenz;
begin
  //Option Frequenz
  LblFrequenz.Top:= 5 + EdtWellenlaenge.Top + EdtWellenlaenge.Height;
  LblFrequenz.Left:= LabelLeft;
  LblFrequenz.Width:= Schirm.Left - LblFrequenz.Left;
  LblFrequenz.Height:= LabelHoehe;
  LblFrequenz.Caption:= 'Frequenz f in Hz';

  EdtFrequenz.Top:= LblFrequenz.Top + LblFrequenz.Height;
  EdtFrequenz.Left:= EditLeft;
  EdtFrequenz.Width:= Schirm.Left - EdtFrequenz.Left;
  EdtFrequenz.Height:= EditHoehe;
  EdtFrequenz.Text:= '';
end;

procedure TFrmProjektionsflaeche.Option_Wellenlaenge;
begin
  //Option Wellenlänge
  LblWellenlaenge.Top:= 5 + PnlOptionen.Top + PnlOptionen.Height;
  LblWellenlaenge.Left:= LabelLeft;
  LblWellenlaenge.Width:= Schirm.Left - LblWellenlaenge.Left;
  LblWellenlaenge.Height:= LabelHoehe;
  LblWellenlaenge.Caption:= 'Wellenlänge λ in nm';

  EdtWellenlaenge.Top:= LblWellenlaenge.Top + LblWellenlaenge.Height;
  EdtWellenlaenge.Left:= EditLeft;
  EdtWellenlaenge.Width:= Schirm.Left - EdtWellenlaenge.Left;
  EdtWellenlaenge.Height:= EditHoehe;
  EdtWellenlaenge.Text:= '';
end;

procedure TFrmProjektionsflaeche.Optionspanel;
begin
  //Panel Optionen
  PnlOptionen.Caption:= 'Optionen';
  PnlOptionen.Left:= 0;
  PnlOptionen.Top:= 0;
  PnlOptionen.Width:= Schirm.Left;
  PnlOptionen.Height:= PanelHoehe;
end;

procedure TFrmProjektionsflaeche.Optionen;
begin
  Optionspanel;
  Option_Wellenlaenge;
  Option_Frequenz;
  Option_Abstand_Blende_Schirm;
  Option_Spaltanzahl;
  Option_Spaltabstand;
  graphische_Optionen;
  Option_Farbe;
end;

procedure TFrmProjektionsflaeche.Canvaseinstellungen;
begin
  //Image zu Canvas
  Schirm.Canvas;

  //Canvasgröße veränderbar machen
  Schirm.Stretch:= true;

  //Canvasgröße
  Schirm.Width:= Round((4/5) * FrmProjektionsflaeche.Width);
  Schirm.Height:= Round((4/5) * FrmProjektionsflaeche.Height);

  //Canvasposition
  Schirm.Left:= FrmProjektionsflaeche.Width - Schirm.Width;
  Schirm.Top:= 0;
end;

procedure TFrmProjektionsflaeche.Fenstereinstellungen;
begin
  //Namensgebung
  FrmProjektionsflaeche.Caption:= 'Interferenzo - Projektionsfläche';

  //Fenstergröße
  FrmProjektionsflaeche.Width:= Round(Screen.Width * (2/3));
  FrmProjektionsflaeche.Height:= Round(FrmProjektionsflaeche.Width * (9/16));

  //Fensterposition
  Position:= poScreenCenter;
end;

procedure TFrmProjektionsflaeche.BtnOptionenClick(Sender: TObject);
begin
  FrmGraphischeOptionen.Show;
end;

procedure TFrmProjektionsflaeche.FormCreate(Sender: TObject);
begin
  Fenstereinstellungen;
  Canvaseinstellungen;
  Optionen;
end;

end.
