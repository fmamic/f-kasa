unit UnitKasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, Mask, DBCtrls,
  QuickRpt, QRCtrls;

type
  TfrmBlagajna = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Edit4: TEdit;
    Query1: TQuery;
    DataSource1: TDataSource;
    Edit5: TEdit;
    Label6: TLabel;
    BitBtn2: TBitBtn;
    Table2: TTable;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    Query2: TQuery;
    Query2SUMOFukupno: TFloatField;
    Label7: TLabel;
    BatchMove1: TBatchMove;
    Table3: TTable;
    Query3: TQuery;
    Query3MAXOFartikliid: TFloatField;
    Table1: TTable;
    Edit6: TEdit;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Button3: TButton;
    Panel2: TPanel;
    QuickRep3: TQuickRep;
    Racunupit: TQuery;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QuickRep1: TQuickRep;
    TitleBand2: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRSubDetail2: TQRSubDetail;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr4: TQRExpr;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel25: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    Button4: TButton;
    TableOsnovni: TTable;
    TableOsnovniNaziv: TStringField;
    TableOsnovniMjesto: TStringField;
    TableOsnovniUlica: TStringField;
    TableOsnovniUlica1: TStringField;
    TableOsnovniOIB: TStringField;
    TableOsnovniTelefon: TStringField;
    TableOsnovniNazivKase: TStringField;
    TableOsnovniBrRacunazadnjeg: TSmallintField;
    TableOsnovniNazivposlovnogProstora: TStringField;
    TableOsnovniPorukanaracunu1: TStringField;
    TableOsnovniPorukanaracunu2: TStringField;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    Racuni: TTable;
    RacuniIdaRTIKLI: TFloatField;
    RacuniBrrac: TFloatField;
    RacuniSveukupno: TCurrencyField;
    RacuniDatum: TDateField;
    RacuniVrijeme: TTimeField;
    RacuniPDV: TFloatField;
    RacuniPNP: TFloatField;
    RacuniIZRACUNPDV: TFloatField;
    RacuniIZRACUNPNP: TFloatField;
    RacuniZKI: TIntegerField;
    RacuniJIR: TIntegerField;
    DataSource2: TDataSource;
    UpdateSQL1: TUpdateSQL;
    BatchMove2: TBatchMove;
    Memo1: TMemo;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    Table1ArtikliID: TFloatField;
    Table1Sifra: TFloatField;
    Table1Artikli: TStringField;
    Table1Jedinicamijere: TFloatField;
    Table1Cijena: TCurrencyField;
    Table1Ukupno: TCurrencyField;
    Table1OIB: TFloatField;
    Table1Datum: TDateTimeField;
    Table1BrojRacuna: TFloatField;
    Table1PDV: TFloatField;
    Table1PNP: TFloatField;
    Table1Vrijeme: TTimeField;
    Table1Izracun: TFloatField;
    Table1ZKI: TStringField;
    Table1JIR: TStringField;
    Table1R: TStringField;
    Table2ArtikliID: TFloatField;
    Table2Sifra: TFloatField;
    Table2Artikli: TStringField;
    Table2Jedinicamijere: TFloatField;
    Table2Cijena: TFloatField;
    Table2Ukupno: TFloatField;
    Table2OIB: TFloatField;
    Table2Datum: TDateTimeField;
    Table2Kolicina: TFloatField;
    Table2PDV: TFloatField;
    Table2PNP: TFloatField;
    Table2ZKI: TStringField;
    Table2JIR: TStringField;
    Table2R: TStringField;
    Table3ArtikliID: TFloatField;
    Table3Sifra: TFloatField;
    Table3Artikli: TStringField;
    Table3Jedinicamijere: TFloatField;
    Table3Cijena: TCurrencyField;
    Table3Ukupno: TCurrencyField;
    Table3OIB: TFloatField;
    Table3Datum: TDateField;
    Table3BrojRacuna: TFloatField;
    Table3PDV: TFloatField;
    Table3PNP: TFloatField;
    Table3ZKI: TStringField;
    Table3JIR: TStringField;
    Table3Uzki: TStringField;
    Table3Izracun: TCurrencyField;
    Table3R: TStringField;
    Query1ArtikliID: TFloatField;
    Query1Sifra: TFloatField;
    Query1Artikli: TStringField;
    Query1Jedinicamijere: TFloatField;
    Query1Cijena: TFloatField;
    Query1Ukupno: TFloatField;
    Query1OIB: TFloatField;
    Query1Datum: TDateTimeField;
    Query1Kolicina: TFloatField;
    Query1PDV: TFloatField;
    Query1PNP: TFloatField;
    Query1ZKI: TStringField;
    Query1JIR: TStringField;
    Query1R: TStringField;
    procedure DBComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Query1AfterInsert(DataSet: TDataSet);
    procedure Query1AfterPost(DataSet: TDataSet);
    procedure Query1AfterEdit(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterEdit(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure Query2AfterEdit(DataSet: TDataSet);
    procedure Query2AfterInsert(DataSet: TDataSet);
    procedure Query2AfterPost(DataSet: TDataSet);
    procedure Query3AfterInsert(DataSet: TDataSet);
    procedure Query3AfterEdit(DataSet: TDataSet);
    procedure Query3AfterPost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure Table2AfterInsert(DataSet: TDataSet);
    procedure Table2AfterEdit(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table3AfterInsert(DataSet: TDataSet);
    procedure Table3AfterEdit(DataSet: TDataSet);
    procedure Table3AfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlagajna: TfrmBlagajna;

implementation

//uses

uses Racununit1, Unit2;

{$R *.DFM}







procedure TfrmBlagajna.DBComboBox1Change(Sender: TObject);
begin
table2.Filter := 'artikal = ' + '''' + combobox1.text + '''';
end;

procedure TfrmBlagajna.FormActivate(Sender: TObject);
var
racun : integer;
zbir : double;

begin

query1.Active := false;
query1.Active := true;
table3.active := false;
table3.active := true;
SysUtils.DateSeparator := '/' ;
SysUtils.ShortDateFormat := 'dd/mm/yyyy';
label7.Caption := datetostr(date);
Label9.Caption := timetostr(time);
query3.Active := false;
query3.Active := true;
  racun := query3maxofartikliid.AsInteger;
table1.active := false;
table1.active := true;
IF (table1.RecordCount > 0)  THEN begin
edit5.Text := inttostr(racun + 1);
end
else
begin
edit5.Text := inttostr(racun + 1);
end;
query2.Active := false;
query2.Active := true;
zbir := query2sumofukupno.Value ;
edit4.Text := floattostr(zbir);
edit4.Text := (Format('%f', [zbir]));
table2.active := false;
table2.active := true;
  with table2 do begin
    open;
    while not EOF do
    begin
    combobox1.items.add(FieldByName('Artikli').AsString);
      next;
    end;

end;
end;

procedure TfrmBlagajna.ComboBox1Change(Sender: TObject);
begin
query1.Close;
query1.SQL.Clear ;
query1.SQL.Add ('select * from artikli');
query1.SQL.Add ('where artikli = ' + quotedstr(combobox1.Text));
query1.Open;
edit1.Text := inttostr(query1sifra.AsInteger);
edit3.Text := floattostr(query1cijena.asfloat);
edit3.Text := (Format('%f', [query1cijena.asfloat]));
edit6.Text :=  inttostr(query1kolicina.AsInteger);
edit7.Text :=  floattostr(query1PDV.asfloat);
edit8.Text :=  (Format('%f', [query1cijena.asfloat]));
edit10.Text :=  floattostr(query1OIB.asfloat);
edit10.Text :=  (Format('%f',[query1OIB.asfloat]));
edit15.Text :=  query1R.text;
//edit11.Text :=  inttostr(query1ZKI.Asinteger);
//edit11.Text :=  (Format('%f', [query1ZKI.asfloat]));
//edit12.Text :=  inttostr(query1JIR.Asinteger);
//edit12.Text :=  (Format('%f', [query1JIR.asfloat]));
end;

procedure TfrmBlagajna.BitBtn1Click(Sender: TObject);
var
//F: string;
zbir : double;

begin
if (combobox1.Text = '') or (edit1.text = '') or (edit3.Text = '' ) then begin
showmessage('Morate izabrati neki proizvod,nisu dozvoljena prazna polja');
exit;
end
else
begin
dbgrid1.DataSource.DataSet.Insert;
dbgrid1.Fields[0].asinteger := strtoint(edit1.text);
dbgrid1.Fields[1].asstring :=  combobox1.text ;
dbgrid1.Fields[2].asfloat := strtofloat(edit2.text);
dbgrid1.Fields[3].asfloat := strtofloat(edit3.text);
dbgrid1.Fields[4].asfloat := strtofloat(edit2.text) * strtofloat(edit3.text);
dbgrid1.Fields[5].Asfloat := strtofloat(edit7.Text);
dbgrid1.Fields[8].AsFloat := strtofloat(edit10.Text);
//dbgrid1.Fields[9].Asinteger := strtoint(edit11.Text);
//dbgrid1.Fields[10].Asinteger := strtoint(edit12.Text);
dbgrid1.Fields[12].Asstring := edit15.Text;

//frmunoszaliha.table1.Active := false;
//frmunoszaliha.table1.Active :=  true;
//frmunoszaliha.table1.Edit;
//frmunoszaliha.table1kolicina.Value := strtofloat(edit6.text) - strtofloat(edit2.text);
//frmunoszaliha.table1.Post ;
//frmunoszaliha.table1.Active := false;
//frmunoszaliha.table1.Active :=  true;
query1.Active := false;
query1.Active := true;
//edit6.Text := floattostr(frmunoszaliha.table1kolicina.value);
table1artikliid.Value := strtoint(edit5.text);
dbgrid1.DataSource.DataSet.Post ;
//memo1.Lines.Add(Combobox2.Text);
//memo1.Lines.add (F);
//memo1.Lines.Add(label7.Caption + label9.Caption );
//memo1.Lines.Add(edit5.Text );
query2.Active := false;
query2.Active := true;
zbir := query2sumofukupno.Value ;
edit4.Text := floattostr(zbir);
edit4.Text := (Format('%f', [zbir]));
combobox1.Text := '' ;
//edit1.Text :='';
edit1.Clear ;
edit3.Clear ;
end;
end;

procedure TfrmBlagajna.Query1AfterInsert(DataSet: TDataSet);
begin
query1.FlushBuffers ;
end;

procedure TfrmBlagajna.Query1AfterPost(DataSet: TDataSet);
begin
query1.FlushBuffers ;
end;

procedure TfrmBlagajna.Query1AfterEdit(DataSet: TDataSet);
begin
query1.FlushBuffers ;
end;

procedure TfrmBlagajna.Table1AfterInsert(DataSet: TDataSet);
begin
table1.FlushBuffers ;
end;

procedure TfrmBlagajna.Table1AfterEdit(DataSet: TDataSet);
begin
table1.FlushBuffers ;
end;

procedure TfrmBlagajna.Table1AfterPost(DataSet: TDataSet);
begin
table1.FlushBuffers ;
end;

procedure TfrmBlagajna.BitBtn3Click(Sender: TObject);
var
//I: TextFile;
//A: string;
B: string;
C: string;
D: string;
E: string;
F: String;
G: string;
H: string;
I: string;
//J: DateFile;
racun : integer;
begin
//frmkusur.Caption := (IntToStr(MovedCount) + ' artikala je obracunato');
table1.Active := false;

table1.Active := true;

//AssignFile(I, 'C:\Test20\Racun.txt');
 // Rewrite(I);
 // WriteLn(I, ComboBox2.Text);
 // WriteLn(I, Label7.string);
  //WriteLn(I, Label9.Text);
 // WriteLn(I, Edit5.Text);
 // CloseFile(I);

//A := A + ComboBox2.Text + ' ,';
//A := A + Label7.FieldByName('Date').AsString + ' ,';
//WriteLn(A, ComboBox2.Text);
//A := A + Table1.FieldByName('artikliid').AsString + ' ';
//D := D + Table1.Fieldbyname('Ukupno').Asstring + '';      // ukupan iznos
//C := C + Table1.FieldbyName('artikliid').AsString + ' ';  //brracuna
B := B + Table1.FieldByName('PDV').AsString + ' ;';        //Iznos_Pdva
B := B + Table1.FieldByName('Ukupno').AsString + ' ';      //Iznos koji se obraèunava
//B := B + Table1.FielByName ('PDV_U cijeni').AsString + '';  //obraèunati porez u ukupno (Ukupno * 25 /100)
C := C + Table1.FieldbyName('artikliid').AsString + ' ';  //brracuna
//F := F + nacin.Placanja
//C := C + Table1.FieldbyName('artikliid').AsString + ';';   //br_racuna
D := D + Table1.Fieldbyname('Ukupno').Asstring + ' ';    //ukupan iznos racuna
E := E + Table1.FieldbyName('OIB').AsString + ' ';    //OIB
F := F + Table1.FieldbyName ('R').Text + ''; //R
//Edit11.Text:=(D);
//Edit12.Text:=(D);
//Edit13.Text:=(D);
//CloseFile(I);


//Table1.Next;
//WriteLN(Edit11.TEXT);
//Edit11.Text.SaveTofile('racun.txt');
//Memo1.Lines.Add(A);
Memo1.Lines.Add(F);
//Memo1.Lines.Add(B);
memo1.Lines.Add(label7.Caption +''+ label9.Caption );
Memo1.Lines.Add(B);
//memo1.Lines.Add(edit5.Text );
Memo1.Lines.Add(D);
Memo1.Lines.Add(E);
Memo1.Lines.SaveToFile('racun.txt');
//Memo1.Lines.SaveToFile('racun.txt');
//QuickRep1.Print;
with BatchMove1 do //poèetak prijenosa baze
begin
Source := table1;
Destination := Table3;
Mode := batAppend;
Execute;
Memo1.Lines.Clear;
table1.Active := false;
table1.Close;

table1.EmptyTable;
table1.Open;
//table1.Active := true;
query3.Active := false;
query3.Active := true;
  racun := query3maxofartikliid.AsInteger;
  edit4.Clear ;

IF (table1.RecordCount = 0) THEN begin
edit5.Text := inttostr(racun + 1);
end
else
begin
edit5.Text := inttostr(1);
end;

end;

end;
//end; pa ovo

procedure TfrmBlagajna.Query2AfterEdit(DataSet: TDataSet);
begin
query2.FlushBuffers ;
end;

procedure TfrmBlagajna.Query2AfterInsert(DataSet: TDataSet);
begin
query2.FlushBuffers ;
end;

procedure TfrmBlagajna.Query2AfterPost(DataSet: TDataSet);
begin
query2.FlushBuffers ;
end;

procedure TfrmBlagajna.Query3AfterInsert(DataSet: TDataSet);
begin
query3.FlushBuffers ;
end;

procedure TfrmBlagajna.Query3AfterEdit(DataSet: TDataSet);
begin
query3.FlushBuffers ;
end;

procedure TfrmBlagajna.Query3AfterPost(DataSet: TDataSet);
begin
query3.FlushBuffers ;
end;

procedure TfrmBlagajna.BitBtn2Click(Sender: TObject);
var
zbir : double;
begin
table1.Delete;
query2.active := false;
query2.active := true;
zbir := query2sumofukupno.Value ;
edit4.Text := floattostr(zbir);
edit4.Text := (Format('%f', [zbir]));
end;

procedure TfrmBlagajna.Table2AfterInsert(DataSet: TDataSet);
begin
table2.FlushBuffers ;
end;

procedure TfrmBlagajna.Table2AfterEdit(DataSet: TDataSet);
begin
table2.FlushBuffers ;
end;

procedure TfrmBlagajna.Table2AfterPost(DataSet: TDataSet);
begin
table2.FlushBuffers ;
end;

procedure TfrmBlagajna.Table3AfterInsert(DataSet: TDataSet);
begin
table3.FlushBuffers ;
end;

procedure TfrmBlagajna.Table3AfterEdit(DataSet: TDataSet);
begin
table3.FlushBuffers ;
end;

procedure TfrmBlagajna.Table3AfterPost(DataSet: TDataSet);
begin
table3.FlushBuffers ;
end;

procedure TfrmBlagajna.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
table1.Active := false;
table2.Active := false;
table3.Active := false;
query1.Active := false;
query2.Active := false;
query3.Active := false;
end;



procedure TfrmBlagajna.Button1Click(Sender: TObject);
begin
Table1.Close;
Table2.Close;
Table3.Close;
frmBlagajna.Close;
Formakase.show;
end;

procedure TfrmBlagajna.Button2Click(Sender: TObject);
begin
Table3.Close;
Table3.EmptyTable;
Table3.Open;
end;

procedure TfrmBlagajna.Button3Click(Sender: TObject);
begin
QuickRep1.Preview;
//Racun.Show;
end;

procedure TfrmBlagajna.Button4Click(Sender: TObject);
begin
table1.Close;
table1.EmptyTable;
TABLE1.Open;
//procedure TfrmPretraga.BitBtn1Click(Sender: TObject);
//begin
//Table3.Active := false;
//Table3.Filter := ' artikliid =' + QuotedStr(edit1.Text ) ;
//Table3.Active := true;
//if dbgrid1.DataSource.DataSet.RecordCount = 0 then
//showmessage('Ne postoji racun sa tim brojem');

end;

procedure TfrmBlagajna.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  VAR
  ZBIR : DOUBLE;
  RACUN : INTEGER;
begin
 if Key = VK_F2 then
 if (combobox1.Text = '') or (edit1.text = '') or (edit3.Text = '' ) then begin
showmessage('Morate izabrati neki proizvod,nisu dozvoljena prazna polja');
exit;
end
else
begin
dbgrid1.DataSource.DataSet.Insert;
dbgrid1.Fields[0].asinteger := strtoint(edit1.text);
dbgrid1.Fields[1].asstring :=  combobox1.text ;
dbgrid1.Fields[2].asfloat := strtofloat(edit2.text);
dbgrid1.Fields[3].asfloat := strtofloat(edit3.text);
dbgrid1.Fields[4].asfloat := strtofloat(edit2.text) * strtofloat(edit3.text);
dbgrid1.Fields[5].AsFloat := strtofloat(edit7.Text);
dbgrid1.Fields[8].AsFloat := strtofloat(edit10.Text);
//dbgrid1.Fields[9].Asinteger := strtoint(edit11.Text);
//dbgrid1.Fields[10].Asinteger := strtoint(edit12.Text);

//frmunoszaliha.table1.Active := false;
//frmunoszaliha.table1.Active :=  true;
//frmunoszaliha.table1.Edit;
//frmunoszaliha.table1kolicina.Value := strtofloat(edit6.text) - strtofloat(edit2.text);
//frmunoszaliha.table1.Post ;
//frmunoszaliha.table1.Active := false;
//frmunoszaliha.table1.Active :=  true;
query1.Active := false;
query1.Active := true;
//edit6.Text := floattostr(frmunoszaliha.table1kolicina.value);
table1artikliid.Value := strtoint(edit5.text);
dbgrid1.DataSource.DataSet.Post ;
query2.Active := false;
query2.Active := true;
zbir := query2sumofukupno.Value ;
edit4.Text := floattostr(zbir);
edit4.Text := (Format('%f', [zbir]));
combobox1.Text := '' ;
//edit1.Text :='';
edit1.Clear ;
edit3.Clear ;
end;
if Key = VK_F4 then
table1.Delete;
query2.active := false;
query2.active := true;
zbir := query2sumofukupno.Value ;
edit4.Text := floattostr(zbir);
edit4.Text := (Format('%f', [zbir]));
if Key = VK_F6 then BEGIN
table1.Active := false;

table1.Active := true;

//AssignFile(I, 'C:\Test20\Racun.txt');
 // Rewrite(I);
 // WriteLn(I, ComboBox2.Text);
 // WriteLn(I, Label7.string);
  //WriteLn(I, Label9.Text);
 // WriteLn(I, Edit5.Text);
 // CloseFile(I);

//A := A + ComboBox2.AsString + ' ,';
//A := A + Label7.FieldByName('Date').AsString + ' ,';
//WriteLn(A, ComboBox2.Text);
//A := A + Table1.FieldByName('artikliid').AsString + ' ';
//D := D + Table1.Fieldbyname('Ukupno').Asstring + '';
//C := C + Table1.FieldbyName('artikliid').AsString + ' ';  //brracuna
//B := B + Table1.FieldByName('PDV').AsString + ' ;';        //Iznos_Pdva
//B := B + Table1.FieldByName('Ukupno').AsString + ' ';      //Iznos koji se obraèunava
//C := C + Table1.FieldbyName('artikliid').AsString + ' ';  //brracuna
//F := F + nacin.Placanja
//C := C + Table1.FieldbyName('artikliid').AsString + ';';   //br_racuna
//D := D + Table1.Fieldbyname('Ukupno').Asstring + ' ';    //ukupan iznos racuna
//E := E + Table1.FieldbyName('OIB').AsString + ';';    //OIB
//Edit11.Text:=(D);
//Edit12.Text:=(D);
//Edit13.Text:=(D);
//CloseFile(I);


//Table1.Next;
//WriteLN(Edit11.TEXT);
//Edit11.Text.SaveTofile('racun.txt');
//Memo1.Lines.Add(A);
//Memo1.Lines.Add(C);
//Memo1.Lines.Add(B);
//Memo1.Lines.Add(D);
//Memo1.Lines.Add(E);
//Memo1.Lines.SaveToFile('racun.txt');
//Memo1.Lines.SaveToFile('racun.txt');
//QuickRep1.Print;
with BatchMove1 do //poèetak prijenosa baze
begin
Source := table1;
Destination := Table3;
Mode := batAppend;
Execute;
table1.Active := false;
table1.Close;

table1.EmptyTable;
table1.Open;
table1.Active := true;
query3.Active := false;
query3.Active := true;
  racun := query3maxofartikliid.AsInteger;
  edit4.Clear ;

IF (table1.RecordCount = 0) THEN begin
edit5.Text := inttostr(racun + 1);
end
else
begin
edit5.Text := inttostr(1);
end;
END;

end;
end;

end.

