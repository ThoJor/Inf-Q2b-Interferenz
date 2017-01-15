object FrmGraphischeOptionen: TFrmGraphischeOptionen
  Left = 0
  Top = 0
  Caption = 'FrmGraphischeOptionen'
  ClientHeight = 218
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Image1: TImage
    Left = 362
    Top = 8
    Width = 105
    Height = 105
  end
  object CBLineal: TCheckBox
    Left = 7
    Top = 7
    Width = 73
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'CBLineal'
    TabOrder = 0
  end
  object ChBBgBlack: TCheckBox
    Left = 8
    Top = 25
    Width = 97
    Height = 17
    Caption = 'ChBBgBlack'
    TabOrder = 1
    OnClick = ChBBgBlackClick
  end
  object ChBBgWhite: TCheckBox
    Left = 8
    Top = 48
    Width = 97
    Height = 17
    Caption = 'ChBBgWhite'
    TabOrder = 2
    OnClick = ChBBgWhiteClick
  end
  object ChBBgVerlauf: TCheckBox
    Left = 8
    Top = 72
    Width = 97
    Height = 17
    Caption = 'ChBBgVerlauf'
    TabOrder = 3
    OnClick = ChBBgVerlaufClick
  end
end
