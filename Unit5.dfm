object Form5: TForm5
  Left = 629
  Top = 152
  BorderStyle = bsSingle
  Caption = 'Parametri'
  ClientHeight = 667
  ClientWidth = 591
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
  object CheckBox1: TCheckBox
    Left = 48
    Top = 464
    Width = 241
    Height = 17
    Caption = 'Koristi '#39'+'#39' za uve'#263'avanje koli'#269'ine'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 0
  end
  object CheckBox2: TCheckBox
    Left = 48
    Top = 488
    Width = 241
    Height = 17
    Caption = 'Koristi '#39'-'#39' za smanjivanje koli'#269'ine'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 1
  end
  object Button1: TButton
    Left = 200
    Top = 632
    Width = 75
    Height = 25
    Caption = 'Uredu'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 280
    Top = 632
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 3
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 576
    Width = 305
    Height = 49
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 183
      Height = 16
      Caption = 'Iznos stavke povratne ambala'#382'e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 216
      Top = 16
      Width = 65
      Height = 21
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
  end
  object GroupBox2: TGroupBox
    Left = 344
    Top = 8
    Width = 233
    Height = 161
    Caption = 'Na'#269'ini pla'#263'anja'
    TabOrder = 5
    object Button3: TButton
      Left = 48
      Top = 136
      Width = 65
      Height = 17
      Caption = 'Novi'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 120
      Top = 136
      Width = 65
      Height = 17
      Caption = 'Bri'#353'i'
      TabOrder = 1
      OnClick = Button4Click
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 217
      Height = 113
      Color = clInfoBk
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
    end
  end
  object GroupBox3: TGroupBox
    Left = 24
    Top = 392
    Width = 297
    Height = 65
    Caption = 'Printer'
    TabOrder = 6
    object ComboBox1: TComboBox
      Left = 40
      Top = 24
      Width = 193
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Ne postoji'
    end
  end
  object GroupBox4: TGroupBox
    Left = 344
    Top = 352
    Width = 233
    Height = 49
    Caption = 'Naziv kase'
    TabOrder = 7
    object ComboBox2: TComboBox
      Left = 8
      Top = 16
      Width = 209
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupBox5: TGroupBox
    Left = 24
    Top = 8
    Width = 297
    Height = 217
    Caption = 'Ispis'
    TabOrder = 8
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Naslov'
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 18
      Height = 13
      Caption = 'OIB'
    end
    object Label4: TLabel
      Left = 8
      Top = 136
      Width = 75
      Height = 13
      Caption = 'Zavr'#353'na poruka'
    end
    object Edit2: TEdit
      Left = 48
      Top = 24
      Width = 225
      Height = 21
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 8
      Top = 48
      Width = 265
      Height = 21
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 8
      Top = 72
      Width = 265
      Height = 21
      TabOrder = 2
    end
    object Edit5: TEdit
      Left = 8
      Top = 112
      Width = 265
      Height = 21
      TabOrder = 3
    end
    object Edit6: TEdit
      Left = 8
      Top = 152
      Width = 265
      Height = 21
      TabOrder = 4
    end
    object Edit7: TEdit
      Left = 8
      Top = 176
      Width = 265
      Height = 21
      TabOrder = 5
    end
  end
  object GroupBox6: TGroupBox
    Left = 344
    Top = 408
    Width = 233
    Height = 65
    Caption = 'Emulacija'
    TabOrder = 9
    object RadioButton1: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = 'Epson TM2XX/3XX'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 136
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Star SP 2XX'
      TabOrder = 1
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 344
    Top = 480
    Width = 225
    Height = 65
    Caption = 'Vrste ra'#269'una'
    TabOrder = 10
  end
  object RadioButton3: TRadioButton
    Left = 352
    Top = 504
    Width = 89
    Height = 17
    Caption = 'R1 ra'#269'un'
    TabOrder = 11
  end
  object RadioButton4: TRadioButton
    Left = 448
    Top = 504
    Width = 89
    Height = 17
    Caption = 'R ra'#269'un'
    TabOrder = 12
  end
  object RadioButton5: TRadioButton
    Left = 448
    Top = 520
    Width = 97
    Height = 17
    Caption = 'nije R ra'#269'un'
    TabOrder = 13
  end
  object GroupBox7: TGroupBox
    Left = 24
    Top = 232
    Width = 297
    Height = 89
    Caption = 'Parametri fiskalizacije'
    TabOrder = 14
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 127
      Height = 13
      Caption = 'Oznaka naplatnog ure'#273'aja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 24
      Width = 132
      Height = 13
      Caption = 'Oznaka poslovnog prostora'
    end
    object Edit8: TEdit
      Left = 160
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit9: TEdit
      Left = 160
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 512
    Width = 305
    Height = 57
    Caption = 'Kodna stranica'
    TabOrder = 15
    object ComboBox3: TComboBox
      Left = 48
      Top = 24
      Width = 193
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupBox9: TGroupBox
    Left = 344
    Top = 176
    Width = 233
    Height = 169
    Caption = 'Gotovina u blagajni'
    TabOrder = 16
    object DBGrid2: TDBGrid
      Left = 8
      Top = 24
      Width = 217
      Height = 105
      Color = clInfoBk
      DataSource = DataSource3
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
    end
    object Button5: TButton
      Left = 8
      Top = 144
      Width = 67
      Height = 17
      Caption = 'Novi'
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 80
      Top = 144
      Width = 65
      Height = 17
      Caption = 'Bri'#353'i'
      TabOrder = 2
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 152
      Top = 144
      Width = 67
      Height = 17
      Caption = 'Ispis odluke'
      TabOrder = 3
      OnClick = Button7Click
    end
  end
  object GroupBox10: TGroupBox
    Left = 24
    Top = 328
    Width = 297
    Height = 57
    Caption = 'Vrsta kase'
    TabOrder = 17
    object RadioButton6: TRadioButton
      Left = 8
      Top = 24
      Width = 89
      Height = 17
      Caption = 'Maloprodajna'
      TabOrder = 0
    end
    object RadioButton7: TRadioButton
      Left = 104
      Top = 24
      Width = 81
      Height = 17
      Caption = 'Ugostiteljska'
      TabOrder = 1
    end
    object RadioButton11: TRadioButton
      Left = 192
      Top = 24
      Width = 81
      Height = 17
      Caption = 'Veleprodaja'
      TabOrder = 2
    end
  end
  object CheckBox3: TCheckBox
    Left = 344
    Top = 552
    Width = 217
    Height = 17
    Caption = 'Omogu'#263'i promijenu cijene artikla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
  end
  object GroupBox11: TGroupBox
    Left = 344
    Top = 576
    Width = 233
    Height = 49
    Caption = 'Vrsta printera'
    TabOrder = 19
    object RadioButton8: TRadioButton
      Left = 24
      Top = 24
      Width = 89
      Height = 17
      Caption = 'POS printer'
      TabOrder = 0
    end
    object RadioButton9: TRadioButton
      Left = 128
      Top = 24
      Width = 89
      Height = 17
      Caption = 'Obi'#269'ni printer'
      TabOrder = 1
    end
  end
  object RadioButton10: TRadioButton
    Left = 352
    Top = 520
    Width = 81
    Height = 17
    Caption = 'R2 ra'#269'un'
    TabOrder = 20
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DBQ=C:\Users\Fika\Desktop\FKasa\Kasa.mdb;DefaultDir=C:\Users' +
      '\Fika\Desktop\FKasa;Driver={Driver do Microsoft Access (*.mdb)};' +
      'DriverId=25;FIL=MS Access;FILEDSN=C:\Users\Fika\Desktop\FKasa\co' +
      'nnection.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;Safe' +
      'Transactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 408
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 408
    Top = 96
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT DiscountName AS Na'#269'in, DiscountPercentage AS Pos, Discoun' +
        'tTypeName AS Vrsta  FROM Discount')
    Left = 440
    Top = 64
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 440
    Top = 96
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 488
    Top = 256
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 448
    Top = 256
  end
end
