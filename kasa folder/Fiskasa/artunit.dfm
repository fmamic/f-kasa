object FormaArtikli: TFormaArtikli
  Left = 681
  Top = 119
  Width = 330
  Height = 563
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
    Left = 0
    Top = 8
    Width = 321
    Height = 513
    DataSource = DataArt
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 64
    Top = 16
    Width = 25
    Height = 1
    Caption = 'Button1'
    TabOrder = 1
  end
  object ADOArt: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\test2015\bazakas' +
      'e.mdb;Persist Security Info=False'
    CursorType = ctStatic
    TableName = 'artikli'
    Left = 248
    Top = 56
    object ADOArtArtikliID: TFloatField
      FieldName = 'ArtikliID'
      Visible = False
    end
    object ADOArtSifra: TFloatField
      FieldName = 'Sifra'
      Visible = False
    end
    object ADOArtArtikli: TWideStringField
      DisplayWidth = 26
      FieldName = 'Artikli'
      Size = 25
    end
    object ADOArtJedinicamijere: TFloatField
      FieldName = 'Jedinicamijere'
      Visible = False
    end
    object ADOArtCijena: TFloatField
      DisplayWidth = 13
      FieldName = 'Cijena'
    end
    object ADOArtUkupno: TFloatField
      FieldName = 'Ukupno'
      Visible = False
    end
    object ADOArtOIB: TFloatField
      FieldName = 'OIB'
      Visible = False
    end
    object ADOArtDatum: TDateTimeField
      FieldName = 'Datum'
      Visible = False
    end
    object ADOArtKolicina: TFloatField
      FieldName = 'Kolicina'
      Visible = False
    end
    object ADOArtPDV: TFloatField
      FieldName = 'PDV'
      Visible = False
    end
    object ADOArtPNP: TFloatField
      FieldName = 'PNP'
      Visible = False
    end
    object ADOArtZKI: TWideStringField
      DisplayWidth = 60
      FieldName = 'ZKI'
      Size = 50
    end
    object ADOArtJIR: TWideStringField
      DisplayWidth = 60
      FieldName = 'JIR'
      Size = 50
    end
  end
  object DataArt: TDataSource
    DataSet = ADOArt
    Left = 72
    Top = 64
  end
end
