object Artikli: TArtikli
  Left = 414
  Top = 89
  Width = 451
  Height = 736
  Align = alCustom
  Caption = 'Artikli'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 0
    Width = 465
    Height = 689
    DataSource = DataArtikli
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 168
    Top = 0
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 72
    Top = 8
    Width = 25
    Height = 9
    Caption = 'Button1'
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object DataArtikli: TDataSource
    DataSet = ADOartikli
    Left = 296
    Top = 256
  end
  object ADOartikli: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Fiskasa\Kasa.mdb' +
      ';Persist Security Info=False'
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    TableDirect = True
    TableName = 'Items'
    Left = 296
    Top = 208
    object ADOartikliItem_ID: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Sifra'
      DisplayWidth = 10
      FieldName = 'Item_id'
      KeyFields = 'Item_ID'
      Required = True
      Size = 13
    end
    object ADOartikliItem_Name: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Artikli'
      DisplayWidth = 20
      FieldName = 'Item_Name'
      KeyFields = 'Item_Name'
      Size = 50
    end
    object ADOartikliItem_Price: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'P_Cijena'
      DisplayWidth = 13
      FieldName = 'Item_Price'
      KeyFields = 'Item_Price'
      Required = True
      currency = True
    end
  end
end
