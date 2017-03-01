object FrmHaupt: TFrmHaupt
  Left = 0
  Top = 0
  Caption = 'FrmHaupt'
  ClientHeight = 816
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LProgrammname: TLabel
    Left = 8
    Top = 8
    Width = 79
    Height = 13
    Caption = 'LProgrammname'
  end
  object LInfo: TLabel
    Left = 8
    Top = 89
    Width = 25
    Height = 13
    Caption = 'LInfo'
    OnClick = LInfoClick
  end
  object ImgLogo: TImage
    Left = 7
    Top = 170
    Width = 80
    Height = 80
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
  end
  object BtnStart: TButton
    Left = 8
    Top = 27
    Width = 75
    Height = 25
    Caption = 'BtnStart'
    TabOrder = 0
    OnClick = BtnStartClick
  end
  object BtnVersuchsaufbau: TButton
    Left = 8
    Top = 58
    Width = 75
    Height = 25
    Caption = 'BtnVersuchsaufbau'
    TabOrder = 1
    OnClick = BtnVersuchsaufbauClick
  end
  object BtnBeenden: TButton
    Left = 440
    Top = 147
    Width = 58
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'BtnBeenden'
    TabOrder = 2
    OnClick = BtnBeendenClick
  end
end
