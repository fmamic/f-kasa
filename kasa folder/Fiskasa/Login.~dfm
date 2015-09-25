object Logiranje: TLogiranje
  Left = 399
  Top = 277
  Width = 376
  Height = 342
  Caption = 'd'
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 40
    Width = 117
    Height = 20
    Caption = 'Naziv operatera'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 128
    Width = 133
    Height = 20
    Caption = 'Lozinka operatera'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 40
    Top = 80
    Width = 265
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 40
    Top = 160
    Width = 265
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 224
    Width = 73
    Height = 33
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 224
    Width = 89
    Height = 33
    Caption = 'Odustani'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 224
    Width = 81
    Height = 33
    Caption = 'Blagajnici'
    TabOrder = 4
  end
  object ADODataSet1: TADODataSet
    Parameters = <>
    Left = 232
    Top = 8
  end
  object ADOupitkorisnici: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Fiskasa\Kasa.mdb' +
      ';Persist Security Info=False'
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      '  SELECT * FROM USERS')
    Left = 176
    Top = 8
    object ADOupitkorisniciUser: TWideStringField
      FieldName = 'User'
      Size = 50
    end
    object ADOupitkorisniciPwd: TWideStringField
      FieldName = 'Pwd'
      Size = 50
    end
    object ADOupitkorisniciOIB: TWideStringField
      FieldName = 'OIB'
      Size = 11
    end
  end
  object Datalogin: TDataSource
    DataSet = ADOupitkorisnici
    Left = 88
    Top = 8
  end
end
