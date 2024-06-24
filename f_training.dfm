object frm_Training: Tfrm_Training
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'frm_Training'
  ClientHeight = 554
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 550
    Height = 400
    ActivePage = ts_Ex1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 548
    ExplicitHeight = 396
    object ts_Ex1: TTabSheet
      AlignWithMargins = True
      Caption = 'EX_1'
      DesignSize = (
        536
        364)
      object sh_circle: TShape
        Left = 3
        Top = 175
        Width = 15
        Height = 20
        Shape = stCircle
      end
      object line: TShape
        AlignWithMargins = True
        Left = 15
        Top = 183
        Width = 505
        Height = 2
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Color = clBackground
        ExplicitWidth = 509
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 486
    Width = 735
    Height = 68
    Align = alBottom
    Caption = 'pnlButtons'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 482
    ExplicitWidth = 733
    object btnStart: TButton
      Left = 7
      Top = 6
      Width = 210
      Height = 59
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 317
      Top = 6
      Width = 226
      Height = 59
      Caption = 'Stop '
      TabOrder = 1
      OnClick = btnStopClick
    end
  end
  object pnlSettings: TPanel
    Left = 550
    Top = 0
    Width = 185
    Height = 400
    Align = alRight
    Caption = 'pnlSettings'
    ShowCaption = False
    TabOrder = 2
    object lblSpeed: TLabel
      Left = 102
      Top = 24
      Width = 38
      Height = 15
      Caption = 'Speed: '
    end
    object trackSpeed: TTrackBar
      Left = 110
      Top = 45
      Width = 45
      Height = 150
      Max = 5
      Min = 1
      Orientation = trVertical
      PageSize = 1
      Position = 3
      TabOrder = 0
      ThumbLength = 10
      TickMarks = tmTopLeft
      OnTracking = trackSpeedTracking
    end
  end
  object pnlTimer: TPanel
    Left = 0
    Top = 400
    Width = 735
    Height = 86
    Align = alBottom
    Caption = 'pnlTimer'
    ShowCaption = False
    TabOrder = 3
    ExplicitTop = 396
    ExplicitWidth = 733
    object lblTimer: TLabel
      Left = 288
      Top = -1
      Width = 72
      Height = 89
      Caption = '10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 616
    Top = 424
  end
end
