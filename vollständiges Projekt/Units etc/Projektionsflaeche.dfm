object FrmProjektionsflaeche: TFrmProjektionsflaeche
  Left = 0
  Top = 0
  Caption = 'Interferenzo - Projektionsfl'#228'che'
  ClientHeight = 551
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Schirm: TImage
    Left = 380
    Top = 24
    Width = 308
    Height = 245
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
  end
  object LblSchirmAbstand: TLabel
    Left = 13
    Top = 526
    Width = 81
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblSchirmAbstand'
  end
  object LblSpaltanzahl: TLabel
    Left = 23
    Top = 505
    Width = 63
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblSpaltanzahl'
  end
  object LblSpaltabstand: TLabel
    Left = 19
    Top = 478
    Width = 70
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblSpaltabstand'
  end
  object ImgLineal: TImage
    Left = 380
    Top = 274
    Width = 122
    Height = 75
  end
  object LblHilfeSchirm: TLabel
    Left = 608
    Top = 376
    Width = 63
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblHilfeSchirm'
    Transparent = True
  end
  object LblHilfeEinstellungen: TLabel
    Left = 605
    Top = 392
    Width = 91
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblHilfeEinstellungen'
  end
  object LblHilfeEinstellungen2: TLabel
    Left = 605
    Top = 408
    Width = 96
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblHilfeEinstellungen2'
  end
  object LblLinealEinheit: TLabel
    Left = 620
    Top = 440
    Width = 68
    Height = 12
    Caption = 'LblLinealEinheit'
  end
  object ImgIntensitaet: TImage
    Left = 566
    Top = 274
    Width = 122
    Height = 75
  end
  object LblSpaltbreite: TLabel
    Left = 26
    Top = 456
    Width = 60
    Height = 12
    Caption = 'LblSpaltbreite'
  end
  object LblEingabe: TLabel
    Left = 40
    Top = 64
    Width = 49
    Height = 12
    Caption = 'LblEingabe'
  end
  object LblAusgabe: TLabel
    Left = 64
    Top = 96
    Width = 52
    Height = 12
    Caption = 'LblAusgabe'
  end
  object LblZoom: TLabel
    Left = 632
    Top = 458
    Width = 39
    Height = 12
    Caption = 'LblZoom'
  end
  object PnlOptionen: TPanel
    Left = 19
    Top = 7
    Width = 139
    Height = 31
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'PnlOptionen'
    TabOrder = 12
  end
  object EdtEingabe: TEdit
    Left = 119
    Top = 73
    Width = 91
    Height = 20
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 1
    Text = '500'
    OnChange = EdtEingabeChange
    OnKeyPress = EdtEingabeKeyPress
  end
  object EdtAusgabe: TEdit
    Left = 119
    Top = 97
    Width = 91
    Height = 20
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabStop = False
    TabOrder = 14
    Text = 'EdtAusgabe'
  end
  object EdtSchirmAbstand: TEdit
    Left = 98
    Top = 524
    Width = 91
    Height = 20
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 10
    Text = 'EdtSchirmAbstand'
    OnKeyPress = EdtSchirmAbstandKeyPress
  end
  object EdtSpaltabstand: TEdit
    Left = 93
    Top = 478
    Width = 91
    Height = 20
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 8
    Text = 'EdtSpaltabstand'
    OnKeyPress = EdtSpaltabstandKeyPress
  end
  object BtnOptionen: TButton
    Left = 470
    Top = 406
    Width = 57
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'BtnOptionen'
    TabOrder = 6
    OnClick = BtnOptionenClick
  end
  object PnlFarbe: TPanel
    Left = -1
    Top = 190
    Width = 361
    Height = 244
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'PnlFarbe'
    TabOrder = 16
    object PnlFarbeCaption: TPanel
      Left = 108
      Top = 7
      Width = 139
      Height = 31
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PnlFarbeCaption'
      TabOrder = 0
    end
    object PnlViolett: TPanel
      Left = 17
      Top = 60
      Width = 139
      Height = 31
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PnlViolett'
      ParentBackground = False
      TabOrder = 1
      OnClick = PnlViolettClick
    end
    object PnlBlau: TPanel
      Left = 198
      Top = 60
      Width = 139
      Height = 31
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PnlBlau'
      ParentBackground = False
      TabOrder = 2
      OnClick = PnlBlauClick
    end
    object PnlGruen: TPanel
      Left = 17
      Top = 126
      Width = 139
      Height = 31
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PnlGruen'
      TabOrder = 3
      OnClick = PnlGruenClick
    end
    object PnlGelb: TPanel
      Left = 198
      Top = 126
      Width = 139
      Height = 31
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PnlGelb'
      TabOrder = 4
      OnClick = PnlGelbClick
    end
    object PnlOrange: TPanel
      Left = 17
      Top = 192
      Width = 139
      Height = 31
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PnlOrange'
      TabOrder = 5
      OnClick = PnlOrangeClick
    end
    object PnlRot: TPanel
      Left = 198
      Top = 192
      Width = 139
      Height = 31
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'PnlRot'
      TabOrder = 6
      OnClick = PnlRotClick
    end
  end
  object TBZoom: TTrackBar
    Left = 597
    Top = 472
    Width = 150
    Height = 45
    Min = 2
    Frequency = 2
    Position = 2
    PositionToolTip = ptTop
    TabOrder = 11
    TabStop = False
    Visible = False
    OnChange = TBZoomChange
    OnKeyDown = TBZoomKeyDown
  end
  object BtnStart: TButton
    Left = 24
    Top = 140
    Width = 75
    Height = 25
    Caption = 'BtnStart'
    TabOrder = 2
    OnClick = BtnStartClick
  end
  object BtnBeenden: TButton
    Left = 186
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Beenden'
    TabOrder = 4
    OnClick = BtnBeendenClick
  end
  object BtnHilfe: TButton
    Left = 266
    Top = 143
    Width = 57
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'BtnHilfe'
    TabOrder = 5
    OnClick = BtnHilfeClick
  end
  object BtnReset: TButton
    Left = 105
    Top = 140
    Width = 75
    Height = 25
    Caption = 'BtnReset'
    TabOrder = 3
    OnClick = BtnResetClick
  end
  object CmbEinheit: TComboBox
    Left = 116
    Top = 48
    Width = 145
    Height = 20
    TabOrder = 0
    Text = 'CmbEinheit'
    OnChange = CmbEinheitChange
  end
  object EdtAusgabeEinheit: TEdit
    Left = 215
    Top = 99
    Width = 121
    Height = 20
    TabStop = False
    TabOrder = 13
    Text = 'EdtAusgabeEinheit'
  end
  object EdtSpaltbreite: TEdit
    Left = 93
    Top = 453
    Width = 121
    Height = 20
    TabOrder = 7
    Text = 'EdtSpaltbreite'
    OnKeyPress = EdtSpaltbreiteKeyPress
  end
  object EdtEingabeEinheit: TEdit
    Left = 215
    Top = 73
    Width = 121
    Height = 20
    TabOrder = 15
    Text = 'EdtEingabeEinheit'
  end
  object EdtSpaltanzahl: TEdit
    Left = 98
    Top = 502
    Width = 91
    Height = 20
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabStop = False
    TabOrder = 9
    Text = 'EdtSpaltanzahl'
    OnChange = EdtSpaltanzahlChange
    OnKeyPress = EdtSpaltanzahlKeyPress
  end
end
