unit Storniranje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ComCtrls;

type
   THackDBGrid = Class(TCustomDBGrid);
   
  TForm10 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
    FidStorno : Double;
    Fprovjera : Boolean;

  public
    { Public declarations }
    property idStorno : Double read FidStorno write FidStorno;
    property provjera : Boolean read Fprovjera write Fprovjera;
  end;

var
  Form10: TForm10;

implementation

uses DateUtils, Unit2;

{$R *.dfm}

procedure TForm10.FormShow(Sender: TObject);
var
  date : String;
  date2 : String;

begin
  provjera := false;
  date := FormatDateTime('d/m/yyyy', Now);
  date2 := FormatDateTime('dd/mm/yyyy', Now);
  Label2.Caption := Form2.nameB;
  DBGrid1.SetFocus;
  DateTimePicker1.Date := Now;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Receipt_ID, Receipt_Ammount, Receipt_PaymentID FROM Receipts WHERE Receipt_Date LIKE ' + QuotedStr(date +'%') );
    Open;
  end;

  if DataSource1.DataSet.Fields[0].IsNull = true then
  begin
     with ADOQuery1 do
     begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Receipt_ID, Receipt_Ammount, Receipt_PaymentID FROM Receipts WHERE Receipt_Date LIKE ' + QuotedStr(date2 +'%') );
      Open;
    end;
  end;

  if DataSource1.DataSet.Fields[0].IsNull = false then
  begin
    DBGrid1.Columns[0].Width := 60;
    DBGrid1.Columns[1].Width := 90;
    DBGrid1.Columns[2].Width := 120;
  end;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
  provjera := false;
  Form10.Close;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
  provjera := true;
  if DBGrid1.DataSource.DataSet.Fields[0].IsNull = false then
    FidStorno := DBGrid1.DataSource.DataSet.Fields[0].Value
  else
    FidStorno := 0;
    
  Form10.Close;
end;

procedure TForm10.FormCreate(Sender: TObject);
var
  line : String;
  dir : String;
  
begin
  Fprovjera := false;
  FidStorno := 0;
  dir := GetCurrentDir;
  line := 'Provider=MSDASQL.1;Persist Security Info=False;Extended '
  + 'Properties="DBQ=' + dir + '\Kasa.mdb;DefaultDir=' + dir + ';'
  + 'Driver={Driver do Microsoft Access (*.mdb)};DriverId=25;FIL=MS Access;FILEDSN=' + dir
  + '\connection.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTransactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"';

  ADOConnection1.ConnectionString := line;

  EnableMenuItem(GetSystemMenu(Form10.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

procedure TForm10.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Form10.Button1Click(sender);

  if Key = VK_ESCAPE then
    Form10.Button2Click(sender);

end;

procedure TForm10.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with THackDBGrid(Sender) do begin
     if DataLink.ActiveRecord = Row - 1 then begin
        Canvas.Brush.Color := clMoneyGreen;
        Canvas.Font.Color := clBlack;
     end
     else begin
       Canvas.Brush.Color := clInfoBk;
       Canvas.Font.Color := clBlack;
     end;
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TForm10.Button3Click(Sender: TObject);
begin
  provjera := false;
  Label2.Caption := Form2.nameB;
  DBGrid1.SetFocus;           
  DateTimePicker1.Date := Now;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Receipt_ID, Receipt_Ammount, Receipt_PaymentID FROM Receipts');
    Open;
  end;

  if DataSource1.DataSet.Fields[0].IsNull = true then
  begin
     with ADOQuery1 do
     begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Receipt_ID, Receipt_Ammount, Receipt_PaymentID FROM Receipts');
      Open;
    end;
  end;

  if DataSource1.DataSet.Fields[0].IsNull = false then
  begin
    DBGrid1.Columns[0].Width := 60;
    DBGrid1.Columns[1].Width := 90;
    DBGrid1.Columns[2].Width := 120;
  end;
end;

procedure TForm10.DateTimePicker1Change(Sender: TObject);
var

  date : String;
  date2 : String;

begin
  provjera := false;
  date := FormatDateTime('d/m/yyyy', DateTimePicker1.Date);
  date2 := FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date);
  Label2.Caption := Form2.nameB;
  DBGrid1.SetFocus;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Receipt_ID, Receipt_Ammount, Receipt_PaymentID FROM Receipts WHERE Receipt_Date LIKE ' + QuotedStr(date +'%') );
    Open;
  end;

  if DataSource1.DataSet.Fields[0].IsNull = true then
  begin
     with ADOQuery1 do
     begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Receipt_ID, Receipt_Ammount, Receipt_PaymentID FROM Receipts WHERE Receipt_Date LIKE ' + QuotedStr(date2 +'%') );
      Open;
    end;
  end;

  if DataSource1.DataSet.Fields[0].IsNull = false then
  begin
    DBGrid1.Columns[0].Width := 60;
    DBGrid1.Columns[1].Width := 90;
    DBGrid1.Columns[2].Width := 120;
  end;

end;

end.
