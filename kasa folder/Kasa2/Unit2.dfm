object Form2: TForm2
  Left = 368
  Top = 260
  Width = 1141
  Height = 473
  AutoSize = True
  Caption = 'Fiskalna kasa'
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
    Left = 696
    Top = 56
    Width = 58
    Height = 25
    Caption = 'Ra'#269'un'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 672
    Top = 376
    Width = 138
    Height = 25
    Caption = 'Ukupan iznos :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 336
    Width = 107
    Height = 23
    Caption = 'Pretra'#382'ivanje'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 32
    Top = 368
    Width = 104
    Height = 18
    Caption = 'Ime proizvoda :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 304
    Top = 368
    Width = 93
    Height = 18
    Caption = 'ID proizvoda :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 856
    Top = 368
    Width = 17
    Height = 39
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 49
    Height = 364
  end
  object Splitter2: TSplitter
    Left = 3
    Top = 49
    Height = 364
  end
  object Label3: TLabel
    Left = 952
    Top = 376
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
    Left = 768
    Top = 56
    Width = 26
    Height = 25
    Caption = 'br.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 896
    Top = 56
    Width = 11
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 413
    Width = 1133
    Height = 30
    Color = clCream
    Panels = <
      item
        Width = 200
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 521
    Height = 273
    Cursor = crHandPoint
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
  end
  object Button1: TButton
    Left = 1016
    Top = 72
    Width = 99
    Height = 49
    Cursor = crHandPoint
    Caption = '(F1) Pomo'#263
    DragCursor = crHelp
    TabOrder = 4
  end
  object Button2: TButton
    Left = 1016
    Top = 136
    Width = 99
    Height = 41
    Cursor = crHandPoint
    Caption = '(+) Dodaj'
    TabOrder = 5
  end
  object Button3: TButton
    Left = 1016
    Top = 192
    Width = 99
    Height = 41
    Cursor = crHandPoint
    Caption = '(-) Bri'#353'i'
    TabOrder = 6
  end
  object Button4: TButton
    Left = 1016
    Top = 248
    Width = 99
    Height = 41
    Cursor = crHandPoint
    Caption = '(F9) Pi'#353'i'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 1016
    Top = 304
    Width = 99
    Height = 41
    Cursor = crHandPoint
    Caption = '(F10) Stari'
    TabOrder = 8
  end
  object Edit1: TEdit
    Left = 152
    Top = 368
    Width = 121
    Height = 21
    Cursor = crIBeam
    TabOrder = 2
    OnKeyUp = Edit1KeyUp
  end
  object Edit2: TEdit
    Left = 416
    Top = 368
    Width = 121
    Height = 21
    Cursor = crIBeam
    TabOrder = 3
    OnKeyUp = Edit2KeyUp
  end
  object StringGrid1: TStringGrid
    Left = 656
    Top = 88
    Width = 345
    Height = 273
    Cursor = crHandPoint
    BorderStyle = bsNone
    Color = clInfoBk
    ColCount = 4
    FixedColor = cl3DLight
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
    OnKeyDown = StringGrid1KeyDown
    ColWidths = (
      152
      62
      58
      52)
  end
  object Button6: TButton
    Left = 1016
    Top = 360
    Width = 97
    Height = 41
    Caption = '(F11) Obri'#353'i'
    TabOrder = 9
    OnClick = Button6Click
  end
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 0
    Width = 1133
    Height = 49
    Sections = <
      item
        ImageIndex = -1
        Text = '       Promjena blagajnika'
        Width = 150
      end
      item
        ImageIndex = -1
        Text = '        Izvje'#353'taj'
        Width = 100
      end
      item
        ImageIndex = -1
        Text = '          Kaub'
        Width = 100
      end
      item
        ImageIndex = -1
        Text = '           Koli'#269'ina'
        Width = 120
      end>
    OnSectionClick = HeaderControl1SectionClick
  end
  object XPManifest1: TXPManifest
    Left = 1048
    Top = 8
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 1080
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Item_ID AS Sifra, Item_Name AS Ime,Item_Measure AS Mjera,' +
        ' Item_Price AS Cijena FROM items')
    Left = 1016
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DBQ=C:\Users\Fika\Desktop\Kasa\Kasa.mdb;DefaultDir=C:\Users\' +
      'Fika\Desktop\Kasa;Driver={Driver do Microsoft Access (*.mdb)};Dr' +
      'iverId=25;FIL=MS Access;FILEDSN=C:\Users\Fika\Desktop\Kasa\conne' +
      'ction.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTra' +
      'nsactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"'
    LoginPrompt = False
    Left = 1048
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 1080
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 1016
    Top = 40
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 984
    Top = 40
  end
end
