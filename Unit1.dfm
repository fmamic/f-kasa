object Form1: TForm1
  Left = 510
  Top = 337
  BorderStyle = bsSingle
  Caption = 'Prijava'
  ClientHeight = 145
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 66
    Height = 13
    Caption = 'Korisni'#269'ko ime'
  end
  object Label2: TLabel
    Left = 56
    Top = 72
    Width = 35
    Height = 13
    Caption = 'Lozinka'
  end
  object Label3: TLabel
    Left = 152
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
  object Button1: TButton
    Left = 104
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Uredu'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 40
    Width = 153
    Height = 21
    Cursor = crHandPoint
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 112
    Top = 72
    Width = 153
    Height = 21
    DragCursor = crHandPoint
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 192
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 3
    OnClick = Button2Click
  end
  object XPManifest1: TXPManifest
    Left = 288
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 288
    Top = 40
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
    Left = 288
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 288
    Top = 104
  end
end
