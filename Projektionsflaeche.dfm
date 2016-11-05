object FrmProjektionsflaeche: TFrmProjektionsflaeche
  Left = 0
  Top = 0
  Caption = 'Interferenzo - Projektionsfl'#228'che'
  ClientHeight = 529
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Schirm: TImage
    Left = 16
    Top = 194
    Width = 410
    Height = 327
  end
  object LblWellenlaenge: TLabel
    Left = 216
    Top = 27
    Width = 93
    Height = 16
    Caption = 'LblWellenlaenge'
  end
  object LblFrequenz: TLabel
    Left = 216
    Top = 56
    Width = 69
    Height = 16
    Caption = 'LblFrequenz'
  end
  object LblAbstand: TLabel
    Left = 16
    Top = 155
    Width = 62
    Height = 16
    Caption = 'LblAbstand'
  end
  object LblSpaltanzahl: TLabel
    Left = 16
    Top = 120
    Width = 82
    Height = 16
    Caption = 'LblSpaltanzahl'
  end
  object LblSpaltabstand: TLabel
    Left = 16
    Top = 90
    Width = 90
    Height = 16
    Caption = 'LblSpaltabstand'
  end
  object PnlOptionen: TPanel
    Left = 8
    Top = 16
    Width = 185
    Height = 41
    Caption = 'PnlOptionen'
    TabOrder = 0
  end
  object EdtWellenlaenge: TEdit
    Left = 328
    Top = 24
    Width = 121
    Height = 24
    TabOrder = 1
    Text = 'EdtWellenlaenge'
  end
  object EdtFrequenz: TEdit
    Left = 328
    Top = 56
    Width = 121
    Height = 24
    TabOrder = 2
    Text = 'EdtFrequenz'
  end
  object EdtAbstand: TEdit
    Left = 88
    Top = 152
    Width = 121
    Height = 24
    TabOrder = 3
    Text = 'EdtAbstand'
  end
  object EdtSpaltanzahl: TEdit
    Left = 88
    Top = 117
    Width = 121
    Height = 24
    TabOrder = 4
    Text = 'EdtSpaltanzahl'
  end
  object EdtSpaltabstand: TEdit
    Left = 88
    Top = 87
    Width = 121
    Height = 24
    TabOrder = 5
    Text = 'EdtSpaltabstand'
  end
  object BtnOptionen: TButton
    Left = 455
    Top = 24
    Width = 75
    Height = 25
    Caption = 'BtnOptionen'
    TabOrder = 6
    OnClick = BtnOptionenClick
  end
  object PnlFarbe: TPanel
    Left = 464
    Top = 87
    Width = 481
    Height = 325
    Caption = 'PnlFarbe'
    TabOrder = 7
    object PnlFarbeCaption: TPanel
      Left = 144
      Top = 9
      Width = 185
      Height = 41
      Caption = 'PnlFarbeCaption'
      TabOrder = 0
    end
    object PnlViolett: TPanel
      Left = 23
      Top = 80
      Width = 185
      Height = 41
      Caption = 'PnlViolett'
      ParentBackground = False
      TabOrder = 1
    end
    object PnlBlau: TPanel
      Left = 264
      Top = 80
      Width = 185
      Height = 41
      Caption = 'PnlBlau'
      ParentBackground = False
      TabOrder = 2
    end
    object PnlGruen: TPanel
      Left = 23
      Top = 168
      Width = 185
      Height = 41
      Caption = 'PnlGruen'
      TabOrder = 3
    end
    object PnlGelb: TPanel
      Left = 264
      Top = 168
      Width = 185
      Height = 41
      Caption = 'PnlGelb'
      TabOrder = 4
    end
    object PnlOrange: TPanel
      Left = 23
      Top = 256
      Width = 185
      Height = 41
      Caption = 'PnlOrange'
      TabOrder = 5
    end
    object PnlRot: TPanel
      Left = 264
      Top = 256
      Width = 185
      Height = 41
      Caption = 'PnlRot'
      TabOrder = 6
    end
  end
end
