object Form15: TForm15
  Left = 533
  Top = 237
  BorderStyle = bsSingle
  Caption = 'Izvje'#353'taji'
  ClientHeight = 192
  ClientWidth = 438
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
    Left = 8
    Top = 56
    Width = 281
    Height = 129
    Caption = 'Period , blagajnik'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 20
      Height = 14
      Caption = 'Od:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 136
      Top = 25
      Width = 19
      Height = 14
      Caption = 'Do:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 42
      Height = 13
      Caption = 'Blagajnik'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 8
      Top = 40
      Width = 113
      Height = 21
      Date = 41320.878452939820000000
      Time = 41320.878452939820000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 136
      Top = 40
      Width = 113
      Height = 21
      Date = 41320.878632013890000000
      Time = 41320.878632013890000000
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 88
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'ComboBox1'
    end
  end
  object Button1: TButton
    Left = 304
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Po artiklima'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 32
    Width = 121
    Height = 25
    Caption = 'Po tarifnim brojevima'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 304
    Top = 56
    Width = 121
    Height = 25
    Caption = 'Po na'#269'inima pla'#263'anja'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 304
    Top = 160
    Width = 121
    Height = 25
    Caption = 'Izlaz'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 304
    Top = 104
    Width = 121
    Height = 25
    Caption = 'Naknadni ispis ra'#269'una'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 304
    Top = 128
    Width = 121
    Height = 25
    Caption = 'Otkup ambala'#382'e'
    TabOrder = 6
    OnClick = Button6Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 41
    Caption = 'Kriterij'
    TabOrder = 7
    object RadioButton1: TRadioButton
      Left = 16
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Za preriod'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 112
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Po ra'#269'unu'
      TabOrder = 1
      OnClick = RadioButton2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 56
    Width = 281
    Height = 129
    Caption = 'Odabir broja ra'#269'una za ispis'
    TabOrder = 8
    object Label4: TLabel
      Left = 24
      Top = 24
      Width = 18
      Height = 13
      Caption = 'Od:'
    end
    object Label5: TLabel
      Left = 24
      Top = 72
      Width = 17
      Height = 13
      Caption = 'Do:'
    end
    object Edit1: TEdit
      Left = 24
      Top = 40
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 24
      Top = 88
      Width = 169
      Height = 21
      TabOrder = 1
    end
  end
  object Button7: TButton
    Left = 304
    Top = 80
    Width = 121
    Height = 25
    Caption = 'Po vrstama pla'#263'anja'
    TabOrder = 9
    OnClick = Button7Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 160
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
    Left = 344
    Top = 160
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 376
    Top = 160
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 216
    Top = 144
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 248
    Top = 144
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 216
    Top = 112
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 248
    Top = 112
  end
end
