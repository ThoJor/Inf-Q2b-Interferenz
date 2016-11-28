object FrmHaupt: TFrmHaupt
  Left = 0
  Top = 0
  Caption = 'FrmHaupt'
  ClientHeight = 492
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LProgrammname: TLabel
    Left = 0
    Top = 0
    Width = 79
    Height = 13
    Caption = 'LProgrammname'
  end
  object LInfo: TLabel
    Left = 0
    Top = 81
    Width = 25
    Height = 13
    Caption = 'LInfo'
    OnClick = LInfoClick
  end
  object BtnStart: TButton
    Left = 8
    Top = 19
    Width = 75
    Height = 25
    Caption = 'BtnStart'
    TabOrder = 0
    OnClick = BtnStartClick
  end
  object BtnVersuchsaufbau: TButton
    Left = 8
    Top = 50
    Width = 75
    Height = 25
    Caption = 'BtnVersuchsaufbau'
    TabOrder = 1
    OnClick = BtnVersuchsaufbauClick
  end
end
