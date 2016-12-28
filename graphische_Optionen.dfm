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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object CBLineal: TCheckBox
    Left = 23
    Top = 23
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
    Left = 23
    Top = 41
    Width = 97
    Height = 17
    Caption = 'ChBBgBlack'
    TabOrder = 1
  end
  object ChBBgWhite: TCheckBox
    Left = 23
    Top = 64
    Width = 97
    Height = 17
    Caption = 'ChBBgWhite'
    TabOrder = 2
  end
  object ChBBgVerlauf: TCheckBox
    Left = 23
    Top = 87
    Width = 97
    Height = 17
    Caption = 'ChBBgVerlauf'
    TabOrder = 3
  end
end
