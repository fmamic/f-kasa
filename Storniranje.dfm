object Form10: TForm10
  Left = 628
  Top = 135
  BorderStyle = bsSingle
  Caption = 'Storniranje'
  ClientHeight = 286
  ClientWidth = 349
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
    Left = 16
    Top = 16
    Width = 51
    Height = 16
    Caption = 'Blagajnik'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 72
    Top = 16
    Width = 37
    Height = 16
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 88
    Width = 320
    Height = 145
    Color = clInfoBk
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
  end
  object Button1: TButton
    Left = 32
    Top = 248
    Width = 137
    Height = 25
    Caption = 'Storniraj ra'#269'un'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 248
    Width = 137
    Height = 25
    Caption = 'Odustani'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 144
    Top = 16
    Width = 186
    Height = 21
    Date = 41511.938348819440000000
    Time = 41511.938348819440000000
    TabOrder = 3
    OnChange = DateTimePicker1Change
  end
  object Button3: TButton
    Left = 80
    Top = 48
    Width = 185
    Height = 25
    Caption = 'Prika'#382'i sve ra'#269'une'
    TabOrder = 4
    OnClick = Button3Click
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
    Left = 24
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 24
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 152
  end
end
