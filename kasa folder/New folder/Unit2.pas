unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, Mask, DBCtrls,
  quickrpt, Qrctrls;

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
    Label7: TLabel;
    BatchMove1: TBatchMove;
    Table3: TTable;
    Query3: TQuery;
    Edit6: TEdit;
    Label8: TLabel;
    Table1: TTable;
    Table1ArtikliID: TFloatField;
    Table1Sifra: TFloatField;
    Table1Artikal: TStringField;
    Table1Jedinicamere: TStringField;
    Table1Cena: TFloatField;
    Table1Ukupno: TFloatField;
    Table1Radnik: TStringField;
    Table1Datum: TDateField;
    Table1BrojRacuna: TFloatField;
    Table1Kolicina: TFloatField;
    Edit7: TEdit;
    Label9: TLabel;
    Query1ArtikliID: TFloatField;
    Query1Sifra: TFloatField;
    Query1Artikal: TStringField;
    Query1Jedinicamere: TStringField;
    Query1Cena: TFloatField;
    Query1Ukupno: TFloatField;
    Query1Radnik: TStringField;
    Query1Datum: TDateField;
    Query1Kolicina: TFloatField;
    Query2SUMOFukupno: TFloatField;
    Query3MAXOFartikliid: TFloatField;
    Table2ArtikliID: TFloatField;
    Table2Sifra: TFloatField;
    Table2Artikal: TStringField;
    Table2Jedinicamere: TStringField;
    Table2Cena: TFloatField;
    Table2Ukupno: TFloatField;
    Table2Radnik: TStringField;
    Table2Datum: TDateField;
    Table2Kolicina: TFloatField;
    Table3ArtikliID: TFloatField;
    Table3Sifra: TFloatField;
    Table3Artikal: TStringField;
    Table3Jedinicamere: TFloatField;
    Table3Cena: TFloatField;
    Table3Ukupno: TFloatField;
    Table3Radnik: TStringField;
    Table3Datum: TDateField;
    Table3BrojRacuna: TFloatField;
    BitBtn4: TBitBtn;
    Table1Pdv: TFloatField;
    Table2Pdv: TFloatField;
    Table3Kolicina: TFloatField;
    Table3Pdv: TFloatField;
    Query1Pdv: TFloatField;
    Query4: TQuery;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    Query4PDV: TFloatField;
    Query4SUMOFUKUPNO: TFloatField;
    Query4STOPA: TFloatField;
    Query4OSNOVICA: TFloatField;
    Memo1: TMemo;
    procedure DBComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Query1AfterPost(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure Query2AfterPost(DataSet: TDataSet);
    procedure Query3AfterPost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure Table3AfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlagajna: TfrmBlagajna;

implementation

uses Unit4, Unit5, Unit8, Unit7;

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
query4.Active := true;
table3.active := false;
table3.active := true;
label7.Caption := datetostr(date);
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
    combobox1.items.add(FieldByName('Artikal').AsString);
      next;
    end;

end;
end;

procedure TfrmBlagajna.ComboBox1Change(Sender: TObject);
begin
frmunoszaliha.table1.Active := false;
frmunoszaliha.table1.Active :=  true;
 frmunoszaliha.table1.Refresh ;
query1.Close;
query1.SQL.Clear ;
query1.SQL.Add ('select * from artikli');
query1.SQL.Add ('where artikal = ' + quotedstr(combobox1.Text));
query1.Open;
edit1.Text := inttostr(query1sifra.AsInteger);
edit3.Text := floattostr(query1cena.asfloat);
edit3.Text := (Format('%f', [query1cena.asfloat]));
edit6.Text :=  floattostr(strtofloat(frmunoszaliha.table1kolicina.AsString));
edit7.Text :=  query1jedinicamere.AsString ;


end;

procedure TfrmBlagajna.BitBtn1Click(Sender: TObject);
var
zbir : double;

begin
 
memo1.Clear ;
if (combobox1.Text = '') or (edit1.text = '') or (edit2.Text = '' ) then begin
showmessage('Morate izabrati neki proizvod,nisu dozvoljena prazna polja');
exit;
end
else
begin

dbgrid1.DataSource.DataSet.Insert;
dbgrid1.Fields[0].asinteger := strtoint(edit1.text);
dbgrid1.Fields[1].asstring :=  combobox1.text ;
dbgrid1.Fields[2].asfloat := strtofloat(edit2.text);
dbgrid1.Fields[3].asstring :=  edit7.text ;
dbgrid1.Fields[4].asfloat :=  strtofloat(edit3.text) ;
dbgrid1.Fields[5].asfloat := strtofloat(edit2.text) * strtofloat(edit3.text);
dbgrid1.Fields[6].asfloat := QUERY1PDV.Value;
frmunoszaliha.table1.Active := false;
frmunoszaliha.table1.Active :=  true;
frmunoszaliha.table1.Edit;
frmunoszaliha.table1kolicina.Value := strtofloat(edit6.text) - strtofloat(edit2.text);
frmunoszaliha.table1.Post ;

frmunoszaliha.table1.Active := false;
frmunoszaliha.table1.Active :=  true;
query1.Active := false;
query1.Active := TRUE;
edit6.Text := floattostr(frmunoszaliha.table1kolicina.value);
table1artikliid.Value := strtoint(edit5.text);
dbgrid1.DataSource.DataSet.Post ;
query2.Active := false;
query2.Active := true;
zbir := query2sumofukupno.Value ;
edit4.Text := floattostr(zbir);
edit4.Text := (Format('%f', [zbir]));
combobox1.Text := '' ;
edit1.Clear ;
edit3.Clear ;
query4.Active := false;
query4.Active := true;
memo1.Lines.Add ('Pero');
memo1.Lines.Add ('Caffe bar Pero Ugostiteljski obrt');
memo1.Lines.Add ('10000 Zagreb,Probna 15 a');
memo1.Lines.Add ('OIB : 18727196161');
memo1.Lines.Add ('RACUN :' + edit5.Text  );
memo1.Lines.Add ('Datum:' + datetostr(date) + '        ' + 'Vreme:' + timetostr(now) );
memo1.Lines.Add ('- - - - - - - - - - - - - - - - - - - - - - - - - ');
memo1.Lines.Add ('- - - - - - - - - - - - - - - - - - - - - - - - - ');
with table1 do
begin
First;
while not eof do
begin

Memo1.Lines.Add((table1.FieldByName('Sifra').AsString) + #9 + (table1.FieldByName('PDV').AsString) + #9 + (table1.FieldByName('Cena').AsString)) ;
Memo1.Lines.Add('');
Memo1.Lines.Add((Table1.FieldByName('Artikal').AsString) + #9 + #9+ (table1.FieldByName('Kolicina').AsString) + #9 + (table1.FieldByName('Ukupno').AsString)) ;
memo1.Lines.Add('');
next;

end;
Memo1.Lines.Add('-------------');
Memo1.Lines.Add('Ukupno: ' + '    ' + edit4.Text );
with query4 do
begin
first;
while not eof do
begin
Memo1.Lines.Add((Query4.FieldByName('pdv').AsString) + #9 + (Query4.FieldByName('stopa').AsString) + '             ' + (Query4.FieldByName('Osnovica').AsString)) ;
next;
end;
end;

end;

frmblagajna.OnClose := self.FormClose ;
frmblagajna.OnActivate := self.FormActivate;

end;
end;

procedure TfrmBlagajna.Query1AfterPost(DataSet: TDataSet);
begin
query1.FlushBuffers ;
end;

procedure TfrmBlagajna.Table1AfterPost(DataSet: TDataSet);
begin
table1.FlushBuffers ;
end;

procedure TfrmBlagajna.BitBtn3Click(Sender: TObject);
var
racun : integer;
begin

FRMKUSUR.SHOW;

table1.Active := false;

table1.Active := true;
query3.Active := false;
query3.Active := true;

  racun := query3maxofartikliid.AsInteger;
with BatchMove1 do //poèetak prijenosa baze
begin
Source := table1;
Destination := Table3;
Mode := batAppend;
Execute;

frmkusur.Caption := (IntToStr(MovedCount) + ' artikla je obracunato');




end;
end;

procedure TfrmBlagajna.Query2AfterPost(DataSet: TDataSet);
begin
query2.FlushBuffers ;
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
frmunoszaliha.table1.Active := false;
frmunoszaliha.table1.Active :=  true;
frmunoszaliha.table1.Edit;
frmunoszaliha.table1kolicina.Value := strtofloat(edit6.text) + dbgrid1.Fields[2].asfloat;
frmunoszaliha.table1.Post ;
frmunoszaliha.table1.Active := false;
frmunoszaliha.table1.Active :=  true;
edit6.Text := floattostr(frmunoszaliha.table1kolicina.value);

end;

procedure TfrmBlagajna.Table2AfterPost(DataSet: TDataSet);
begin
table2.FlushBuffers ;
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
query4.Active := false;
combobox1.Clear ;
edit1.Clear ;
edit3.Clear ;
edit7.Clear ;
edit6.Clear ;
end;






procedure TfrmBlagajna.BitBtn4Click(Sender: TObject);
begin
frmIzbor.show;
end;

procedure TfrmBlagajna.FormKeyUp(Sender: TObject; var Key: Word;

  Shift: TShiftState);
  var
  zbir : double;
  racun : integer;
begin
if key = VK_F4 then begin
frmIzbor.show;
end;
if key = VK_F2 then begin
table1.Delete;
query2.active := false;
query2.active := true;
zbir := query2sumofukupno.Value ;
edit4.Text := floattostr(zbir);
edit4.Text := (Format('%f', [zbir]));
frmunoszaliha.table1.Active := false;
frmunoszaliha.table1.Active :=  true;
frmunoszaliha.table1.Edit;
frmunoszaliha.table1kolicina.Value := strtofloat(edit6.text) + dbgrid1.Fields[2].asfloat;
frmunoszaliha.table1.Post ;
frmunoszaliha.table1.Active := false;
frmunoszaliha.table1.Active :=  true;
edit6.Text := floattostr(frmunoszaliha.table1kolicina.value);

end;
if key = VK_F3 then begin
FRMKUSUR.SHOW;

table1.Active := false;

table1.Active := true;
query3.Active := false;
query3.Active := true;

  racun := query3maxofartikliid.AsInteger;
with BatchMove1 do //poèetak prijenosa baze
begin
Source := table1;
Destination := Table3;
Mode := batAppend;
Execute;

frmkusur.Caption := (IntToStr(MovedCount) + ' artikla je obracunato');
end;
end;
end;

end.

