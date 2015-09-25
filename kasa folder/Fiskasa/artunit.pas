unit artunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls;

type
  TFormaArtikli = class(TForm)
    ADOArt: TADOTable;
    DataArt: TDataSource;
    DBGrid1: TDBGrid;
    ADOArtArtikliID: TFloatField;
    ADOArtSifra: TFloatField;
    ADOArtArtikli: TWideStringField;
    ADOArtJedinicamijere: TFloatField;
    ADOArtCijena: TFloatField;
    ADOArtUkupno: TFloatField;
    ADOArtOIB: TFloatField;
    ADOArtDatum: TDateTimeField;
    ADOArtKolicina: TFloatField;
    ADOArtPDV: TFloatField;
    ADOArtPNP: TFloatField;
    ADOArtZKI: TWideStringField;
    ADOArtJIR: TWideStringField;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaArtikli: TFormaArtikli;

implementation

{$R *.dfm}

end.
