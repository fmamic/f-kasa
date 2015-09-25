unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, DB, ADODB, Grids, DBGrids, Unit11, Unit14;

type
  THackDBGrid = Class(TCustomDBGrid);
  
  TForm6 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Button3: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    suma : Double;
    FisOk : Boolean;
    FpostotakSelected : Double;
    FnacinSelected : String;
    FvrstaSelected : String;

  public
    { Public declarations }
    property isOk : Boolean read FisOk write FisOk;
    property postotakSelected : Double read FpostotakSelected write FpostotakSelected;
    property nacinSelected : String read FnacinSelected write FnacinSelected;
    property vrstaSelected : String read FvrstaSelected write FvrstaSelected;

  end;

  function IsNumeric(sBuffer : String) : Boolean;

var
  Form6: TForm6;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm6.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DiscountName AS Ime, DiscountPercentage AS Pos, DiscountTypeName AS Vrsta FROM Discount');
      Open;
    end;

  Edit1.Text := '';
  DBGrid1.Columns[0].Width := 100;
  DBGrid1.Columns[0].Width := 30;
  DBGrid1.Columns[0].Width := 100;
  Label4.Caption := Format('%.2f', [Form2.ssuma]);
end;

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
procedure TForm6.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if IsNumeric(Edit1.Text) then
    suma := Form2.ssuma - StrToFloat(Edit1.Text);
  Label6.Caption := Format('%.2f', [suma]);

  if Edit1.Text = '' then
    suma := 0;
  Label6.Caption := Format('%.2f', [suma]);

end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  FisOk := true;
  FpostotakSelected := StrToFloat(DBGrid1.DataSource.DataSet.Fields[1].Value);
  FnacinSelected := DBGrid1.DataSource.DataSet.Fields[0].Value;
  FvrstaSelected := DBGrid1.DataSource.DataSet.Fields[2].Value;
  Form6.Close;
end;

procedure TForm6.FormCreate(Sender: TObject);
var
  line : String;
  dir : String;

begin
  EnableMenuItem(GetSystemMenu(Form6.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);

  dir := GetCurrentDir;
  line := 'Provider=MSDASQL.1;Persist Security Info=False;Extended '
  + 'Properties="DBQ=' + dir + '\Kasa.mdb;DefaultDir=' + dir + ';'
  + 'Driver={Driver do Microsoft Access (*.mdb)};DriverId=25;FIL=MS Access;FILEDSN=' + dir
  + '\connection.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTransactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"';

  ADOConnection1.ConnectionString := line;
  FisOk := false;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  FisOk := false;
  Form6.Close;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  try
    Form11.ShowModal;
  finally
    Edit1.SetFocus;
  end;
end;


procedure TForm6.Button3Click(Sender: TObject);
begin
  try
    Form14.ShowModal;
  finally
    Edit1.SetFocus;
  end;
end;

procedure TForm6.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Form6.Button1Click(sender);

  if Key = VK_ESCAPE then
    Form6.Close;
end;

procedure TForm6.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Edit1.SetFocus;

  if Key = VK_ESCAPE then
    Form6.Close;
end;

procedure TForm6.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

end.
