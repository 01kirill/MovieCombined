object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 497
  ClientWidth = 1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnPaint = FormPaint
  TextHeight = 15
  object Label1: TLabel
    Left = 71
    Top = 447
    Width = 52
    Height = 15
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100
  end
  object Button1: TButton
    Left = 0
    Top = 447
    Width = 65
    Height = 50
    Caption = 'Play'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ScrollBar1: TScrollBar
    Left = 71
    Top = 472
    Width = 199
    Height = 17
    Max = 80
    Min = 5
    PageSize = 0
    Position = 5
    TabOrder = 1
    OnScroll = ScrollBar1Scroll
  end
  object MediaPlayer1: TMediaPlayer
    Left = 760
    Top = 459
    Width = 253
    Height = 30
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 1040
    Top = 448
  end
end
