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
  object LblWellenlaenge: TLabel
    Left = 31
    Top = 60
    Width = 72
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblWellenlaenge'
  end
  object LblFrequenz: TLabel
    Left = 31
    Top = 76
    Width = 55
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblFrequenz'
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
    Top = 489
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
  object LblOverlaySchirm: TLabel
    Left = 608
    Top = 376
    Width = 80
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblOverlaySchirm'
  end
  object LblOverlayEinstellungen: TLabel
    Left = 605
    Top = 392
    Width = 108
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblOverlayEinstellungen'
  end
  object LblOverlayEinstellungen2: TLabel
    Left = 605
    Top = 408
    Width = 113
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'LblOverlayEinstellungen2'
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
    TabOrder = 0
  end
  object EdtEingabe: TEdit
    Left = 126
    Top = 57
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
    Left = 126
    Top = 81
    Width = 91
    Height = 20
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabStop = False
    TabOrder = 10
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
    TabOrder = 9
    Text = 'EdtSchirmAbstand'
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
    TabOrder = 11
    Text = 'EdtSpaltanzahl'
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
  end
  object BtnOptionen: TButton
    Left = 46
    Top = 438
    Width = 57
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'BtnOptionen'
    TabOrder = 7
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
    TabOrder = 12
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
    Min = 1
    Frequency = 10
    Position = 1
    PositionToolTip = ptTop
    TabOrder = 13
    TabStop = False
    Visible = False
    OnChange = TBZoomChange
  end
  object BtnStart: TButton
    Left = 24
    Top = 140
    Width = 75
    Height = 25
    Caption = 'BtnStart'
    TabOrder = 3
    OnClick = BtnStartClick
  end
  object BtnBeenden: TButton
    Left = 186
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Beenden'
    TabOrder = 5
    OnClick = BtnBeendenClick
  end
  object BtnOverlay: TButton
    Left = 266
    Top = 143
    Width = 57
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'BtnOverlay'
    TabOrder = 6
    OnClick = BtnOverlayClick
  end
  object BtnReset: TButton
    Left = 105
    Top = 140
    Width = 75
    Height = 25
    Caption = 'BtnReset'
    TabOrder = 4
    OnClick = BtnResetClick
  end
  object CmbEinheit: TComboBox
    Left = 222
    Top = 57
    Width = 145
    Height = 20
    TabOrder = 2
    Text = 'CmbEinheit'
    OnChange = CmbEinheitChange
  end
  object EdtAusgabeEinheit: TEdit
    Left = 222
    Top = 83
    Width = 121
    Height = 20
    TabStop = False
    TabOrder = 14
    Text = 'EdtAusgabeEinheit'
  end
end
