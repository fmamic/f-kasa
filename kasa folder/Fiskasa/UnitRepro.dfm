object FRepro: TFRepro
  Left = -4
  Top = 180
  Width = 1402
  Height = 590
  Caption = 'REPRO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Repro: TLabel
    Left = 512
    Top = 16
    Width = 52
    Height = 24
    Caption = 'Repro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 320
    Width = 1329
    Height = 161
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 696
    Top = 32
    Width = 145
    Height = 49
    Caption = 'Upit1Racuni'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 1136
    Top = 104
    Width = 145
    Height = 65
    Caption = 'Upit2Racuniukupno'
    TabOrder = 2
    OnClick = Button2Click
  end
  object odDatuma: TDateTimePicker
    Left = 40
    Top = 24
    Width = 129
    Height = 25
    Date = 41275.961469537040000000
    Time = 41275.961469537040000000
    TabOrder = 3
  end
  object doDatuma: TDateTimePicker
    Left = 40
    Top = 96
    Width = 129
    Height = 21
    Date = 41289.962002129630000000
    Time = 41289.962002129630000000
    TabOrder = 4
  end
  object Button3: TButton
    Left = 896
    Top = 24
    Width = 145
    Height = 57
    Caption = 'Adocommand'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 896
    Top = 112
    Width = 153
    Height = 57
    Caption = 'od_doDatuma'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 1128
    Top = 24
    Width = 161
    Height = 57
    Caption = 'Button5'
    TabOrder = 7
    OnClick = Button5Click
  end
  object QuickRep1: TQuickRep
    Left = 312
    Top = 584
    Width = 473
    Height = 1115
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = ADoupit4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Default
    Page.Values = (
      20.000000000000000000
      2970.000000000000000000
      20.000000000000000000
      2100.000000000000000000
      20.000000000000000000
      20.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object TitleBand1: TQRBand
      Left = 8
      Top = 8
      Width = 458
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1211.791666666667000000)
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 40
        Top = 16
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          42.333333333333340000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'KEUB'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 144
        Top = 16
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          42.333333333333340000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'DATE'
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 8
      Top = 48
      Width = 458
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        129.645833333333300000
        1211.791666666667000000)
      BandType = rbDetail
      object QRLabel2: TQRLabel
        Left = 16
        Top = 16
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          42.333333333333340000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Proizvedeno'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 136
        Top = 16
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          359.833333333333400000
          42.333333333333340000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Potro'#353'eno'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 8
      Top = 97
      Width = 458
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.166666666666700000
        1211.791666666667000000)
      Master = QuickRep1
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 136
        Top = 8
        Width = 88
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          359.833333333333400000
          21.166666666666670000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ADoupit4
        DataField = 'REPRO.NAZIV'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 8
        Top = 8
        Width = 88
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ADoupit4
        DataField = 'GRUPE.NAZIV'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 8
        Top = 32
        Width = 107
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          84.666666666666680000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ADoupit4
        DataField = 'SumOfProizvodnja'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 136
        Top = 32
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          359.833333333333400000
          84.666666666666680000
          216.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = ADoupit4
        DataField = 'SumOfBrasno'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object PageFooterBand1: TQRBand
      Left = 8
      Top = 153
      Width = 458
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1211.791666666667000000)
      BandType = rbPageFooter
    end
  end
  object Button6: TButton
    Left = 696
    Top = 192
    Width = 145
    Height = 49
    Caption = 'PrintKeub'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 696
    Top = 112
    Width = 145
    Height = 49
    Caption = 'Keub'
    TabOrder = 10
    OnClick = Button7Click
  end
  object ADOupit1: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Fiskasa\Kasa.mdb' +
      ';Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'forms!oddo!oddatuma'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'forms!oddo!dodatuma'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select * From potrosnja')
    Left = 1152
    Top = 280
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Fiskasa\Kasa.mdb' +
      ';Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 1072
    Top = 240
  end
  object DataSource1: TDataSource
    DataSet = ADOupit1
    Left = 1056
    Top = 280
  end
  object ADOupit2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <>
    SQL.Strings = (
      'Select Receipt_Id,Receipt_Date,Receipt_ammount  From Receipts')
    Left = 1200
    Top = 280
  end
  object ADOCommand1: TADOCommand
    CommandText = 'select * from upit1'
    Connection = ADOConnection1
    Parameters = <>
    Left = 992
    Top = 272
  end
  object DataSource2: TDataSource
    DataSet = ADOupit2
    Left = 1176
    Top = 224
  end
  object ADOupit3: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Fiskasa\Kasa.mdb' +
      ';Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From upit1')
    Left = 1000
    Top = 192
    object ADOupit3Receipt_ID: TIntegerField
      FieldName = 'Receipt_ID'
    end
    object ADOupit3Receipt_Date: TDateTimeField
      FieldName = 'Receipt_Date'
    end
    object ADOupit3Item_Name: TWideStringField
      FieldName = 'Item_Name'
      Size = 50
    end
    object ADOupit3Item_Qty: TFloatField
      FieldName = 'Item_Qty'
    end
    object ADOupit3NORMA: TFloatField
      FieldName = 'NORMA'
    end
    object ADOupit3GRUPENAZIV: TWideStringField
      FieldName = 'GRUPE.NAZIV'
      Size = 30
    end
    object ADOupit3REPRONAZIV: TWideStringField
      FieldName = 'REPRO.NAZIV'
      Size = 25
    end
    object ADOupit3GRUPA: TWideStringField
      FieldName = 'GRUPA'
      Size = 4
    end
  end
  object Dataupit3: TDataSource
    DataSet = ADOupit3
    Left = 1040
    Top = 200
  end
  object ADoupit4: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Fiskasa\Kasa.mdb' +
      ';Persist Security Info=False'
    Parameters = <>
    SQL.Strings = (
      'Select * From potrosnja')
    Left = 960
    Top = 240
    object ADoupit4REPRONAZIV: TWideStringField
      FieldName = 'REPRO.NAZIV'
      Size = 25
    end
    object ADoupit4SumOfBrasno: TFloatField
      FieldName = 'SumOfBrasno'
    end
    object ADoupit4GRUPENAZIV: TWideStringField
      FieldName = 'GRUPE.NAZIV'
      Size = 30
    end
    object ADoupit4SumOfProizvodnja: TFloatField
      FieldName = 'SumOfProizvodnja'
    end
  end
  object Data4: TDataSource
    DataSet = ADoupit4
    Left = 960
    Top = 208
  end
  object PrintDialog1: TPrintDialog
    Left = 336
    Top = 32
  end
end
