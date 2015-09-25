object Form2: TForm2
  Left = 331
  Top = 159
  Width = 1284
  Height = 736
  Caption = 'Fiskalna kasa '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 880
    Top = 144
    Width = 165
    Height = 19
    Caption = 'Pretra'#382'ivanje proizvoda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 872
    Top = 81
    Width = 149
    Height = 29
    Caption = 'Ukupni iznos :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 1120
    Top = 64
    Width = 93
    Height = 58
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 120
    Width = 65
    Height = 19
    Caption = 'Vrijeme :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 40
    Top = 144
    Width = 57
    Height = 19
    Caption = 'Datum :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 136
    Top = 120
    Width = 46
    Height = 19
    Caption = 'Label6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 136
    Top = 144
    Width = 46
    Height = 19
    Caption = 'Label7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 240
    Top = 144
    Width = 75
    Height = 19
    Caption = 'Blagajnik :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 336
    Top = 144
    Width = 46
    Height = 19
    Caption = 'Label9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 240
    Top = 72
    Width = 122
    Height = 33
    Caption = 'Ra'#269'un br. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 384
    Top = 72
    Width = 92
    Height = 33
    Caption = 'Label11'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 169
    Width = 1251
    Height = 657
    TabStop = False
    Align = alBottom
    Color = clInfoBk
    ColCount = 9
    DefaultColWidth = 95
    FixedColor = cl3DLight
    RowCount = 200
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
  end
  object Edit1: TEdit
    Left = 1056
    Top = 144
    Width = 185
    Height = 21
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
    OnKeyUp = Edit1KeyUp
  end
  object Button1: TButton
    Left = 40
    Top = 56
    Width = 153
    Height = 25
    Caption = 'Ctrl C-Promjena blagajnika'
    TabOrder = 2
    TabStop = False
    OnClick = Button1Click
  end
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 0
    Width = 1251
    Height = 49
    Cursor = crHandPoint
    Sections = <
      item
        ImageIndex = -1
        Text = 'F1- Izvje'#353'taj'
        Width = 75
      end
      item
        ImageIndex = -1
        Text = 'F2- Koli'#269'ina'
        Width = 72
      end
      item
        ImageIndex = -1
        Text = 'F3-Novi ra'#269'un'
        Width = 80
      end
      item
        ImageIndex = -1
        Text = 'F4-Brisanje reda'
        Width = 92
      end
      item
        ImageIndex = -1
        Text = 'F5-Izdaj ra'#269'un'
        Width = 85
      end
      item
        ImageIndex = -1
        Text = 'F6-Parametri'
        Width = 80
      end
      item
        ImageIndex = -1
        Text = 'F7-Fiskalizacija'
        Width = 85
      end
      item
        ImageIndex = -1
        Text = 'F8-Ladica'
        Width = 65
      end
      item
        ImageIndex = -1
        Text = 'F9-Izlaz'
        Width = 60
      end>
    OnSectionClick = HeaderControl1SectionClick
  end
  object Button2: TButton
    Left = 520
    Top = 136
    Width = 107
    Height = 33
    Caption = 'Ctrl S-Storniranje'
    TabOrder = 4
    TabStop = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 632
    Top = 136
    Width = 137
    Height = 33
    Caption = 'Ctrl A-Ambala'#382'a'
    TabOrder = 5
    TabStop = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 776
    Top = 136
    Width = 91
    Height = 33
    Caption = 'Ctrl D-Popust'
    TabOrder = 6
    TabStop = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 40
    Top = 88
    Width = 153
    Height = 25
    Caption = 'Ctrl B-Stanje u blagajni'
    TabOrder = 7
    OnClick = Button5Click
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
    Left = 728
    Top = 56
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 760
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 792
    Top = 56
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 760
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 792
    Top = 88
  end
  object XPManifest1: TXPManifest
    Left = 824
    Top = 56
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 824
    Top = 88
  end
end
