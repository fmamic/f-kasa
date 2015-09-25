unit Login;

interface

uses
  Windows, Messages, SysUtils,ShellApi, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TLogiranje = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ADODataSet1: TADODataSet;
    ADOupitkorisnici: TADOQuery;
    Datalogin: TDataSource;
    ADOupitkorisniciUser: TWideStringField;
    ADOupitkorisniciPwd: TWideStringField;
    ADOupitkorisniciOIB: TWideStringField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Logiranje: TLogiranje;

implementation

uses Unit3, Unit2;

{$R *.dfm}

procedure TLogiranje.Button2Click(Sender: TObject);
begin
Logiranje.Close;
end;

procedure TLogiranje.Button1Click(Sender: TObject);
begin
// Prvi nacin
//if (ADOupitkorisnici.Locate('IME, PASSWORD', [edit1.text, edit2.text])) then
//begin
  // Korisnik postoji i uneta je ispravna lozinka
//end
//else
 // ShowMessage('Neispravno korisnicko ime ili lozinka');
 // Drugi nacin
ShellExecute (Handle, 'open', PChar('c:\fiskasa\fiska\fiska.exe'), PChar('c:\fiskasa\Fiska\fiska.exe'), nil, SW_SHOW); 
Adoupitkorisnici.Open;
if (ADOupitkorisnici.Locate('User',Edit1.Text,[loPartialKey])) then
begin
  // Korisnik postoji, proveri mu lozinku
  if (ADOupitkorisnici.FieldByName('Pwd').AsString = edit2.text) then
  begin
    // lozinka je ispravna
 Formakase.Show;
  end
  else
    ShowMessage('Neispravna lozinka');
end
else
ShowMessage('Korisnik sa tim imenom ne postoji');
end;

end.
