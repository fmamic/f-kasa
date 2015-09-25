object Form9: TForm9
  Left = 553
  Top = 233
  BorderStyle = bsSingle
  Caption = 'Stvori na'#269'in pla'#263'anja'
  ClientHeight = 238
  ClientWidth = 257
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
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 97
    Height = 13
    Caption = 'Unesi naziv pla'#263'anja'
  end
  object Label2: TLabel
    Left = 176
    Top = 24
    Width = 55
    Height = 13
    Caption = 'Popust (%)'
  end
  object Button1: TButton
    Left = 40
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Uredu'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 48
    Width = 113
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 176
    Top = 48
    Width = 49
    Height = 21
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 88
    Width = 225
    Height = 97
    Caption = 'Vrste pla'#263'anja'
    TabOrder = 4
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 112
    Width = 113
    Height = 17
    Caption = 'Gotovina'
    TabOrder = 5
  end
  object RadioButton2: TRadioButton
    Left = 24
    Top = 136
    Width = 113
    Height = 17
    Caption = #268'ek'
    TabOrder = 6
  end
  object RadioButton3: TRadioButton
    Left = 24
    Top = 160
    Width = 113
    Height = 17
    Caption = 'Kartice'
    TabOrder = 7
  end
  object RadioButton4: TRadioButton
    Left = 120
    Top = 136
    Width = 113
    Height = 17
    Caption = 'Ostalo'
    TabOrder = 8
  end
  object RadioButton5: TRadioButton
    Left = 120
    Top = 112
    Width = 113
    Height = 17
    Caption = 'Transakcijski ra'#269'un'
    TabOrder = 9
  end
end
