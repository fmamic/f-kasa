unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, shellapi,
  Dialogs, StdCtrls, Grids, DBGrids, Printers, DB, ADODB, NacinPlacanja, WinSpool,
  ExtCtrls;

type
  THackDBGrid = Class(TCustomDBGrid);
  
  TForm5 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox4: TGroupBox;
    ComboBox2: TComboBox;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Edit5: TEdit;
    Label4: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    GroupBox6: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox7: TGroupBox;
    Edit8: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit9: TEdit;
    GroupBox8: TGroupBox;
    ComboBox3: TComboBox;
    GroupBox9: TGroupBox;
    DBGrid2: TDBGrid;
    Button5: TButton;
    Button6: TButton;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    GroupBox10: TGroupBox;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    Button7: TButton;
    CheckBox3: TCheckBox;
    GroupBox11: TGroupBox;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    FisCheckdplus : Boolean;
    FisCheckdminus : Boolean;
    FiznosNaknade : Double;
    Fprinter : String;
    Femulacija : Boolean;
    FvrstaRacuna : String;
    FposProstor  : String;
    FnaplatniUr : String;
    FhrSlova : String;
    FposTip : String;
    FChange : String;
    FprintType : String;

  public
    { Public declarations }
    property vrstaRacuna : String read FvrstaRacuna write FvrstaRacuna;
    property emulacija : Boolean read Femulacija write Femulacija;
    property printer : String read Fprinter write Fprinter;
    property iznosNaknade : Double read FiznosNaknade write FiznosNaknade;
    property isCheckdplus : Boolean read FisCheckdplus write FisCheckdplus;
    property isCheckdminus : Boolean read FisCheckdminus write FisCheckdminus;
    property posProstor : String read FposProstor write FposProstor;
    property naplatniUr : String read FnaplatniUr write FnaplatniUr;
    property hrSlova : String read FhrSlova write FhrSlova;
    property posTip : String read FposTip write FposTip;
    property change : String read FChange write FChange;
    property printType : String read FprintType write FprintType;
  end;

  function pretvoriHrv(line : String) : String;
  function pretvoriEng(line : String) : String;
  function IsNumeric(sBuffer : String) : Boolean;
  procedure PrintOnDotMatrix(printerName : String; lines : TStringList);
  procedure PrintDocument(const documentToPrint, printerCombo : string);

  var
  Form5: TForm5;

implementation

uses Unit13;

{$R *.dfm}
function pretvoriEng(line : String) : String;
begin
  line := StringReplace(line, 'Ž', 'Z', [rfReplaceAll]);
  line := StringReplace(line, 'Š', 'S', [rfReplaceAll]);
  line := StringReplace(line, 'Ð', 'D', [rfReplaceAll]);
  line := StringReplace(line, 'Æ', 'C', [rfReplaceAll]);
  line := StringReplace(line, 'È', 'C', [rfReplaceAll]);
  line := StringReplace(line, 'ž', 'z', [rfReplaceAll]);
  line := StringReplace(line, 'š', 's', [rfReplaceAll]);
  line := StringReplace(line, 'æ', 'c', [rfReplaceAll]);
  line := StringReplace(line, 'è', 'c', [rfReplaceAll]);
  line := StringReplace(line, 'ð', 'd', [rfReplaceAll]);
  Result := line;
end;

function pretvoriHrv(line : String) : String;
begin
  line := StringReplace(line, 'Ž', '@', [rfReplaceAll]);
  line := StringReplace(line, 'Š', '[', [rfReplaceAll]);
  line := StringReplace(line, 'Ð', '\', [rfReplaceAll]);
  line := StringReplace(line, 'Æ', ']', [rfReplaceAll]);
  line := StringReplace(line, 'È', '^', [rfReplaceAll]);
  line := StringReplace(line, 'ž', '`', [rfReplaceAll]);
  line := StringReplace(line, 'š', '{', [rfReplaceAll]);
  line := StringReplace(line, 'æ', '}', [rfReplaceAll]);
  line := StringReplace(line, 'è', '~', [rfReplaceAll]);
  line := StringReplace(line, 'ð', char(124), [rfReplaceAll]);
  Result := line;
end;

procedure PrintDocument(const documentToPrint, printerCombo : string) ;

var
  printCommand : string;
  printerInfo : string;
  Device, Driver, Port: array[0..255] of Char;
  hDeviceMode: THandle;
  index : Integer;

begin

  index := printer.Printers.IndexOf(printerCombo);

  if Printer.PrinterIndex = index then
  begin
    printCommand := 'print';
    printerInfo := '';
  end
  else
  begin
    printCommand := 'printto';
    Printer.PrinterIndex := index;
    Printer.GetPrinter(Device, Driver, Port, hDeviceMode) ;
    printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
  end;

  ShellExecute(Application.Handle, PChar(printCommand), PChar(documentToPrint), PChar(printerInfo), nil, SW_HIDE) ;
end;

procedure PrintOnDotMatrix(printerName : String; lines : TStringList);
var
  Handle: THandle;
  N: DWORD;
  DocInfo1: TDocInfo1;
  i : Integer;
  s : string;

begin
  if not OpenPrinter(PChar(printerName), Handle, nil) then begin
    ShowMessage('Printer «DotMatrix» not found.');
    Exit;
  end;

  with DocInfo1 do begin
    pDocName := PChar('Document Name');
    pOutputFile := nil;
    pDataType := 'RAW';
  end;

  StartDocPrinter(Handle, 1, @DocInfo1);
  WritePrinter(Handle, PChar(s), Length(s), N);

  if Form5.hrSlova = '1' then
  begin
    for i := 0 to lines.Count - 1 do
    begin
      s := pretvoriHrv(lines[i]);
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;
  end
  else
  begin
    for i := 0 to lines.Count - 1 do
    begin
      s := pretvoriEng(lines[i]);
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;
  end;

  for i:= 0 to 10 do
  begin
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end ;

  if Form5.emulacija = true then
  begin
    s := #27 + #105;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #27 + 'p' + #0 + #5 + #20;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end
  else
  begin
    s := #27 + 'd1';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #28;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;

  EndPagePrinter(Handle);
  EndDocPrinter(Handle);
  ClosePrinter(Handle);

end;


procedure TForm5.Button2Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit6.Text := '';
  Edit7.Text := '';
  Edit8.Text := '';
  Edit9.Text := '';

  Form5.Close;
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


procedure TForm5.Button1Click(Sender: TObject);
begin

  if RadioButton6.Checked = true then
    FposTip := '0';

  if RadioButton7.Checked = true then
    FposTip := '1';

  if RadioButton11.Checked = true then
    FposTip := '2';

  if CheckBox3.Checked = true then
    FChange := '1';

  if CheckBox3.Checked = false then
    FChange := '0';

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(FChange) + ' WHERE Key=' + QuotedStr('PriceChange'));
    ExecSQL;
  end;

  if RadioButton8.Checked = true then
    FprintType := '0'
  else
    FprintType := '1';

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(FprintType) + ' WHERE Key=' + QuotedStr('PrintType'));
    ExecSQL;
  end;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(FposTip) + ' WHERE Key=' + QuotedStr('POSType'));
    ExecSQL;
  end;

  if ComboBox3.Text = 'sa HR slovima' then
    FhrSlova := '1'
  else
    FhrSlova := '2';

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(FhrSlova) + ' WHERE Key=' + QuotedStr('Hrslova'));
    ExecSQL;
  end;


  if RadioButton1.Checked = true then
  begin
    Femulacija := true;

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr('EPSON') + ' WHERE Key=' + QuotedStr('PrinterType'));
      ExecSQL;
    end;
  end
  else
  begin
    Femulacija := false;

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr('STAR') + ' WHERE Key=' + QuotedStr('PrinterType'));
      ExecSQL;
    end;
  end;

  if RadioButton3.Checked = true then
  begin
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr('1') + ' WHERE Key=' + QuotedStr('R1'));
      ExecSQL;
    end;
    FvrstaRacuna := '1';
  end;

  if RadioButton4.Checked = true then
  begin
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr('2') + ' WHERE Key=' + QuotedStr('R1'));
      ExecSQL;
    end;
    FvrstaRacuna := '2';
  end;

  if RadioButton5.Checked = true then
  begin
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr('3') + ' WHERE Key=' + QuotedStr('R1'));
      ExecSQL;
    end;
    FvrstaRacuna := '3';
  end;

  if RadioButton10.Checked = true then
  begin
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr('4') + ' WHERE Key=' + QuotedStr('R1'));
      ExecSQL;
    end;
    FvrstaRacuna := '4';
  end;

  if CheckBox1.Checked then
    isCheckdplus := true
  else
    isCheckdplus := false;

  if CheckBox2.Checked then
    isCheckdminus := true
  else
    isCheckdminus := false;

  if IsNumeric(Edit1.Text) = true then
  begin
    FiznosNaknade := StrToFloat(Edit1.Text);
  end;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(ComboBox1.Text) + ' WHERE Key=' + QuotedStr('PrinterName'));
    ExecSQL;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(ComboBox2.Text) + ' WHERE Key=' + QuotedStr('POSName'));
    ExecSQL;
  end;

  if Edit2.Text <> '' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(Edit2.Text) + ' WHERE Key=' + QuotedStr('TitleRow1'));
      ExecSQL;
    end;
  end;

  if Edit3.Text <> '' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(Edit3.Text) + ' WHERE Key=' + QuotedStr('TitleRow2'));
      ExecSQL;
    end;
  end;

  if Edit4.Text <> '' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(Edit4.Text) + ' WHERE Key=' + QuotedStr('TitleRow3'));
      ExecSQL;
    end;
  end;

  if (Edit5.Text <> '') and (Length(Edit5.Text) = 11) then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(Edit5.Text) + ' WHERE Key=' + QuotedStr('OIB'));
      ExecSQL;
    end;
  end;

  if Edit6.Text <> '' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(Edit6.Text) + ' WHERE Key=' + QuotedStr('FooterRow1'));
      ExecSQL;
    end;
  end;

  if Edit7.Text <> '' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(Edit7.Text) + ' WHERE Key=' + QuotedStr('FooterRow2'));
      ExecSQL;
    end;
  end;

  if Edit8.Text <> '' then
  begin
    FposProstor := Edit8.Text;
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(Edit8.Text) + ' WHERE Key=' + QuotedStr('PoslovniProstor'));
      ExecSQL;
    end;
  end;



  if Edit9.Text <> '' then
  begin
    FnaplatniUr := Edit9.Text;
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE Settings SET ValueString=' + QuotedStr(Edit9.Text) + ' WHERE Key=' + QuotedStr('NaplatniUr'));
      ExecSQL;
    end;
  end;

  printer := ComboBox1.Text;

  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit6.Text := '';
  Edit7.Text := '';
  Edit8.Text := '';
  Edit9.Text := '';
    
  Form5.Close;
end;

procedure TForm5.FormCreate(Sender: TObject);
var
  dir : String;
  line : String;
  lista : TStrings;
  i : Integer;
  
begin

  dir := GetCurrentDir;
  line := 'Provider=MSDASQL.1;Persist Security Info=False;Extended '
  + 'Properties="DBQ=' + dir + '\Kasa.mdb;DefaultDir=' + dir + ';'
  + 'Driver={Driver do Microsoft Access (*.mdb)};DriverId=25;FIL=MS Access;FILEDSN=' + dir
  + '\connection.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTransactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"';

  ADOConnection1.ConnectionString := line;

  EnableMenuItem(GetSystemMenu(Form5.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);

  ComboBox3.Items.Add('sa HR slovima');
  ComboBox3.Items.Add('bez HR slova');

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PriceChange'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].IsNull = false then
    FChange := DataSource2.DataSet.Fields[0].Value;

  if FChange = '0' then
    CheckBox3.Checked := false;

  if FChange = '1' then
    CheckBox3.Checked := true;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('Hrslova'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].IsNull = false then
    FhrSlova := DataSource2.DataSet.Fields[0].Value;

  if FhrSlova = '1' then
    ComboBox3.Text := 'sa HR slovima'
  else
    ComboBox3.Text := 'bez HR slova';

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('POSType'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].IsNull = false then
    FposTip := DataSource2.DataSet.Fields[0].Value;

  if FposTip = '0' then
    RadioButton6.Checked := true;

  if FposTip = '1' then
    RadioButton7.Checked := true;

  if FposTip = '2' then
    RadioButton11.Checked := true;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PackPrice'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].IsNull = false then
    FiznosNaknade := DataSource2.DataSet.Fields[0].Value;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PoslovniProstor'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].IsNull = false then
  begin
    FposProstor  := DataSource2.DataSet.Fields[0].Value;
  end
  else
    FposProstor  := '';

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('NaplatniUr'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].IsNull = false then
  begin
    FnaplatniUr := DataSource2.DataSet.Fields[0].Value;
  end
  else
    FnaplatniUr := '';

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('R1'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].Value = '1' then
  begin
    RadioButton3.Checked := true;
    FvrstaRacuna := '1';
  end;

  if DataSource2.DataSet.Fields[0].Value = '2' then
  begin
    RadioButton4.Checked := true;
    FvrstaRacuna := '2';
  end;

  if DataSource2.DataSet.Fields[0].Value = '3' then
  begin
    RadioButton5.Checked := true;
    FvrstaRacuna := '3';
  end;

  if DataSource2.DataSet.Fields[0].Value = '4' then
  begin
    RadioButton10.Checked := true;
    FvrstaRacuna := '4';
  end;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrinterType'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].Value = 'STAR' then
  begin
    emulacija := false;
    RadioButton2.Checked := true;
  end
  else
  begin
    emulacija := true;
    RadioButton1.Checked := true;
  end;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrinterName'));
    Open;
  end;

  if DataSource2.DataSet.Fields[0].IsNull <> true then
  begin
    ComboBox1.Text := DataSource2.DataSet.Fields[0].Value;
    printer := DataSource2.DataSet.Fields[0].Value;
  end
  else
  begin
    ComboBox1.Text := 'Ne postoji';
    printer := 'Ne postoji';
  end;

  lista := Printers.Printer.Printers;

  for i := 0 to lista.Count -1 do
  begin
    ComboBox1.Items.Add(Printers.Printer.Printers[i]);
  end;

  for i := 0 to 20 do
  begin
    ComboBox2.Items.Add('Kasa ' + IntToStr(i+1));
  end;

  with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DiscountName AS Ime, DiscountPercentage AS Pos, DiscountTypeName AS Vrsta FROM Discount');
      Open;
  end;

  //postavljanje checkbox unit5
  Form5.isCheckdplus := true;
  Form5.isCheckdminus := true;
end;

procedure TForm5.FormShow(Sender: TObject);

begin

  if FhrSlova = '1' then
    ComboBox3.Text := 'sa HR slovima'
  else
    ComboBox3.Text := 'bez HR slova';

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PackPrice'));
    Open;
  end;

  if DataSource1.DataSet.Fields[0].IsNull <> true then
    Edit1.Text := FloatToStr(DataSource1.DataSet.Fields[0].Value);

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
    Open;
  end;

  if DataSource1.DataSet.Fields[0].IsNull <> true then
  begin
    if DataSource1.DataSet.Fields[0].Value = '0' then
      RadioButton8.Checked := true
    else
      RadioButton9.Checked := true;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('POSName'));
    Open;
  end;

  if DataSource1.DataSet.Fields[0].IsNull <> true then
    ComboBox2.Text := DataSource1.DataSet.Fields[0].Value;

  FiznosNaknade := 0;

  with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DiscountName AS Ime, DiscountPercentage AS Pos, DiscountTypeName AS Vrsta FROM Discount');
      Open;
    end;

  DBGrid1.Columns[0].Width := 87;
  DBGrid1.Columns[1].Width := 20;
  DBGrid1.Columns[2].Width := 110;

      with ADOQuery3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Ammount AS Kolièina , DateFrom AS Datum FROM CashDeposit');
      Open;
    end;

    DBGrid2.Columns[0].Width := 80;
    DBGrid2.Columns[1].Width := 127;

end;

procedure TForm5.Button3Click(Sender: TObject);
begin
 try
  Form9.ShowModal;
 finally
  if (Form9.nacin <> '') then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Discount(DiscountName, DiscountPercentage, DiscountTypeName) VALUES('
      + QuotedStr(Form9.nacin)
      + ',' + StringReplace(Format('%.2f', [Form9.postotak]), ',', '.', [rfReplaceAll, rfIgnoreCase])
      + ',' + QuotedStr(Form9.vrsta) + ')' );
      ExecSQL;
    end;
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DiscountName AS Ime, DiscountPercentage AS Pos, DiscountTypeName AS Vrsta FROM Discount');
      Open;
    end;

    DBGrid1.Columns[0].Width := 87;
    DBGrid1.Columns[1].Width := 20;
    DBGrid1.Columns[2].Width := 110;

  end;
  end;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin

  if DBGrid1.DataSource.DataSet.Fields[0].IsNull <> true then
  begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM Discount WHERE DiscountName=' + QuotedStr(DBGrid1.DataSource.DataSet.Fields[0].Value));
    ExecSQL
  end;
  end;

  with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DiscountName AS Ime, DiscountPercentage AS Pos, DiscountTypeName AS Vrsta FROM Discount');
      Open;
    end;

    DBGrid1.Columns[0].Width := 87;
    DBGrid1.Columns[1].Width := 20;
    DBGrid1.Columns[2].Width := 110;

end;

procedure TForm5.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    Edit5.Text := '';
    Edit6.Text := '';
    Edit7.Text := '';
    Edit8.Text := '';
    Edit9.Text := '';
    Form5.Close;
  end;
end;

procedure TForm5.Button5Click(Sender: TObject);
begin
    Form13.ShowModal;
    with ADOQuery3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Ammount AS Kolièina , DateFrom AS Datum FROM CashDeposit');
      Open;
    end;

    DBGrid2.Columns[0].Width := 80;
    DBGrid2.Columns[1].Width := 127;

end;

procedure TForm5.Button6Click(Sender: TObject);
begin
  if DBGrid2.DataSource.DataSet.Fields[0].IsNull <> true then
  begin
  with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM CashDeposit WHERE DateFrom=' + QuotedStr(DBGrid2.DataSource.DataSet.Fields[1].Value));
      ExecSQL;
    end;
  end;

  with ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Ammount AS Kolièina , DateFrom AS Datum FROM CashDeposit');
    Open;
  end;

  DBGrid2.Columns[0].Width := 80;
  DBGrid2.Columns[1].Width := 127;
end;

procedure TForm5.Button7Click(Sender: TObject);
var
  lines : TStringList;
  lines2 : TStringList;
  title1 : String;
  title2 : String;
  title3 : String;
  oibs : String;
  datum : String;
  polog : String;
  myFile : TextFile;
  i : Integer;
  index : Integer;
  
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('TitleRow1'));
    Open;
  end;
  title1 := DataSource1.DataSet.Fields[0].Value;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('TitleRow2'));
    Open;
  end;
  title2 := DataSource1.DataSet.Fields[0].Value;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('TitleRow3'));
    Open;
  end;
  title3 := DataSource1.DataSet.Fields[0].Value;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
    Open;
  end;

  if DataSource1.DataSet.Fields[0].IsNull <> true then
    FprintType := DataSource1.DataSet.Fields[0].Value;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
    Open;
  end;
  datum := FormatDateTime('d/m/yyyy', Now);
  oibS := DataSource1.DataSet.Fields[0].Value;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Ammount FROM CashDeposit WHERE DateFrom=' + QuotedStr(datum));
    Open;
  end;

  if DataSource1.DataSet.Fields[0].IsNull = false then
    polog := Format('%.2f', [StrToFloat(DataSource1.DataSet.Fields[0].Value)]);

  lines := TStringList.Create();
  lines2 := TStringList.Create();


  lines2.Add(title1);
  lines2.Add(title2);
  lines2.Add(title3);
  lines.Add(title1);
  lines.Add(title2);
  lines.Add(title3);
  lines2.Add('OIB : ' + oibs);
  lines2.Add('');
  lines2.Add('');
  lines.Add('OIB : ' + oibs);
  lines.Add('');
  lines.Add('');
  lines2.Add('');
  lines2.Add('Na temelju Zakona o raèunovodstvu i Pravilnika o obliku i naèinu');

  if RadioButton6.Checked = true then
    lines2.Add('voðenja knjige popisa robe u trgovini na malo donosim sljedeæu    ');

  if RadioButton7.Checked = true then
    lines2.Add('voðenja knjige popisa robe u ugostiteljskom objektu donosim sljedeæu');

  if RadioButton11.Checked = true then
    lines2.Add('voðenja knjige popisa robe u veleprodajnom objektu donosim sljedeæu');

  lines2.Add('');
  lines2.Add('                       O D L U K U');
  lines2.Add('O VISINI POLOGA GOTOVOG NOVCA ZA MANIPULIRANJE SITNIM NOVCEM U');
  lines2.Add('BLAGAJNI');
  lines2.Add('');
  lines2.Add('                        Toèka 1.');
  lines2.Add('Polog gotovog novca u blagajnu prodavaonice iznosi' + polog + ' kn');
  lines2.Add('');
  lines2.Add('                        Toèka 2.');
  lines2.Add('Odluka stupa na snagu danom donošenja.');
  lines2.Add('');
  lines2.Add('Datum : ' + datum);
  lines2.Add('');
  lines2.Add('');
  lines2.Add('');
  lines2.Add(' ___________________');
  lines2.Add('   Ovlaštena osoba');
  lines.Add('Na temelju Zakona o raèunovodstvu i Pra-');
  lines.Add('vilnika o obliku i naèinu voðenja knjige');

  if RadioButton6.Checked = true then
  begin
    lines.Add('popisa robe u trgovini na malo donosim');
    lines.Add('sljedeæu ');
  end;

  if RadioButton7.Checked = true then
  begin
    lines.Add('popisa robe u ugostiteljskom objektu');
    lines.Add('donosim sljedeæu ');
  end;

  if RadioButton11.Checked = true then
  begin
    lines.Add('popisa robe u veleprodajnom objektu');
    lines.Add('donosim sljedeæu ');
  end;
  
  lines.Add('');
  lines.Add('             O D L U K U ');
  lines.Add('   O VISINI POLOGA GOTOVOG NOVCA ZA');
  lines.Add(' MANIPULIRANJE SITNIM NOVCEM U BLAGAJNI');
  lines.Add('');
  lines.Add('              Toèka 1.');
  lines.Add('Polog gotovog novca u blagajnu prodavao-');
  lines.Add('nice iznosi ' + polog + ' kn');
  lines.Add('');
  lines.Add('              Toèka 2.');
  lines.Add('Odluka stupa na snagu danom donošenja.');
  lines.Add('');
  lines.Add('Datum : ' + datum);
  lines.Add('');
  lines.Add('');
  lines.Add('');
  lines.Add('_______________________');
  lines.Add('Ovlaštena osoba');



  if RadioButton8.Checked = true then
    PrintOnDotMatrix(ComboBox1.Text, lines)
  else
  begin

    index := Printers.printer.Printers.IndexOf(ComboBox1.Text);
    Printers.Printer.PrinterIndex := index;

    Printers.Printer.Canvas.Font.Name := 'Courier New';
    Printers.Printer.Canvas.Font.Size := 12;

    AssignPrn(myFile);
    ReWrite(myFile);

    for i := 0 to 3 do
        WriteLn(myFile, '');

    for i := 0 to lines2.Count - 1 do
    begin

      if i = 10 then
        Printers.Printer.Canvas.Font.Style := [fsBold];

      if i = 11 then
        Printers.Printer.Canvas.Font.Style := [fsBold];

      if i = 12 then
        Printers.Printer.Canvas.Font.Style := [fsBold];

      Write(myFile, '       ');
      Writeln(myFile, lines2[i]);

      Printers.Printer.Canvas.Font.Style := Printers.Printer.Canvas.Font.Style - [fsBold];
    end;

    CloseFile(myFile);

  end;

  lines2.Free;
  lines.Free;

end;

procedure TForm5.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TForm5.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
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
