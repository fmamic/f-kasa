object Form8: TForm8
  Left = 604
  Top = 355
  BorderStyle = bsSingle
  Caption = 'Povrat ambala'#382'e'
  ClientHeight = 309
  ClientWidth = 258
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 225
    Height = 161
    Caption = 'Ambala'#382'a'
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 40
      Width = 27
      Height = 19
      Caption = 'PET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 80
      Width = 43
      Height = 19
      Caption = 'Staklo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 48
      Top = 120
      Width = 37
      Height = 19
      Caption = 'Al-Fe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 112
      Top = 40
      Width = 65
      Height = 21
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 112
      Top = 80
      Width = 65
      Height = 21
      TabOrder = 1
      OnKeyDown = Edit2KeyDown
    end
    object Edit3: TEdit
      Left = 112
      Top = 120
      Width = 65
      Height = 21
      TabOrder = 2
      OnKeyDown = Edit3KeyDown
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 184
    Width = 225
    Height = 73
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 32
      Width = 55
      Height = 19
      Caption = 'Ukupno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 104
      Top = 32
      Width = 10
      Height = 23
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button3: TButton
      Left = 144
      Top = 32
      Width = 49
      Height = 25
      Caption = 'Zbroji'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object Button1: TButton
    Left = 48
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Uredu'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 3
    OnClick = Button2Click
  end
end
