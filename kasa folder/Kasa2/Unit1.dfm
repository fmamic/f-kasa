object Form1: TForm1
  Left = 507
  Top = 331
  Width = 328
  Height = 185
  Caption = 'Prijava'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 48
    Width = 66
    Height = 13
    Caption = 'Korisni'#269'ko ime'
  end
  object Label2: TLabel
    Left = 32
    Top = 88
    Width = 35
    Height = 13
    Caption = 'Lozinka'
  end
  object Label3: TLabel
    Left = 160
    Top = 16
    Width = 64
    Height = 19
    Caption = 'Blagajnik'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 96
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Uredu'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 128
    Top = 48
    Width = 137
    Height = 21
    Cursor = crHandPoint
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 80
    Width = 137
    Height = 21
    DragCursor = crHandPoint
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 192
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 3
    OnClick = Button2Click
  end
  object XPManifest1: TXPManifest
    Left = 288
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 288
    Top = 56
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DBQ=C:\Users\Fika\Desktop\Kasa\Kasa.mdb;DefaultDir=C:\Users\' +
      'Fika\Desktop\Kasa;Driver={Driver do Microsoft Access (*.mdb)};Dr' +
      'iverId=25;FIL=MS Access;FILEDSN=C:\Users\Fika\Desktop\Kasa\conne' +
      'ction.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTra' +
      'nsactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 288
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 288
    Top = 120
  end
end
