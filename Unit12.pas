unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids;

type
  TForm12 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Fid : String;
    Fadresa : String;
    FsearchString : String;
    Foib : String;

  public
    { Public declarations }
    property id : String read Fid write Fid;
    property adresa : String read Fadresa write Fadresa;
    property oib : String read Foib write Foib;
    property searchString: String read FsearchString write FsearchString;
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
  if searchString <> '' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Partner_ID AS ID, Partner_Address AS Adresa, Partner_VATNumber AS OIB FROM Partners WHERE Partner_ID LIKE ' + QuotedStr(searchString + '%'));
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Partner_ID AS ID, Partner_Address AS Adresa, Partner_VATNumber AS OIB FROM Partners');
      Open;
    end;
  end;

  if DataSource1.DataSet.Fields[0].IsNull = false then
  begin
    DBGrid1.Columns[0].Width := 125;
    DBGrid1.Columns[1].Width := 124;
    DBGrid1.Columns[2].Width := 140;
  end;
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  Form12.Close;
end;

procedure TForm12.Button1Click(Sender: TObject);
begin
  if DataSource1.DataSet.Fields[0].IsNull = false then
    Fid := DataSource1.DataSet.Fields[0].Value;

  if DataSource1.DataSet.Fields[1].IsNull = false then
    Fadresa := DataSource1.DataSet.Fields[1].Value;

  if DataSource1.DataSet.Fields[2].IsNull = false then
    Foib := DataSource1.DataSet.Fields[2].Value;
  Form12.Close;
end;

procedure TForm12.FormCreate(Sender: TObject);
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

  EnableMenuItem(GetSystemMenu(Form12.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

procedure TForm12.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Form12.Button1Click(sender);

  if Key = VK_ESCAPE then
    Form12.Button2Click(sender);
end;

end.
