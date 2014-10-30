object Form1: TForm1
  Left = 192
  Top = 124
  Width = 682
  Height = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 552
    Top = 192
    Width = 33
    Height = 33
    Shape = stCircle
  end
  object Label1: TLabel
    Left = 104
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 104
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 584
    Top = 256
    Width = 49
    Height = 25
    Caption = 'Play'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientRead = ServerSocket1ClientRead
    Left = 616
    Top = 16
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 624
    Top = 64
  end
end
