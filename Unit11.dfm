object Form11: TForm11
  Left = 577
  Top = 386
  BorderStyle = bsSingle
  Caption = 'R1 ra'#269'un'
  ClientHeight = 245
  ClientWidth = 430
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
    Left = 16
    Top = 8
    Width = 127
    Height = 23
    Caption = 'Podaci o kupcu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 312
    Top = 32
    Width = 91
    Height = 13
    Caption = 'Upi'#353'i naziv kupca : '
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 32
    Width = 281
    Height = 201
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 57
      Height = 13
      Caption = 'Naziv kupca'
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 65
      Height = 13
      Caption = 'Adresa kupca'
    end
    object Label4: TLabel
      Left = 16
      Top = 136
      Width = 49
      Height = 13
      Caption = 'OIB kupca'
    end
    object Edit1: TEdit
      Left = 16
      Top = 40
      Width = 233
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 16
      Top = 96
      Width = 233
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 16
      Top = 152
      Width = 233
      Height = 21
      TabOrder = 2
    end
  end
  object Button1: TButton
    Left = 312
    Top = 88
    Width = 105
    Height = 25
    Caption = 'Svi kupci'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 312
    Top = 120
    Width = 105
    Height = 25
    Caption = 'Spremi kupca'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 168
    Width = 105
    Height = 25
    Caption = 'Uredu'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 312
    Top = 200
    Width = 105
    Height = 25
    Caption = 'Odustani'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Edit4: TEdit
    Left = 312
    Top = 56
    Width = 105
    Height = 21
    TabOrder = 5
    OnKeyDown = Edit4KeyDown
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DBQ=C:\Users\Fika\Desktop\FKasa\Kasa.mdb;DefaultDir=C:\Users' +
      '\Fika\Desktop\FKasa;Driver={Driver do Microsoft Access (*.mdb)};' +
      'DriverId=25;FIL=MS Access;FILEDSN=C:\Users\Fika\Desktop\FKasa\co' +
      'nnection.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;Safe' +
      'Transactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"'
    Provider = 'MSDASQL.1'
    Left = 176
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 248
    Top = 8
  end
end
