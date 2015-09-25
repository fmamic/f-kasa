unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables;

type
  TfrmIzbor = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Table1ArtikliID: TFloatField;
    Table1Sifra: TFloatField;
    Table1Artikal: TStringField;
    Table1Jedinicamere: TStringField;
    Table1Cena: TFloatField;
    Table1Ukupno: TFloatField;
    Table1Radnik: TStringField;
    Table1Datum: TDateField;
    Table1Kolicina: TFloatField;
    Table1Pdv: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIzbor: TfrmIzbor;

implementation

uses Unit2;

{$R *.DFM}

procedure TfrmIzbor.FormActivate(Sender: TObject);
begin
table1.Active := true;
end;

procedure TfrmIzbor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.Active := false;
end;

procedure TfrmIzbor.Edit1Change(Sender: TObject);
begin
Table1.Filter := ('[artikal]=' + QuotedStr(Edit1.Text+'*'));
end;

procedure TfrmIzbor.DBGrid1CellClick(Column: TColumn);
begin
frmblagajna.OnClose := self.FormClose ;
frmblagajna.OnActivate := self.FormActivate;
FRMBLAGAJNA.ComboBox1.Text  := dbgrid1.Fields[1].asstring;
FRMBLAGAJNA.EDIT1.Text  := dbgrid1.Fields[0].asstring;
FRMBLAGAJNA.EDIT3.Text  := dbgrid1.Fields[3].asstring;
FRMBLAGAJNA.EDIT7.Text  := dbgrid1.Fields[2].asstring;
FRMBLAGAJNA.EDIT6.Text  := dbgrid1.Fields[4].asstring;
FRMBLAGAJNA.EDIT2.SetFocus;
FRMIZBOR.CLOSE;
frmblagajna.OnClose := self.FormClose ;
frmblagajna.OnActivate := self.FormActivate;
 

end;

end.
