unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmLogin = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query1LogID: TFloatField;
    Query1Sifra: TStringField;
    Query1User: TStringField;
    Query1Pasword: TStringField;
    Query1Nazivfirme: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses Unit1, Unit2;

{$R *.DFM}



procedure TfrmLogin.BitBtn1Click(Sender: TObject);
begin
Query1.Active := false;
Query1.Filter :=  'User =' + QuotedStr(edit1.Text ) + ' and ' + 'Pasword =' + quotedstr(edit2.text);
Query1.Active := true;
if query1.RecordCount > 0 then begin

frmMeni.show;
frmmeni.StatusBar1.Panels[2].text := 'Username : ' + edit1.Text ;
frmmeni.StatusBar1.Panels[3].text := 'Sifra : ' + query1sifra.Value ;
frmLogin.Hide ;
end
else
begin
showmessage('Nije uspesna prijava.Pokusajte ponovo');
edit1.SetFocus ;
end;


end;


procedure TfrmLogin.BitBtn2Click(Sender: TObject);
begin
frmLogin.Close ;
end;

end.
