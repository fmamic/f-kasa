unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Db, DBTables, Buttons, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmUnosZaliha = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Edit4: TEdit;
    Table1: TTable;
    Table1ArtikliID: TFloatField;
    Table1Sifra: TFloatField;
    Table1Artikal: TStringField;
    Table1Cena: TFloatField;
    Table1Ukupno: TFloatField;
    Table1Radnik: TStringField;
    Table1Datum: TDateField;
    Table1Kolicina: TFloatField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit5: TEdit;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Table1Jedinicamere: TStringField;
    Edit8: TEdit;
    Label9: TLabel;
    Table1Pdv: TFloatField;
    Edit9: TEdit;
    Label10: TLabel;
    Edit10: TEdit;
    Label11: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnosZaliha: TfrmUnosZaliha;

implementation

uses Unit2;

{$R *.DFM}

procedure TfrmUnosZaliha.ComboBox1Change(Sender: TObject);
begin
table1.Active := false;
table1.Filter := ' artikal =' + QuotedStr(combobox1.Text ) ;
table1.Active := true;
edit1.Text := inttostr(table1sifra.AsInteger);
edit2.Text := inttostr(table1kolicina.asinteger);
edit3.Text := floattostr(table1cena.asfloat);
edit9.Text := floattostr(table1pdv.asfloat);
end;






procedure TfrmUnosZaliha.FormActivate(Sender: TObject);
begin
table1.Active := true;
 with  table1 do begin
    open;
    while not EOF do
    begin
    combobox1.items.add(FieldByName('Artikal').AsString);
      next;
    end;
    end;
end;

procedure TfrmUnosZaliha.RadioButton2Click(Sender: TObject);
begin
edit4.Visible := true;
edit4.Left := 168;
edit4.top := 96;
edit5.Visible := false;
edit6.Visible := false;
edit7.Visible := false;
edit8.Visible := false;
edit10.Visible := false;
label5.Visible := false;
label6.Visible := false;
label7.Visible := false;
label8.Visible := false;
label9.Visible := false;
label11.Visible := false;
edit4.SetFocus ;
end;

procedure TfrmUnosZaliha.RadioButton3Click(Sender: TObject);
begin
edit4.Visible := true;
edit5.Visible := true;
edit6.Visible := true;
edit7.Visible := true;
edit8.Visible := true;
edit10.Visible := true;
label5.Visible := true;
label6.Visible := true;
label7.Visible := true;
label8.Visible := true;
label9.Visible := true;
label11.Visible := true;
edit4.Left := 376;
edit4.top := 80;
edit4.SetFocus ;
end;

procedure TfrmUnosZaliha.RadioButton1Click(Sender: TObject);
begin
edit4.Visible := true;

edit4.Left :=  8;
edit4.top := 80;
edit5.Visible := false;
edit6.Visible := false;
edit7.Visible := false;
edit8.Visible := false;
edit10.Visible := false;
label5.Visible := false;
label6.Visible := false;
label7.Visible := false;
label8.Visible := false;
label9.Visible := false;
label11.Visible := false;
edit4.SetFocus ;
end;

procedure TfrmUnosZaliha.BitBtn1Click(Sender: TObject);
begin
table1.Active := false;
table1.Filter := ' artikal =' + QuotedStr(combobox1.Text ) ;
table1.Active := true;
table1 .Edit ;
table1kolicina.Value := strtofloat(edit2.text) + strtofloat(edit4.text);
table1 .Post  ;
  
edit1.Text := inttostr(table1sifra.AsInteger);
edit2.Text := inttostr(table1kolicina.asinteger);
edit3.Text := floattostr(table1cena.asfloat);
edit4.Clear ;
table1.Active := false;

table1.Active := true;
end;

procedure TfrmUnosZaliha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
table1.Active := false;
edit4.Visible := false;
edit5.Visible := false;
edit6.Visible := false;
edit7.Visible := false;
label5.Visible := false;
label6.Visible := false;
label7.Visible := false;
label8.Visible := false;

end;

procedure TfrmUnosZaliha.BitBtn2Click(Sender: TObject);
begin
table1.Active := false;
table1.Filter := ' artikal =' + QuotedStr(combobox1.Text ) ;
table1.Active := true;
table1 .Edit ;
table1cena.Value :=  strtofloat(edit4.text);
table1 .Post  ;
edit1.Text := inttostr(table1sifra.AsInteger);
edit2.Text := inttostr(table1kolicina.asinteger);
edit3.Text := floattostr(table1cena.asfloat);
edit4.Clear ;
table1.Active := false;

table1.Active := true;
end;







procedure TfrmUnosZaliha.BitBtn3Click(Sender: TObject);
begin
table1.Active := false;
table1.Active := true;

table1.Insert ;
table1artikal.Value := edit4.Text ;
table1sifra.Value  := strtofloat(edit5.text);
table1cena.Value :=   strtofloat(edit6.text);
table1kolicina.Value  :=   strtofloat(edit7.text);
table1jedinicamere.Value := edit8.Text ;
table1pdv.Value := strtofloat(edit9.text);
table1.Post ;

edit5.Visible := false;
edit6.Visible := false;
edit7.Visible := false;
edit8.Visible := false;
edit9.Visible := false;
edit4.Clear ;
edit5.Clear ;
edit6.Clear ;
edit7.Clear ;
edit8.Clear ;
edit9.Clear ;
label5.Visible := false;
label6.Visible := false;
label7.Visible := false;
label8.Visible := false;
label9.Visible := false;
label11.Visible := true;
 
 with  table1 do begin
    open;
    while not EOF do
    begin
    combobox1.items.add(FieldByName('Artikal').AsString);
      next;
    end;
    end;
    

end;
 



procedure TfrmUnosZaliha.Table1AfterPost(DataSet: TDataSet);
begin
table1.FlushBuffers ;
end;






end.
