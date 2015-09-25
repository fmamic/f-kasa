unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TfrmStanjeSve = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query1ArtikliID: TFloatField;
    Query1Sifra: TFloatField;
    Query1Artikal: TStringField;
    Query1Cena: TFloatField;
    Query1Ukupno: TFloatField;
    Query1Radnik: TStringField;
    Query1Datum: TDateField;
    Query1Kolicina: TFloatField;
    Query1Jedinicamere: TStringField;
    Query1Pdv: TFloatField;
    procedure Query1AfterPost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStanjeSve: TfrmStanjeSve;

implementation

{$R *.DFM}

procedure TfrmStanjeSve.Query1AfterPost(DataSet: TDataSet);
begin
query1.FlushBuffers ;
end;

procedure TfrmStanjeSve.FormActivate(Sender: TObject);
begin
query1.Active := true;
end;

procedure TfrmStanjeSve.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
query1.Active := false;
end;

end.
