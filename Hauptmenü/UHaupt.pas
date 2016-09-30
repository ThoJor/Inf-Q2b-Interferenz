unit UHaupt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TFrmMainMenu = class(TForm)
    BtnStart: TButton;
    BtnInfo: TButton;
    BtnHelp: TButton;
    ImgBackground: TImage;
    LblTitle: TLabel;
    LblTitle2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainMenu: TFrmMainMenu;

implementation

{$R *.dfm}

end.
