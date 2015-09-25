object Form6: TForm6
  Left = 787
  Top = 306
  BorderStyle = bsSingle
  Caption = 'Naplata'
  ClientHeight = 332
  ClientWidth = 547
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
    Left = 0
    Top = 8
    Width = 257
    Height = 273
    Caption = 'Na'#269'in pla'#263'anja'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 8
      Top = 24
      Width = 233
      Height = 153
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
    object Button3: TButton
      Left = 24
      Top = 224
      Width = 91
      Height = 25
      Caption = 'Paragon ra'#269'un'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 136
      Top = 224
      Width = 91
      Height = 25
      Caption = 'R ra'#269'un'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 264
    Top = 8
    Width = 273
    Height = 273
    Caption = 'Ukupni iznos'
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 72
      Height = 23
      Caption = 'Za platiti'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 104
      Width = 64
      Height = 23
      Caption = 'Pla'#263'eno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 184
      Width = 73
      Height = 23
      Caption = 'Za vratiti'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 80
      Top = 64
      Width = 8
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 88
      Top = 224
      Width = 46
      Height = 29
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 200
      Top = 64
      Width = 39
      Height = 25
      Caption = 'HRK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 200
      Top = 224
      Width = 39
      Height = 25
      Caption = 'HRK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 80
      Top = 136
      Width = 137
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
      OnKeyUp = Edit1KeyUp
    end
  end
  object Button1: TButton
    Left = 176
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Uredu'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT DiscountName AS Na'#269'in, DiscountPercentage AS Pos, Discoun' +
        'tTypeName AS Vrsta  FROM Discount'
      '')
    Left = 248
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 248
    Top = 120
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
    Left = 248
    Top = 56
  end
end
