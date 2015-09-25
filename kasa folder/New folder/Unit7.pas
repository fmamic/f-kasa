unit Unit7;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TfrmRacun = class(TQuickRep)
    QRSysData1: TQRSysData;
    QRMemo1: TQRMemo;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
    QRMemo2: TQRMemo;
    QRShape1: TQRShape;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    DataSource1: TDataSource;
    Table1: TTable;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    Query1: TQuery;
    Query1ArtikliID: TFloatField;
    Query1Sifra: TFloatField;
    Query1Artikal: TStringField;
    Query1Jedinicamere: TStringField;
    Query1Cena: TFloatField;
    Query1Ukupno: TFloatField;
    Query1Radnik: TStringField;
    Query1Datum: TDateField;
    Query1Kolicina: TFloatField;
    Query1Pdv: TFloatField;
    Query1BrojRacuna: TFloatField;
    PageFooterBand1: TQRBand;
    QRLabel7: TQRLabel;
    procedure frmRacunAfterPreview(Sender: TObject);
  private

  public

  end;

var
  frmRacun: TfrmRacun;

implementation

uses Unit2;

{$R *.DFM}







procedure TfrmRacun.frmRacunAfterPreview(Sender: TObject);
begin
 frmblagajna.Table1.Active := false;
 frmblagajna.Table1.EmptyTable ;
 frmblagajna.Table1.Active := true;
  frmblagajna.query4.Active := false;
 frmblagajna.Edit4.Text := '0,00';
 
 frmblagajna.query4.Active := true;
frmblagajna.Memo1.Clear ;
frmblagajna.Memo1.Lines.Add('Kasa je slobodna...');
end;








end.