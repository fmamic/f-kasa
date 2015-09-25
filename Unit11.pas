unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit12, DB, ADODB;

type
  TForm11 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Edit4: TEdit;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Fnaziv : String;
    Fadresa : String;
    Foib : String;
    
  public
    { Public declarations }
    property naziv : String read Fnaziv write Fnaziv;
    property adresa : String read Fadresa write Fadresa;
    property oib : String read Foib write Foib;

  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin
  try
    Form12.ShowModal;
  finally
    if Length(Form12.id) <> 0 then
      Edit1.Text := Form12.id;

    if Length(Form12.adresa) <> 0 then
      Edit2.Text := Form12.adresa;

    if Length(Form12.oib) <> 0 then
      Edit3.Text := Form12.oib;
  end;
end;

procedure TForm11.FormCreate(Sender: TObject);
var
  dir : String;
  line : String;

begin
  dir := GetCurrentDir;
  line := 'Provider=MSDASQL.1;Persist Security Info=False;Extended '
  + 'Properties="DBQ=' + dir + '\Kasa.mdb;DefaultDir=' + dir + ';'
  + 'Driver={Driver do Microsoft Access (*.mdb)};DriverId=25;FIL=MS Access;FILEDSN=' + dir
  + '\connection.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTransactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"';

  ADOConnection1.ConnectionString := line;

  EnableMenuItem(GetSystemMenu(Form11.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO Partners(Partner_ID, Partner_Address, Partner_VATNumber) VALUES (' + QuotedStr(Edit1.Text) + ',' + QuotedStr(Edit2.Text) + ',' + QuotedStr(Edit3.Text) + ')');
    ExecSQL;
  end;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
  Fnaziv := Edit1.Text;
  Fadresa := Edit2.Text;
  Foib := Edit3.Text;

  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';

  Form11.Close;
end;

procedure TForm11.Button4Click(Sender: TObject);
begin

  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Form11.Close;
end;

procedure TForm11.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_RETURN then
  begin
  try
    Form12.searchString := Edit4.Text;
    Form12.ShowModal;
  finally
    if Length(Form12.id) <> 0 then
      Edit1.Text := Form12.id;

    if Length(Form12.adresa) <> 0 then
      Edit2.Text := Form12.adresa;

    if Length(Form12.oib) <> 0 then
      Edit3.Text := Form12.oib;
  end;
  end;

end;

end.
