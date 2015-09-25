unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Mask, DBCtrls;

type
  TArtikli = class(TForm)
    DataArtikli: TDataSource;
    ADOartikli: TADOTable;
    ADOartikliItem_ID: TWideStringField;
    ADOartikliItem_Name: TWideStringField;
    ADOartikliItem_Price: TFloatField;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
 //   procedure trazi(Sender: TObject); 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Artikli: TArtikli;

implementation
uses Unit2, unit3, Unitzakljuci, Total;
{$R *.dfm}

procedure TArtikli.Button1Click(Sender: TObject);
begin
//Dbgrid1.DataSource :=Datasourceracuniupit;
//ADOQueryracuni.Close;
//  ADOQueryracuni.SQL.Clear;
//  ADOQueryracuni.SQL.Add('SELECT Item_ID,Item_Name,Item_Measure,Item_Price,Vat_rate FROM Items');
//  ADOQueryracuni.SQL.Add('WHERE Item_Name =' + QuotedStr(edit1.Text));
//  ADOQueryracuni.Open;
end;

end.
