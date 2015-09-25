unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, Grids, DBGrids, StdCtrls, Buttons, DBTables, ComCtrls;

type
  TfrmPretraga = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Table1: TTable;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Table1ArtikliID: TFloatField;
    Table1Sifra: TFloatField;
    Table1Artikal: TStringField;
    Table1Jedinicamere: TFloatField;
    Table1Cena: TFloatField;
    Table1Ukupno: TFloatField;
    Table1Radnik: TStringField;
    Table1Datum: TDateField;
    Table1BrojRacuna: TFloatField;
    Table1Kolicina: TFloatField;
    Table1Pdv: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPretraga: TfrmPretraga;

implementation

{$R *.DFM}

procedure TfrmPretraga.BitBtn1Click(Sender: TObject);
begin
table1.Active := false;
table1.Filter := ' artikliid =' + QuotedStr(edit1.Text ) ;
table1.Active := true;
if dbgrid1.DataSource.DataSet.RecordCount = 0 then
showmessage('Ne postoji racun sa tim brojem');
end;

procedure TfrmPretraga.BitBtn2Click(Sender: TObject);
begin
table1.Active := false;
table1.Filter := 'datum =' + datetostr(datetimepicker1.date) ;
table1.Active := true;
if dbgrid1.DataSource.DataSet.RecordCount = 0 then
showmessage('Ne postoji racun sa tim brojem');
end;

procedure TfrmPretraga.FormActivate(Sender: TObject);
begin
table1.Active := false;
datetimepicker1.Date := date;
end;

procedure TfrmPretraga.Table1AfterPost(DataSet: TDataSet);
begin
table1.FlushBuffers ;
end;

procedure TfrmPretraga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
table1.Active := false;
end;

end.