unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, DB, ADODB , ShellApi, Tlhelp32;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    XPManifest1: TXPManifest;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FName : String;
    FOIB : String;
    Fprinter : String;
  public
    { Public declarations }
    property Name : String read FName write FName;
    property OIB : String read FOIB write FOIB;
    property printer : String read Fprinter write Fprinter;
  end;


var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}
function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  with ADOQuery1 do begin
    Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM Users WHERE User=' + QuotedStr(Edit1.Text) + ' AND Pwd=' + QuotedStr(Edit2.Text));
    Open;
  end;

  if ADOQuery1.RecordCount = 0 then
    begin
      Application.MessageBox('Osoba ne postoji u bazi', 0, 0);
    end;

  if ADOQuery1.RecordCount = 1 then
    begin
      FOIB := ADOQuery1.FieldByName('OIB').AsString;
      FName := ADOQuery1.FieldByName('User').AsString;
      if Form2.prijava <> true then
      begin
        Form2.Show;
        Form1.Hide;
      end
      else
      begin
        Form2.nameB := FName;
        Form2.oib := FOIB;
        Form1.Close;
      end;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  KillTask('Fiska.exe');
  Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  myFile : TextFile;
  dir : String;
  line : String;
  lines : TStringList;
  texFile : TextFile;
  i : Integer;

begin
  AssignFile(myFile, 'connection.dsn');
  ReWrite(myFile);

  Write(myFile, '[ODBC]');
  WriteLn(myFile);
  Write(myFile, 'DRIVER=Driver do Microsoft Access (*.mdb)');
  WriteLn(myFile);
  Write(myFile, 'UID=admin');
  WriteLn(myFile);
  Write(myFile, 'UserCommitSync=Yes');
  WriteLn(myFile);
  Write(myFile, 'Threads=3');
  WriteLn(myFile);
  Write(myFile, 'SafeTransactions=0');
  WriteLn(myFile);
  Write(myFile, 'PageTimeout=5');
  WriteLn(myFile);
  Write(myFile, 'MaxScanRows=8');
  WriteLn(myFile);
  Write(myFile, 'MaxBufferSize=2048');
  WriteLn(myFile);
  Write(myFile, 'FIL=MS Access');
  WriteLn(myFile);
  Write(myFile, 'DriverId=25');
  WriteLn(myFile);
  dir := GetCurrentDir;
  Write(myFile, 'DefaultDir=' + dir);
  WriteLn(myFile);
  Write(myFile, 'DBQ=' + dir + '\Kasa.mdb');
  WriteLn(myFile);
  CloseFile(myFile);

  line := 'Provider=MSDASQL.1;Persist Security Info=False;Extended '
  + 'Properties="DBQ=' + dir + '\Kasa.mdb;DefaultDir=' + dir + ';'
  + 'Driver={Driver do Microsoft Access (*.mdb)};DriverId=25;FIL=MS Access;FILEDSN=' + dir
  + '\connection.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTransactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"';

  ADOConnection1.ConnectionString := line;

  DeleteFile('Backup\KasaBackup1.mdb');
  CopyFile('Kasa.mdb', 'Backup\KasaBackup1.mdb', true);

  while FileExists('response.txt') do
  begin
    DeleteFile('response.txt');
  end;

  AssignFile(texFile, 'config.xml');
  Reset(texFile);

  lines := TStringList.Create;
  while not Eof(texFile) do
  begin
    ReadLn(texFile, line);
    lines.Add(line);
  end;

  CloseFile(texFile);

  AssignFile(myFile, 'config.xml');
  ReWrite(myFile);

  for i := 0 to lines.Count - 1 do
  begin
    if i = 19 then
    begin
      Write(myFile, '  <CertificateFile>' + dir + '\racuni\fiskal1.pfx</CertificateFile>');
      WriteLn(myFile);
    end;

    if i = 21 then
    begin
      Write(myFile, '  <RequestFile>' + dir + '\Racun.txt</RequestFile>');
      WriteLn(myFile);
    end;

    if i = 22 then
    begin
      Write(myFile, '  <ResponseFile>' + dir + '\response.txt</ResponseFile>');
      WriteLn(myFile);
    end;

    if i = 24 then
    begin
      Write(myFile, '  <LogFolder>' + dir + '\racuni</LogFolder>');
      WriteLn(myFile);
    end;                           

    if (i <> 19) and (i <> 21) and (i <> 22) and (i <> 24) then
    begin
      Write(myFile, lines[i]);
      WriteLn(myFile);
    end;

  end;

  CloseFile(myFile);

  lines.Free;

  ShellExecute(Handle, 'open', PChar('Fiska'), PChar('Fiska.exe'), nil, SW_SHOW);

end;

end.
