unit UnitRepro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ComCtrls, QuickRpt,
  QRCtrls, ExtCtrls;

type
  TFRepro = class(TForm)
    ADOupit1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    odDatuma: TDateTimePicker;
    doDatuma: TDateTimePicker;
    Repro: TLabel;
    ADOupit2: TADOQuery;
    ADOCommand1: TADOCommand;
    DataSource2: TDataSource;
    Button3: TButton;
    Button4: TButton;
    ADOupit3: TADOQuery;
    Dataupit3: TDataSource;
    Button5: TButton;
    ADoupit4: TADOQuery;
    Data4: TDataSource;
    ADOupit3Receipt_ID: TIntegerField;
    ADOupit3Receipt_Date: TDateTimeField;
    ADOupit3Item_Name: TWideStringField;
    ADOupit3Item_Qty: TFloatField;
    ADOupit3NORMA: TFloatField;
    ADOupit3GRUPENAZIV: TWideStringField;
    ADOupit3REPRONAZIV: TWideStringField;
    ADOupit3GRUPA: TWideStringField;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    PrintDialog1: TPrintDialog;
    Button6: TButton;
    QRSubDetail1: TQRSubDetail;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    Button7: TButton;
    ADoupit4REPRONAZIV: TWideStringField;
    ADoupit4SumOfBrasno: TFloatField;
    ADoupit4GRUPENAZIV: TWideStringField;
    ADoupit4SumOfProizvodnja: TFloatField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepro: TFRepro;

implementation

{$R *.dfm}

procedure TFRepro.Button2Click(Sender: TObject);
begin
Adoupit1.Close;
Adoupit2.Close;
Dbgrid1.DataSource := datasource2;
Adoupit2.Open;
end;

procedure TFRepro.Button1Click(Sender: TObject);
begin
Adoupit2.Close;
Dbgrid1.DataSource := datasource1;
Adoupit1.SQL.Clear;
//Adoupit1.SQL.Add('Select * From totalizlaz');
Adoupit1.SQL.Add('Select * From potrosnja');
Adoupit1.SQL.Add('WHERE potrosnja.kolicina.Receipt_date BETWEEN :oddatuma AND :dodatuma');
Adoupit1.Parameters.ParamByName ('odDatuma').Value:=DateToStr(odDatuma.Date);
Adoupit1.Parameters.ParamByName ('doDatuma').Value:=DateToStr(doDatuma.Date);
Adoupit1.Open;
end;

procedure TFRepro.Button3Click(Sender: TObject);
begin
//Adocommand1.Execute ;
Adoupit2.Close;
Adoupit1.Close;
Dbgrid1.DataSource := dataupit3;
Adoupit3.Open;
end;

procedure TFRepro.Button4Click(Sender: TObject);
begin
Adoupit2.Close;
Dbgrid1.DataSource := datasource2;

with ADOupit2 do
Adoupit2.SQL.Clear;
Adoupit2.Prepared;
//Adoquery2.Parameters:Value=Date
Adoupit2.SQL.Add('Select * From kolicina');
//Adoupit2.SQL.Add('SELECT Items.Item_ID, Items.Item_Name, TReceipts.Item_Qty, TReceipts.Item_VAT_ID, Items.GRUPA, TReceipts.Item_Price, ARTNORM.NORMA, Receipts.Receipt_Date FROM ARTNORM INNER JOIN Items ') ;
//Adoupit2.SQL.Add('SELECT INNER JOIN TReceipts ON Items.Item_ID = TReceipts.Item_ID');
//Adoupit2.SQL.Add('SELECT INNER JOIN Receipts ON TReceipts.Receipt_ID = Receipts.Receipt_ID');
//Adoupit2.SQL.Add('ARTNORM.SIFRA1 = Items.Item_ID GROUP BY Items.Item_ID, Items.Item_Name, TReceipts.Item_Qty, TReceipts.Item_VAT_ID, Items.GRUPA, TReceipts.Item_Price, ARTNORM.NORMA, Receipts.Receipt_Date');
//Adoquery2.SQL.Add('SELECT Kategorije,prihodi,rashodi');
//Adoupit2.SQL.Add('FROM Receipts');
//Adoquery2.Sql.Add('Group by Kategorije');
Adoupit2.SQL.Add('WHERE Receipts.Receipt_date BETWEEN :oddatuma AND :dodatuma');
Adoupit2.Parameters.ParamByName ('odDatuma').Value:=DateToStr(odDatuma.Date);
Adoupit2.Parameters.ParamByName ('doDatuma').Value:=DateToStr(doDatuma.Date);
//Adoquery2.Sql.Add('Group by Kategorije');
Adoupit2.Open;
end;

procedure TFRepro.Button5Click(Sender: TObject);
begin
Adoupit2.Close;
Adoupit1.Close;
Adoupit3.Close;
Dbgrid1.DataSource := data4;
Adoupit4.Open;
//SELECT Receipts.Receipt_ID, TReceipts.Receipt_ID, TReceipts.Item_Name, TReceipts.Item_Qty, TReceipts.Item_Price, Receipts.Receipt_Date, Items.GRUPA, Items.TEZINA, GRUPE.NAZIV
//FROM (Items INNER JOIN (Receipts INNER JOIN TReceipts ON Receipts.Receipt_ID = TReceipts.Receipt_ID) ON Items.Item_ID = TReceipts.Item_ID) INNER JOIN GRUPE ON Items.GRUPA = GRUPE.SIFRA
//ORDER BY Receipts.Receipt_ID, TReceipts.Receipt_ID
end;


procedure TFRepro.Button6Click(Sender: TObject);
begin
QuickRep1.Preview;
end;

procedure TFRepro.Button7Click(Sender: TObject);
begin
//adoupit4.Close;
Dbgrid1.DataSource := data4;
//adoupit4.SQL.Clear;
//adoupit4.SQL.Add('Select * From potrosnja');
adoupit4.Open;
end;

end.
