object Form13: TForm13
  Left = 552
  Top = 318
  BorderStyle = bsSingle
  Caption = 'Unos pologa'
  ClientHeight = 92
  ClientWidth = 376
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
    Left = 184
    Top = 8
    Width = 177
    Height = 14
    Caption = 'Iznos pologa gotovine u blagajni'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 35
    Height = 14
    Caption = 'Datum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 24
    Width = 153
    Height = 21
    Date = 41316.825611145830000000
    Time = 41316.825611145830000000
    TabOrder = 3
    OnKeyDown = DateTimePicker1KeyDown
  end
  object Edit1: TEdit
    Left = 184
    Top = 24
    Width = 177
    Height = 21
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object Button1: TButton
    Left = 96
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Uredu'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 2
    OnClick = Button2Click
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
    Left = 8
    Top = 56
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 72
    Top = 56
  end
end
