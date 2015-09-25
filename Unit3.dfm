object Form3: TForm3
  Left = 712
  Top = 197
  BorderStyle = bsSingle
  Caption = 'Izbor proizvoda'
  ClientHeight = 570
  ClientWidth = 563
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
  object DBGrid1: TDBGrid
    Left = 16
    Top = 64
    Width = 529
    Height = 489
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
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 0
    Width = 563
    Height = 49
    Sections = <
      item
        ImageIndex = -1
        Text = '         Artikli'
        Width = 434
      end
      item
        ImageIndex = -1
        Text = '    Uredu'
        Width = 65
      end
      item
        ImageIndex = -1
        Text = '  Odustani'
        Width = 65
      end>
    OnSectionClick = HeaderControl1SectionClick
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 400
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 368
    Top = 8
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
    Left = 336
    Top = 8
  end
end
