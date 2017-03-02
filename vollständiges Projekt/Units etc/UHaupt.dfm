object FrmHaupt: TFrmHaupt
  Left = 0
  Top = 0
  Caption = 'FrmHaupt'
  ClientHeight = 391
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object LProgrammname: TLabel
    Left = 10
    Top = 10
    Width = 106
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'LProgrammname'
  end
  object LInfo: TLabel
    Left = 10
    Top = 116
    Width = 31
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'LInfo'
    OnClick = LInfoClick
  end
  object ImgLogo: TImage
    Left = 280
    Top = 128
    Width = 105
    Height = 105
  end
  object BtnStart: TButton
    Left = 10
    Top = 35
    Width = 99
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'BtnStart'
    TabOrder = 0
    OnClick = BtnStartClick
  end
  object BtnVersuchsaufbau: TButton
    Left = 10
    Top = 76
    Width = 99
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'BtnVersuchsaufbau'
    TabOrder = 1
    OnClick = BtnVersuchsaufbauClick
  end
  object BtnBeenden: TButton
    Left = 576
    Top = 192
    Width = 75
    Height = 25
    Caption = 'BtnBeenden'
    TabOrder = 2
    OnClick = BtnBeendenClick
  end
  object TimerProjektionsflaeche: TTimer
    Left = 8
    Top = 112
  end
end
