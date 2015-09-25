unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB;

type
  TForm13 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateTimePicker1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Fdatum : String;
    Fpolog : String;

  public
    { Public declarations }
    property datum : String read Fdatum write Fdatum;
    property polog : String read Fpolog write Fpolog;
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

function IsNumeric(sBuffer : String) : Boolean;

var
  i : Integer;

  begin
    if sBuffer = '' then begin
      Result := False;
    exit;
  end;

  Result := True;

  for i := 1 to Length(sBuffer) do begin
    if (NOT (sBuffer[i] in ['0'..'9'])) and (sBuffer[i] <> ',') then begin
      Result := False;
    exit;
  end;
end;
end;

procedure TForm13.Button1Click(Sender: TObject);
var
  provjera : Boolean;

begin
  provjera := false;

   Fdatum := FormatDateTime('d/m/yyyy', DateTimePicker1.Date);
   if IsNumeric(Edit1.Text) then
   begin
    Fpolog := Edit1.Text;
   end;

   with ADOQuery1 do
   begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM CashDeposit WHERE DateFrom=' + QuotedStr(Fdatum));
    Open;
   end;

   if DataSource1.DataSet.Fields[0].IsNull = true then
   begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO CashDeposit VALUES (' + QuotedStr(Fdatum)+ ',' + Fpolog + ')');
      ExecSQL;
    end;
   end
   else
   begin
    provjera := true;
    ShowMessage('Polog je veæ upisan za datum ' + Fdatum);
   end;

  if provjera = false then
  begin
    Edit1.Text := '';
    ADOQuery1.Close;
    Form13.Close;
  end;

end;

procedure TForm13.FormCreate(Sender: TObject);
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

  EnableMenuItem(GetSystemMenu(Form13.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  Edit1.Text := '';
  Form13.Close;
end;

procedure TForm13.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Form13.Button2Click(sender);
end;

procedure TForm13.DateTimePicker1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Form13.Button2Click(sender);
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date := Date;
end;

end.
