object Form16: TForm16
  Left = 285
  Top = 227
  BorderStyle = bsSingle
  Caption = 'Izvje'#353'taj - pregled'
  ClientHeight = 429
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 273
    Height = 385
    BorderStyle = bsNone
    Color = clInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imOpen
    OEMConvert = True
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button1: TButton
    Left = 64
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Ispis'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 1
    OnClick = Button2Click
  end
end
