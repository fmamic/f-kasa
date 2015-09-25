object Formazakljuci: TFormazakljuci
  Left = 350
  Top = 251
  Width = 732
  Height = 399
  Caption = 'Zaklju'#269'ak ra'#269'una'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 41
    Color = clFuchsia
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 496
      Top = 8
      Width = 192
      Height = 25
      VisibleButtons = [nbPost, nbCancel]
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 217
    Height = 321
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 224
    Top = 176
    Width = 129
    Height = 33
    Caption = 'Paragon'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 360
    Top = 176
    Width = 97
    Height = 33
    Caption = 'R1 ra'#269'un'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
