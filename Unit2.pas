unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Tlhelp32, Grids, Unit18, Unit3, Unit17, Unit11, Unit14, Unit15, StdCtrls, ExtCtrls, XPMan, ComCtrls, Storniranje, Unit1, RacunData, Unit4, Unit5, Unit6, Unit7, Ambalaza, Printers, WinSpool, StrUtils ;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    HeaderControl1: THeaderControl;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    XPManifest1: TXPManifest;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Timer1: TTimer;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button5: TButton;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure HeaderControl1SectionClick(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    FsqlString : String;
    Foib : String;
    FnameB : String;
    sum : Double;
    Fkolicina : String;
    FispravnoKol : Boolean;
    FmaxRacun : Double;
    Fsuma : Double;
    Flines5 : TStringList;
    FnaknadaL : Double;

  public
    { Public declarations }
    prijava : Boolean;
    racunList : TList;
    racunListStorno : TList;
    Racun : TRacunData;


    property ssuma : Double read sum;
    property suma : Double read Fsuma write Fsuma;
    property maxRacun : Double read FmaxRacun write FmaxRacun;
    property kolicina : String read Fkolicina write Fkolicina;
    property ispravnoKol : Boolean read FispravnoKol write FispravnoKol;
    property nameB : String read FnameB write FnameB;
    property oib : String read Foib write Foib;
    property SqlString : String read FsqlString write FsqlString;
    property lines5 : TStringList read Flines5 write Flines5;
    property naknadaL : Double read FnaknadaL write FnaknadaL;

  end;

  procedure PrintOnDotMatrix(namePrinter, title1, title2, title3, date, time, oibPoslovnica, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum : String; racunList : TList);
  function pretvoriHrv(line : String) : String;
  function pretvoriEng(line : String) : String;
  function IsFileInUse(FileName: TFileName): Boolean;
  function KillTask(ExeFileName: string): Integer;
  function IsNumeric2(sBuffer : String) : Boolean;
  procedure PrintOnDotMatrix2(printerName : String; lines : TStringList);
  procedure PrintDocument(namePrinter, title1, title2, title3, date, time, oibPoslovnica, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum : String; racunList : TList);

var
  Form2: TForm2;

implementation

uses DateUtils;

{$R *.dfm}

function IsNumeric2(sBuffer : String) : Boolean;

var
  i : Integer;

  begin
    if sBuffer = '' then begin
      Result := False;
    exit;
  end;

  Result := True;

  for i := 1 to Length(sBuffer) do begin
    if (NOT (sBuffer[i] in ['0'..'9'])) then begin
      Result := False;
    exit;
  end;
end;

end;

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

function IsFileInUse(FileName: TFileName): Boolean;
var
  HFileRes: HFILE;
begin
  Result := False;
  if not FileExists(FileName) then Exit;
  HFileRes := CreateFile(PChar(FileName),
                         GENERIC_READ or GENERIC_WRITE,
                         0,
                         nil,
                         OPEN_EXISTING,
                         FILE_ATTRIBUTE_NORMAL,
                         0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;

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

procedure PrintOnDotMatrix2(printerName : String; lines : TStringList);
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

procedure PrintOnDotMatrix(namePrinter, title1, title2, title3, date, time, oibPoslovnica, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum : String; racunList : TList);
var
  Handle: THandle;
  N: DWORD;
  DocInfo1: TDocInfo1;
  i : Integer;
  s : string;
  racun : TracunData;
  lines : TStrings;
  lines2 : TStrings;
  lines3 : TStrings;
  bporez : array[0..45] of Double;
  aporez2 : array of Double;
  k : Integer;
  p : Integer;
  prolaz : Boolean;
  ukOsnovica : Double;
  ukPorez : Double;
  ukUkupno : Double;
  x : Integer;
  ukPnp : Double;
  sumNaknada : Double;
  popust : Double;
  kolNaknada : Double;

begin
  if not OpenPrinter(PChar(namePrinter), Handle, nil) then begin
    ShowMessage('Printer «DotMatrix» not found.');
    Exit;
  end;

  with DocInfo1 do begin
    pDocName := PChar('Document Name');
    pOutputFile := nil;
    pDataType := 'RAW';
  end;

  lines := TStringList.Create;
  lines2 := TStringList.Create;
  lines3 := TStringList.Create;

  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    lines.Add(racun.ID + DupeString(' ', 10 - Length(racun.ID)) + Format('%.2f', [racun.Tax]) + '%' + DupeString(' ', 14 - Length(Format('%.2f', [racun.Tax]))) + Format('%.2f', [racun.Price + racun.Naknada]) + '  ' + racun.Mjera );
    lines.Add(racun.Name + DupeString(' ', 24 - Length(racun.Name)) + Format('%.2f', [racun.Number]) + '      ' + Format('%.2f', [racun.Sum]));
  end;

  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    lines3.Add(racun.Name + DupeString(' ', 21 - Length(racun.Name)) + Format('%.2f', [racun.Number]) + DupeString(' ', 6 - Length(Format('%.2f', [racun.Number]))) + Format('%.2f', [racun.Price + racun.Naknada]) + DupeString(' ', 7 - Length(Format('%.2f', [racun.Price]))) + Format('%.2f', [racun.Sum]));
  end;

  SetLength(aporez2, 0);

  k := 0;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    prolaz := false;
    for p := Low(aporez2) to High(aporez2) do
    begin
      if racun.Tax = aporez2[p] then
      begin
        prolaz := true;
      end;
    end;

    if prolaz <> true then
    begin
      SetLength(aporez2, Length(aporez2) + 1);
      aporez2[k] := racun.Tax;
      k := k + 1;
    end;
  end;

  p := 3;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    for k := Low(aporez2) to High(aporez2) do
    begin
      if racun.Tax = aporez2[k] then
      begin
        x := p * k;
        bporez[x] := StrToFloat(Format('%.2f', [bporez[x]])) + StrToFloat(Format('%.2f', [racun.iznosPocetni]));
        bporez[x + 1] := StrToFloat(Format('%.2f', [bporez[x + 1]])) + StrToFloat(Format('%.2f', [racun.iznosPoreza]));
        bporez[x + 2] := StrToFloat(Format('%.2f', [bporez[x + 2]]))+ StrToFloat(Format('%.2f', [racun.iznosPoreza])) + StrToFloat(Format('%.2f', [racun.iznosPocetni]));
      end;
    end;
  end;

  ukPnp := 0;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    ukPnp := ukPnp + StrToFloat(Format('%.2f', [racun.iznospnp]));
  end;

  lines2.Free;

  popust := 0;
  for i := racunList.Count - 1 downto 0 do
  begin
    racun := racunList.Items[i];
    popust := popust + racun.Number * racun.Price * racun.Popust / 100;
  end;

  sumNaknada := 0; kolNaknada := 0;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    sumNaknada := sumNaknada + racun.Naknada * racun.Number;
    if racun.Naknada <> 0 then
      kolNaknada := kolNaknada + racun.Number;
  end;
  naknada := Format('%.2f', [sumNaknada]);

  if sumNaknada <> 0 then
  begin
    //lines.Add('Povratna naknada 0,5    ' + Format('%.2f', [kolNaknada]) + DupeString(' ', 10 - Length(Format('%.2f', [kolNaknada]))) + Format('%.2f', [sumNaknada]));
    //lines3.Add('Povratna naknada 0,5 ' + Format('%.2f', [kolNaknada]) + DupeString(' ', 13 - Length(Format('%.2f', [kolNaknada]))) + Format('%.2f', [sumNaknada]));
  end;

  StartDocPrinter(Handle, 1, @DocInfo1);
  WritePrinter(Handle, PChar(s), Length(s), N);

  if Form5.hrSlova = '1' then
  begin
    s := pretvoriHrv(title1);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := pretvoriHrv(title2);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := pretvoriHrv(title3);
    WritePrinter(Handle, PChar(s), Length(s), N);
  end
  else
  begin
    s := pretvoriEng(title1);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := pretvoriEng(title2);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := pretvoriEng(title3);
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;

  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := 'OIB: ' + oibPoslovnica;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);

  if Form5.hrSlova = '1' then
  begin
    s := 'RA^UN: ' + racunBr + '/' + poslovnica + '/' + kasabr;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end
  else
  begin
    s := 'RACUN: ' + racunBr + '/' + poslovnica + '/' + kasabr;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;

  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := 'Datum: ' + date + '   Vrijeme: ' + time;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);

  if (Form5.vrstaRacuna = '1') or (Form5.vrstaRacuna = '4') then
  begin
  if Length(aporez2) <> 0 then
  begin
    if Form5.hrSlova = '1' then
    begin
      s := pretvoriHrv(Form11.naziv);
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := pretvoriHrv(Form11.adresa);
      WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
      s := pretvoriEng(Form11.naziv);
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := pretvoriEng(Form11.adresa);
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := Form11.oib;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if Form5.vrstaRacuna = '1' then
      s := 'R-1';

    if Form5.vrstaRacuna = '4' then
      s := 'R-2';

    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;
  end;

  if (Form5.vrstaRacuna = '1') or  (Form5.vrstaRacuna = '2') or  (Form5.vrstaRacuna = '4') then
  begin
  if Length(aporez2) <> 0 then
  begin
    if Form5.hrSlova = '1' then
    begin
      s := '[ifra       PDV       Cijena  JM';
      WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
      s := 'Sifra       PDV       Cijena  JM';
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if Form5.hrSlova = '1' then
    begin
      s := 'Naziv                Koli~ina      Iznos';
      WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
      s := 'Naziv                Kolicina      Iznos';
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := '========================================';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    for i:= 0 to lines.Count -1 do
    begin
      if Form5.hrSlova = '1' then
      begin
        s := pretvoriHrv(lines[i]);
        WritePrinter(Handle, PChar(s), Length(s), N);
      end
      else
      begin
        s := pretvoriEng(lines[i]);
        WritePrinter(Handle, PChar(s), Length(s), N);
      end;

      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;
    lines.Free;

    s := '========================================';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    s := 'UKUPNO kn:                       ' + Format('%.2f', [StrToFloat(ukupno)]);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if popust <> 0 then
    begin
      s := 'POPUST kn:                       ' + Format('%.2f', [popust]);
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := 'Stopa     Osnovica      PDV      Ukupno';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := '----------------------------------------';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    p := 0;
    for k := Low(aporez2) to High(aporez2) do
    begin
      s := Format('%.2f', [aporez2[k]]) + DupeString(' ', 11 - Length(Format('%.2f', [aporez2[k]]))) + Format('%.2f', [bporez[p]]) + DupeString(' ', 11 - Length(Format('%.2f', [bporez[p]]))) + Format('%.2f', [bporez[p + 1]]) + DupeString(' ', 11 - Length(Format('%.2f', [bporez[p+1]]))) + Format('%.2f', [bporez[p + 2]]);
      WritePrinter(Handle, PChar(s), Length(s), N);          // PETLJA DRUGA
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
      p := p + 3;
    end;

    ukUkupno := 0; ukOsnovica := 0; ukPorez := 0; p := 0;
    while p < 45 do
    begin
      ukOsnovica := ukOsnovica + bporez[p];
      ukPorez := ukPorez + bporez[p + 1];
      ukUkupno := ukUkupno + bporez[p + 2];
      p := p + 3;
    end;

    s := '----------------------------------------';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := 'Uk.        ' + Format('%.2f', [ukOsnovica]) + DupeString(' ', 11 - Length(Format('%.2f', [ukOsnovica]))) + Format('%.2f', [ukPorez]) + DupeString(' ', 11 - Length(Format('%.2f', [ukPorez]))) + Format('%.2f', [ukUkupno]);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    if Form5.posTip = '0' then
    begin
      s := 'Povratna naknada                  ' + naknada;
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    if Form5.posTip = '1' then
    begin
      if Form5.hrSlova = '1' then
      begin
        s := 'Porez na potro{nju               ' + Format('%.2f', [ukpnp]);
        WritePrinter(Handle, PChar(s), Length(s), N);
      end
      else
      begin
        s := 'Porez na potrosnju               ' + Format('%.2f', [ukpnp]);
        WritePrinter(Handle, PChar(s), Length(s), N);
      end;
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;
  end
  else
  begin
    s := '========================================';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if Form5.hrSlova = '1' then
    begin
      s := 'Naziv artikla        KOM  Cijena  Ukupno';
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
      s := 'Naziv artikla        KOM  Cijena  Ukupno';
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := '----------------------------------------';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    for i:= 0 to lines3.Count -1 do
    begin
      if Form5.hrSlova = '1' then
      begin
        s := pretvoriHrv(lines3[i]);
        WritePrinter(Handle, PChar(s), Length(s), N);
        s := #10;
        WritePrinter(Handle, PChar(s), Length(s), N);
      end
      else
      begin
        s := pretvoriEng(lines3[i]);
        WritePrinter(Handle, PChar(s), Length(s), N);
        s := #10;
        WritePrinter(Handle, PChar(s), Length(s), N);
      end;
    end;
    lines3.Free;

    s := '========================================';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if popust <> 0 then
    begin
      s := 'POPUST kn:                       ' + Format('%.2f', [popust]);
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := 'UKUPNO kn:                       ' + Format('%.2f', [StrToFloat(ukupno)]);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := '----------------------------------------';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := 'NE NALAZIMO SE U SUSTAVU PDV-a';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := '----------------------------------------';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if Form5.posTip = '0' then
    begin
      s := 'Povratna naknada                  ' + naknada;
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    if Form5.posTip = '1' then
    begin
      if (Form5.hrSlova = '1') and (ukPnp > 0) then
      begin
        s := 'Porez na potro{nju               ' + Format('%.2f', [ukpnp]);
        WritePrinter(Handle, PChar(s), Length(s), N);
      end
      else
      begin
        s := 'Porez na potrosnju                ' + Format('%.2f', [ukpnp]);
        WritePrinter(Handle, PChar(s), Length(s), N);
      end;
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

  end;

  if StrToFloat(ambUkupno) > 0 then
  begin
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    if Form5.hrSlova = '1' then
    begin
      s := 'Otkup ambala`e';
      WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
      s := 'Otkup ambalaze';
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := '----------------------------------------';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if Form5.hrSlova = '1' then
    begin
    s := 'PET ambala`a' + DupeString(' ', 10) + ambPet + ' kom' + DupeString(' ', 7 - Length(ambPet)) + petsum;
    WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
    s := 'PET ambalaza' + DupeString(' ', 10) + ambPet + ' kom' + DupeString(' ', 7 - Length(ambPet)) + petsum;
    WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if Form5.hrSlova = '1' then
    begin
    s := 'Staklena ambala`a' + DupeString(' ', 5) + ambStaklo + ' kom' + DupeString(' ', 7 - Length(ambStaklo)) + staklosum;
    WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
    s := 'Staklena ambalaza' + DupeString(' ', 5) + ambStaklo + ' kom' + DupeString(' ', 7 - Length(ambStaklo)) + staklosum;
    WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if Form5.hrSlova = '1' then
    begin
    s := 'Al-Fe ambala`a' + DupeString(' ', 8) + ambAlfe + ' kom' + DupeString(' ', 7 - Length(ambAlfe)) + alfesum;
    WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
    s := 'Al-Fe ambalaza' + DupeString(' ', 8) + ambAlfe + ' kom' + DupeString(' ', 7 - Length(ambAlfe)) + alfesum;
    WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := '----------------------------------------';
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := 'Ukupno' + DupeString(' ', 16) + ambUkupno + ' kom' + DupeString(' ', 7 - Length(ambUkupno)) + totalsum;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := 'UKUPNO kn :' + DupeString(' ', 27 - Length(Format('%.2f', [StrToFloat(ukupno) - StrToFloat(totalsum)]))) + Format('%.2f', [StrToFloat(ukupno) - StrToFloat(totalsum)]);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;

  if Form5.hrSlova = '1' then
  begin
    s := 'Blagajnik: ' + pretvoriHrv(blagajnik);
    WritePrinter(Handle, PChar(s), Length(s), N);
  end
  else
  begin
    s := 'Blagajnik: ' + pretvoriEng(blagajnik);
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;

  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);

  if Form5.hrSlova = '1' then
  begin
    s := 'Na~in pla}anja:  ' + pretvoriHrv(nacinPlacanja);
    WritePrinter(Handle, PChar(s), Length(s), N);
  end
  else
  begin
    s := 'Nacin placanja:  ' + pretvoriEng(nacinPlacanja);
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;

  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := 'ZKI:' + zki;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := 'JIR:' + jir;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);
  s := #10;
  WritePrinter(Handle, PChar(s), Length(s), N);

  if Form5.hrSlova = '1' then
  begin
    s := pretvoriHrv(pozporuka1);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := pretvoriHrv(pozPoruka2);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end
  else
  begin
    s := pretvoriEng(pozporuka1);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := pretvoriEng(pozPoruka2);
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
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

  aporez2 := nil;

  EndPagePrinter(Handle);
  EndDocPrinter(Handle);
  ClosePrinter(Handle);
end;

procedure PrintDocument(namePrinter, title1, title2, title3, date, time, oibPoslovnica, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum : String; racunList : TList);
var
  i : Integer;
  s : string;
  racun : TracunData;
  lines : TStrings;
  lines2 : TStrings;
  lines3 : TStrings;
  lines5 : TStringList;
  bporez : array[0..45] of Double;
  aporez2 : array of Double;
  k : Integer;
  p : Integer;
  prolaz : Boolean;
  ukOsnovica : Double;
  ukPorez : Double;
  ukUkupno : Double;
  x : Integer;
  ukPnp : Double;
  sumNaknada : Double;
  popust : Double;
  lines4 : TStringList;
  myFile : TextFile;
  index : Integer;
  brojac : Integer;
  brojac2 : Integer;
  kolNaknada : Double;
  ukupniPorez : Double;
  source1 : String;
  source2 : String;

begin

  lines := TStringList.Create;
  lines2 := TStringList.Create;
  lines3 := TStringList.Create;
  lines5 := TStringList.Create;

  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    if Length(racun.Name) > 24 then
    begin
      source1 := Copy(racun.Name, 0, 24);
      source2 := Copy(racun.Name, 24, Length(racun.Name));

      lines.Add(source1 + ' ' + Format('%.2f', [racun.Tax]) + '%' + DupeString(' ', 7 - Length(Format('%.2f', [racun.Tax]))) + Format('%.2f', [racun.Number]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.Number]))) + racun.Mjera + DupeString(' ', 5 - Length(racun.Mjera)) + Format('%.2f', [racun.Price]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.Price]))) + Format('%.2f', [racun.Sum - racun.Naknada * racun.Number]));
      lines.Add(source2);
    end
    else
    begin
      lines.Add(racun.Name + DupeString(' ', 25 - Length(racun.Name)) + Format('%.2f', [racun.Tax]) + '%' + DupeString(' ', 7 - Length(Format('%.2f', [racun.Tax]))) + Format('%.2f', [racun.Number]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.Number]))) + racun.Mjera + DupeString(' ', 5 - Length(racun.Mjera)) + Format('%.2f', [racun.Price]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.Price]))) + Format('%.2f', [racun.Sum - racun.Naknada * racun.Number]));
    end;
   end;

  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];

    if Length(racun.Name) > 30 then
    begin
      source1 := Copy(racun.Name, 0, 30);
      source2 := Copy(racun.Name, 30, Length(racun.Name));

      lines3.Add(source1 + ' ' + Format('%.2f', [racun.Number]) + DupeString(' ', 14 - Length(Format('%.2f', [racun.Number]))) + Format('%.2f', [racun.Price]) + DupeString(' ', 12 - Length(Format('%.2f', [racun.Price]))) + Format('%.2f', [racun.Sum - racun.Number * racun.Naknada]));
      lines3.Add(source2);
    end
    else
    begin
      lines3.Add(racun.Name + DupeString(' ', 31 - Length(racun.Name)) + Format('%.2f', [racun.Number]) + DupeString(' ', 14 - Length(Format('%.2f', [racun.Number]))) + Format('%.2f', [racun.Price]) + DupeString(' ', 12 - Length(Format('%.2f', [racun.Price]))) + Format('%.2f', [racun.Sum - racun.Number * racun.Naknada]));
    end;
   end;

  if Form5.posTip = '2' then
  begin
    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      if Length(racun.Name) > 24 then
      begin
        source1 := Copy(racun.Name, 0, 24);
        source2 := Copy(racun.Name, 24, Length(racun.Name));

        lines5.Add(source1 + ' ' + Format('%.2f', [racun.iznosPoreza]) + DupeString(' ', 8 - Length(Format('%.2f', [racun.iznosPoreza]))) + Format('%.2f', [racun.Number]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.Number]))) + racun.Mjera + DupeString(' ', 5 - Length(racun.Mjera)) + Format('%.2f', [racun.iznosPocetni / racun.Number]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.iznosPocetni / racun.Number]))) + Format('%.2f', [racun.Sum - racun.Naknada * racun.Number - racun.iznosPoreza]));
        lines5.Add(source2);
      end
      else
      begin
       lines5.Add(racun.Name + DupeString(' ', 25 - Length(racun.Name)) + Format('%.2f', [racun.iznosPoreza]) + DupeString(' ', 8 - Length(Format('%.2f', [racun.iznosPoreza]))) + Format('%.2f', [racun.Number]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.Number]))) + racun.Mjera + DupeString(' ', 5 - Length(racun.Mjera)) + Format('%.2f', [racun.iznosPocetni / racun.Number]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.iznosPocetni / racun.Number]))) + Format('%.2f', [racun.Sum - racun.Naknada * racun.Number - racun.iznosPoreza]));
      end;
     end;
  end;

  SetLength(aporez2, 0);

  k := 0;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    prolaz := false;
    for p := Low(aporez2) to High(aporez2) do
    begin
      if racun.Tax = aporez2[p] then
      begin
        prolaz := true;
      end;
    end;

    if prolaz <> true then
    begin
      SetLength(aporez2, Length(aporez2) + 1);
      aporez2[k] := racun.Tax;
      k := k + 1;
    end;
  end;

  p := 3;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    for k := Low(aporez2) to High(aporez2) do
    begin
      if racun.Tax = aporez2[k] then
      begin
        x := p * k;
        bporez[x] := StrToFloat(Format('%.2f', [bporez[x]])) + StrToFloat(Format('%.2f', [racun.iznosPocetni]));
        bporez[x + 1] := StrToFloat(Format('%.2f', [bporez[x + 1]])) + StrToFloat(Format('%.2f', [racun.iznosPoreza]));
        bporez[x + 2] := StrToFloat(Format('%.2f', [bporez[x + 2]]))+ StrToFloat(Format('%.2f', [racun.iznosPoreza])) + StrToFloat(Format('%.2f', [racun.iznosPocetni]));
      end;
    end;
  end;

  ukPnp := 0; ukupniPorez := 0;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    ukupniPorez := ukupniPorez + racun.iznosPoreza;
    ukPnp := ukPnp + StrToFloat(Format('%.2f', [racun.iznospnp]));
  end;

  lines2.Free;

  popust := 0;
  for i := racunList.Count - 1 downto 0 do
  begin
    racun := racunList.Items[i];
    popust := popust + racun.Price * racun.Number * racun.Popust / 100;
  end;

  sumNaknada := 0; kolNaknada := 0;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    sumNaknada := sumNaknada + racun.Naknada * racun.Number;

    if racun.Naknada <> 0 then
      kolNaknada := kolNaknada + racun.Number;
  end;
  naknada := Format('%.2f', [sumNaknada]);

  if sumNaknada <> 0 then
  begin
    lines.Add('Povratna naknada 0,5' + DupeString(' ', 13 ) + Format('%.2f', [kolNaknada]) + DupeString(' ', 23 - Length(Format('%.2f', [kolNaknada]))) + Format('%.2f', [sumNaknada]));
    lines3.Add('Povratna naknada 0,5' + DupeString(' ', 11 ) + Format('%.2f', [kolNaknada]) + DupeString(' ', 26 - Length(Format('%.2f', [kolNaknada]))) + Format('%.2f', [sumNaknada]));
  end;

  lines4 := TStringList.Create;

  lines4.Add(title1);
  lines4.Add(title2);
  lines4.Add(title3);
  lines4.Add('OIB: ' + oibPoslovnica);
  lines4.Add('');
  lines4.Add('');
  lines4.Add('                RAÈUN BROJ ' + racunBr + '/' + poslovnica + '/' + kasabr);
  lines4.Add('');
  lines4.Add('Datum raèuna: ' + date + '    Vrijeme: ' + time);
  lines4.Add('');
  lines4.Add('');

  if (Form5.vrstaRacuna = '1') or (Form5.vrstaRacuna = '4') then
  begin
  if Length(aporez2) <> 0 then
  begin

  if Form5.vrstaRacuna = '4' then
    lines4.Add('R-2 raèun podaci: ');

  if Form5.vrstaRacuna = '1' then
    lines4.Add('R-1 raèun podaci: ');

    lines4.Add('  ' + Form11.naziv);
    lines4.Add('  ' + Form11.adresa);
    lines4.Add('  ' + Form11.oib);
  end;
  end;

  lines4.Add('');

  lines4.Add('Raèun izdao = ' + blagajnik);
  lines4.Add('JIR = ' + jir);
  lines4.Add('ZKI = ' + zki);
  lines4.Add('');

  if (Form5.vrstaRacuna = '1') or  (Form5.vrstaRacuna = '2') or  (Form5.vrstaRacuna = '4')then
  begin
  if Length(aporez2) <> 0 then
  begin

    lines4.Add('________________________________________________________________');
    lines4.Add('NAZIV                    PDV    KOLIÈINA  JM   CIJENA    IZNOS');
    lines4.Add('________________________________________________________________');

    
    if Form5.posTip <> '2' then
    begin
    for i:= 0 to lines.Count -1 do
    begin
      lines4.Add(lines[i]);
    end;
    lines.Free;
    end
    else
    begin
    for i:= 0 to lines5.Count -1 do
    begin
      lines4.Add(lines5[i]);
    end;
    lines5.Free;
    end;

    lines4.Add('');
    lines4.Add('                        ________________________________________');
    lines4.Add('');
    lines4.Add('                     UKUPNO' + DupeString(' ', 28 - Length(Format('%.2f', [StrToFloat(ukupno)]))) + Format('%.2f', [StrToFloat(ukupno)]) + ' Kn');

    if Form5.posTip = '2' then
    begin
      lines4.Add('                        PDV' + DupeString(' ', 32 - Length(Format('%.2f', [ukupniPorez]))) + Format('%.2f', [ukupniPorez]) + ' Kn');
    end;

    if Form5.posTip = '2' then
    begin
      lines4.Add('                        UKUPNO (bez pdv)' + DupeString(' ', 20 - Length(Format('%.2f', [strToFloat(ukupno) - ukupniPorez]))) + Format('%.2f', [strToFloat(ukupno) - ukupniPorez]) + ' Kn');
    end;

    if popust <> 0 then
    begin
      lines4.Add('                        POPUST' + DupeString(' ', 30 - Length(Format('%.2f', [popust]))) + Format('%.2f', [popust]) + ' Kn');
    end;

    lines4.Add('                        NAÈIN PLAÆANJA' + DupeString(' ', 26 - Length(nacinPlacanja)) + nacinPlacanja);

    lines4.Add('');
    lines4.Add('                        REKAPITULACIJA PO TARIFAMA');
    lines4.Add('                        ________________________________________');
    lines4.Add('                        Stopa     Osnovica      PDV     Ukupno');
    lines4.Add('                        ________________________________________');

    p := 0;
    for k := Low(aporez2) to High(aporez2) do
    begin
      lines4.Add('                        ' + Format('%.2f', [aporez2[k]]) + DupeString(' ', 10 - Length(Format('%.2f', [aporez2[k]]))) + Format('%.2f', [bporez[p]]) + DupeString(' ', 14 - Length(Format('%.2f', [bporez[p]]))) + Format('%.2f', [bporez[p + 1]]) + DupeString(' ', 8 - Length(Format('%.2f', [bporez[p+1]]))) + Format('%.2f', [bporez[p + 2]]));
      p := p + 3;
    end;

    ukUkupno := 0; ukOsnovica := 0; ukPorez := 0; p := 0;
    while p < 45 do
    begin
      ukOsnovica := ukOsnovica + bporez[p];
      ukPorez := ukPorez + bporez[p + 1];
      ukUkupno := ukUkupno + bporez[p + 2];
      p := p + 3;
    end;

    lines4.Add('                        ________________________________________');
    lines4.Add('                        Ukupno    ' + Format('%.2f', [ukOsnovica]) + DupeString(' ', 14 - Length(Format('%.2f', [ukOsnovica]))) + Format('%.2f', [ukPorez]) + DupeString(' ', 8 - Length(Format('%.2f', [ukPorez]))) + Format('%.2f', [ukUkupno]));

    lines4.Add('');

    //if Form5.posTip = '0' then
    //begin
     // lines4.Add('                        Povratna naknada                ' + naknada);
    //end;
    //if Form5.posTip = '1' then
    //begin
      //lines4.Add('                        Porez na potrošnju              ' + Format('%.2f', [ukpnp]));
    //end;

    lines4.Add('');
  end;
  end
  else
  begin

    lines4.Add('________________________________________________________________');
    lines4.Add('NAZIV                          KOLIÈINA      CIJENA      UKUPNO');
    lines4.Add('________________________________________________________________');

    for i:= 0 to lines3.Count -1 do
    begin
      lines4.Add(lines3[i]);
    end;
    lines3.Free;

    lines4.Add('');
    lines4.Add('                        ________________________________________');
    lines4.Add('');
    lines4.Add('                     UKUPNO' + DupeString(' ', 28 - Length(Format('%.2f', [StrToFloat(ukupno)]))) + Format('%.2f', [StrToFloat(ukupno)]) + ' Kn');


    if popust <> 0 then
    begin
      lines4.Add('                        POPUST' + DupeString(' ', 30 - Length(Format('%.2f', [popust]))) + Format('%.2f', [popust]) + ' Kn');
    end;

    lines4.Add('                        NAÈIN PLAÆANJA' + DupeString(' ', 26 - Length(nacinPlacanja)) + nacinPlacanja);

    lines4.Add('');
    lines4.Add('                        REKAPITULACIJA PO TARIFAMA');
    lines4.Add('                          Ne nalazimo se u sustavu pdv-a');
    lines4.Add('');

    //if Form5.posTip = '0' then
    //begin
      //lines4.Add('                        Povratna naknada                ' + naknada);
    //end;
    //if Form5.posTip = '1' then
    //begin
      //lines4.Add('                        Porez na potrošnju              ' + Format('%.2f', [ukpnp]));
    //end;

    lines4.Add('');

  end;


  if StrToFloat(ambUkupno) > 0 then
  begin

    lines4.Add('Otkup ambalaže');
    lines4.Add('__________________________________________');
    lines4.Add('PET ambalaža' + DupeString(' ', 10) + ambPet + ' kom' + DupeString(' ', 7 - Length(ambPet)) + petsum);
    lines4.Add('Staklena ambalaža' + DupeString(' ', 5) + ambStaklo + ' kom' + DupeString(' ', 7 - Length(ambStaklo)) + staklosum);
    lines4.Add('Al-Fe ambalaža' + DupeString(' ', 8) + ambAlfe + ' kom' + DupeString(' ', 7 - Length(ambAlfe)) + alfesum);
    lines4.Add('__________________________________________');
    lines4.Add('Ukupno' + DupeString(' ', 16) + ambUkupno + ' kom' + DupeString(' ', 7 - Length(ambUkupno)) + totalsum);
    lines4.Add('                        ________________________________________');
    lines4.Add('');
    lines4.Add('                        UKUPNO' + DupeString(' ', 30 - Length(Format('%.2f', [StrToFloat(ukupno) - StrToFloat(totalsum)]))) + Format('%.2f', [StrToFloat(ukupno) - StrToFloat(totalsum)]) + ' Kn');
  end;

  lines4.Add('');
  lines4.Add(DupeString(' ', 43 - Length(pozporuka1)) + pozporuka1);
  lines4.Add(DupeString(' ', 51 - Length(pozporuka2)) + pozPoruka2);

  index := Printers.printer.Printers.IndexOf(Form5.printer);
  Printers.Printer.PrinterIndex := index;

  Printers.Printer.Canvas.Font.Name := 'Courier New';
  Printers.Printer.Canvas.Font.Size := 12;

  AssignPrn(myFile);
  ReWrite(myFile);

  for i := 0 to 3 do
    WriteLn(myFile, '');

  brojac := 0; brojac2 := 0;
  for i := 0 to lines4.Count - 1 do
  begin
    brojac2 := brojac2 + 1;
    if lines4[i] = '                        ________________________________________' then
    begin
      brojac := brojac + 1;
      brojac2 := 0;
    end;

    if i = 6 then
    begin
      Printers.Printer.Canvas.Font.Style := [fsBold];
      Printers.Printer.Canvas.Font.Size := 15;
    end;

    if (brojac = 1) and (brojac2 = 2) then
    begin
      Printers.Printer.Canvas.Font.Style := [fsBold];
      Printers.Printer.Canvas.Font.Size := 13;
    end;

    Write(myFile, '       ');
    Writeln(myFile, lines4[i]);

    Printers.Printer.Canvas.Font.Style := Printers.Printer.Canvas.Font.Style - [fsBold];
    Printers.Printer.Canvas.Font.Size := 12;
  end;

  CloseFile(myFile);
  lines4.Free;

  aporez2 := nil;
end;


procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  number : Integer;

begin
  number := StringGrid1.Row - 1;
  Edit1.SetFocus;
  StringGrid1.Invalidate;

end;

procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : Integer;
  racun : TRacunData;
  pass : Boolean;
  racun2 : TRacunData;
  naknadaF : Double;
  row : Integer;

begin
  if (Key = VK_SUBTRACT) and Form5.isCheckdminus then      // ischeckdminus je kvacina u parametrima , dali zelis da ti prihvaca plus tj minus
  begin

  naknadaF := 0;
  Edit1.Text := '';
    if StringGrid1.Cells[1, StringGrid1.Row] <> '' then
  begin

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      if racun.ID = StringGrid1.Cells[1, StringGrid1.Row] then
      begin
        naknadaF := racun.Naknada * racun.Number;
        sum := sum - racun.Sum;
        FnaknadaL := FnaknadaL - racun.Naknada * racun.Number;
        racunList.Delete(i);
      end;
    end;

    for i := 1 to StringGrid1.RowCount do
      StringGrid1.Rows[i].Clear;

    Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);

    for i := 1 to 199 do
    begin
      StringGrid1.Cells[0,i] := '  ' + IntToStr(i);
    end;

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      StringGrid1.Cells[1, i+1] := racun.ID;
      StringGrid1.Cells[2, i+1] := racun.Name;
      StringGrid1.Cells[3, i+1] := racun.Mjera;
      StringGrid1.Cells[4, i+1] := FloatToStr(racun.Number);
      StringGrid1.Cells[5, i+1] := FloatToStr(racun.Price);
      StringGrid1.Cells[6, i+1] := FloatToStr(racun.Popust);
      StringGrid1.Cells[7, i+1] := FloatToStr(racun.Naknada * racun.Number);
      StringGrid1.Cells[8, i+1] := FloatToStr(racun.Number * racun.Price - racun.Number * racun.Popust * racun.Price / 100);
    end;

  end;
  end;

  if (Key = VK_ADD) and Form5.isCheckdplus then
  begin
      naknadaF := 0;
      Edit1.Text := '';

      if StringGrid1.Cells[1, StringGrid1.Row] <> '' then
      begin
        StringGrid1.Cells[4, StringGrid1.Row] := FloatToStr(StrToFloat(StringGrid1.Cells[4, StringGrid1.Row]) + 1);
      for i := racunList.Count -1 downto 0 do
      begin
        racun := racunList.Items[i];

        if racun.priceChange <> true then
        begin
        if racun.ID = StringGrid1.Cells[1, StringGrid1.Row] then
        begin
          racun.Number := racun.Number + 1;
          racun.Popust := 0;
          racun.Sum := racun.Price * racun.Number - (racun.Price * racun.Number * racun.Popust)/100 + (racun.Naknada * racun.Number);

          StringGrid1.Cells[6, StringGrid1.Row] := FloatToStr(0);
          StringGrid1.Cells[7, StringGrid1.Row] := FloatToStr(racun.Naknada * racun.Number);
          StringGrid1.Cells[8, StringGrid1.Row] := FloatToStr(racun.Number * racun.Price - racun.Number * racun.Popust * racun.Price / 100);
        end;
        end
        else
        begin
          if racun.row = IntToStr(StringGrid1.Row) then
          begin
            racun.Number := racun.Number + 1;
            racun.Popust := 0;
            racun.Sum := racun.Price * racun.Number - (racun.Price * racun.Number * racun.Popust)/100 + (racun.Naknada * racun.Number);

            StringGrid1.Cells[6, StringGrid1.Row] := FloatToStr(0);
            StringGrid1.Cells[7, StringGrid1.Row] := FloatToStr(racun.Naknada * racun.Number);
            StringGrid1.Cells[8, StringGrid1.Row] := FloatToStr(racun.Number * racun.Price - racun.Number * racun.Popust * racun.Price / 100);
          end;
        end;
      end;
      sum := 0; FnaknadaL := 0;
        for i := racunList.Count -1 downto 0 do
        begin
          racun := racunList.Items[i];
          naknadaF := racun.Naknada * racun.Number;
          sum := sum + (racun.Sum);
          FnaknadaL := FnaknadaL + racun.Naknada * racun.Number;

          Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);
        end;
      end;
  end;

  if Key = VK_UP then
  begin
    if (StringGrid1.Row <> 1) and (StringGrid1.Row <> 0) then
      StringGrid1.Row := StringGrid1.Row - 1;
  end;

  if Key = VK_DOWN then
  begin
    if StringGrid1.Row <> 199 then
      StringGrid1.Row := StringGrid1.Row + 1;
  end;

  if Key = VK_RETURN then
  begin

    if Edit1.Text <> '' then
    begin
        FsqlString := 'SELECT Item_ID AS Sifra, Item_Name AS Ime_proizvoda, Item_Measure AS Mjera,'
          + ' Item_Price AS Cijena, VAT_Rate AS Porez, VAT_Type AS PNP, Item_PackPrice AS Naknada, Item_ChangePrice AS Promijena, Dobavljaci AS Dobavljac FROM Items Where'
          + ' Item_Name LIKE ' + QuotedStr(Edit1.Text + '%') + ' OR Item_ID LIKE ' + QuotedStr(Edit1.Text + '%');
    end
    else
    begin
      FsqlString := 'SELECT Item_ID AS Sifra, Item_Name AS Ime_proizvoda, Item_Measure AS Mjera,'
          + ' Item_Price AS Cijena, VAT_Rate AS Porez, VAT_Type AS PNP, Item_PackPrice AS Naknada, Item_ChangePrice AS Promijena, Dobavljaci AS Dobavljac FROM Items';
    end;
    try

      with ADOQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add(FsqlString);
        Open;
      end;

    if DataSource1.DataSet.RecordCount = 0 then
    begin
       FsqlString := 'SELECT Item_ID AS Sifra, Item_Name AS Ime_proizvoda, Item_Measure AS Mjera,'
          + ' Item_Price AS Cijena, VAT_Rate AS Porez, VAT_Type AS PNP, Item_PackPrice AS Naknada, Item_ChangePrice AS Promijena, Dobavljaci AS Dobavljac FROM Items';
    end;


    if DataSource1.DataSet.RecordCount = 1 then
    begin
      pass := false;
      for i := racunList.Count - 1 downto 0 do
      begin
        racun2 := racunList.Items[i];

        // ako postoji artikl vec na racunu onda mu povecaj kolicinu i promjeni pass na true
        if (racun2.ID = DataSource1.DataSet.Fields[0].Value) and (racun2.priceChange <> true) then
        begin
          racun2.Number := racun2.Number + 1;
          racun2.Sum := racun2.Price * racun2.Number - (racun2.Price * racun2.Number * racun2.Popust)/100 + racun2.Naknada * racun2.Number;
          pass := true;
        end;
      end;

      // samo ako je novi proizvod (pass je false) onda stvori novi objekt
      if pass <> true then
      begin
      Racun := TRacunData.Create;
        with Racun do
        begin
          Name := DataSource1.DataSet.Fields[1].Value;
          ID := DataSource1.DataSet.Fields[0].Value;
          Mjera := DataSource1.DataSet.Fields[2].Value;
          Number := 1;

          if (DataSource1.DataSet.Fields[7].AsString = '1') and (Form5.change = '1') then
          begin
            Form18.ShowModal;
            priceChange := true;
            if Form18.cijena = (-1) then
              Price := DataSource1.DataSet.Fields[3].Value
            else
              Price := Form18.cijena;

          end
          else
          begin

            Price := DataSource1.DataSet.Fields[3].Value;
          end;

          if DataSource1.DataSet.Fields[4].Value <> 0 then
            Tax := DataSource1.DataSet.Fields[4].Value;

          if DataSource1.DataSet.Fields[5].Value <> 0 then
            TaxPNP := DataSource1.DataSet.Fields[5].Value;

          if DataSource1.DataSet.Fields[6].Value <> 0 then
            Naknada := DataSource1.DataSet.Fields[6].Value;

          if DataSource1.DataSet.Fields[7].AsString <> '' then
            Promjena := DataSource1.DataSet.Fields[7].AsString;

          if DataSource1.DataSet.Fields[8].AsString <> '' then
            Dobavljac := DataSource1.DataSet.Fields[8].AsString;

          Sum := Price * Number - (Price * Number * Popust)/100 + Naknada * Number;

        end;
        racunList.Add(Racun);
      end;
      end
      else
      begin
        Form3.ShowModal;
      end;

    finally
      sum := 0;  naknadaF := 0; FnaknadaL := 0;
      for i := racunList.Count -1 downto 0 do
      begin
        racun := racunList.Items[i];
        naknadaF := racun.Naknada * racun.Number;
        sum := sum + (racun.Sum);
        FnaknadaL := FnaknadaL + racun.Naknada * racun.Number;

        Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);
      end;
      Edit1.Text := '';
      row := 0;

      for i := racunList.Count - 1 downto 0 do
      begin
        row := row + 1;
        racun := racunList.Items[i];
        racun.row := IntToStr(i + 1);
        StringGrid1.Cells[1, i+1] := racun.ID;
        StringGrid1.Cells[2, i+1] := racun.Name;
        StringGrid1.Cells[3, i+1] := racun.Mjera;
        StringGrid1.Cells[4, i+1] := FloatToStr(racun.Number);
        StringGrid1.Cells[5, i+1] := FloatToStr(racun.Price);
        StringGrid1.Cells[6, i+1] := FloatToStr(racun.Popust);
        StringGrid1.Cells[7, i+1] := FloatToStr(racun.Naknada * racun.Number);
        StringGrid1.Cells[8, i+1] := FloatToStr(racun.Price * racun.Number - racun.Popust * racun.Number * racun.Price / 100);
      end;

      StringGrid1.Row := row;
    end;
  end;

  if Key = VK_F1 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[0]);

  if Key = VK_F2 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[1]);

  if Key = VK_F3 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[2]);

  if Key = VK_F4 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[3]);

  if Key = VK_F5 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[4]);

  if Key = VK_F6 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[5]);

  if Key = VK_F7 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[6]);

  if Key = VK_F8 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[7]);

  if Key = VK_F9 then
    Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[8]);

  if (Key = Ord('A')) and (ssCtrl in Shift) then
    Form2.Button3Click(sender);

  if (Key = Ord('B')) and (ssCtrl in Shift) then
    Form2.Button5Click(sender);

  if (Key = Ord('S')) and (ssCtrl in Shift) then
    Form2.Button2Click(sender);

  if (Key = Ord('D')) and (ssCtrl in Shift) then
    Form2.Button4Click(sender);

  if (Key = Ord('C')) and (ssCtrl in Shift) then
    Form2.Button1Click(sender);

end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Label7.Caption := FormatDateTime('dd/mm/yyyy', Now);
  Label6.Caption := FormatDateTime('H:m:ss', Now);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
 i : Integer;
 dir : String;
 line : String;

begin

  EnableMenuItem(GetSystemMenu(Form2.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);

  dir := GetCurrentDir;
  line := 'Provider=MSDASQL.1;Persist Security Info=False;Extended '
  + 'Properties="DBQ=' + dir + '\Kasa.mdb;DefaultDir=' + dir + ';'
  + 'Driver={Driver do Microsoft Access (*.mdb)};DriverId=25;FIL=MS Access;FILEDSN=' + dir
  + '\connection.dsn;MaxBufferSize=2048;MaxScanRows=8;PageTimeout=5;SafeTransactions=0;Threads=3;UID=admin;UserCommitSync=Yes;"';

  ADOConnection1.ConnectionString := line;

  SystemParametersInfo(SPI_SETBEEP, 0, nil, SPIF_SENDWININICHANGE);
  sum := 0;
  FnaknadaL := 0;
  racunList := TList.Create;

  StringGrid1.Cells[1,0] := ' Šifra';
  StringGrid1.Cells[2,0] := '  Ime proizvoda';
  StringGrid1.Cells[3,0] := ' Mjera';
  StringGrid1.Cells[4,0] := ' Kolièina';
  StringGrid1.Cells[5,0] := ' Cijena';
  StringGrid1.Cells[6,0] := ' Popust';
  StringGrid1.Cells[7,0] := ' Naknada';
  StringGrid1.Cells[8,0] := ' Iznos ';

  StringGrid1.Cells[0,0] := 'Rbr.';

  for i := 1 to 199 do
  begin
    StringGrid1.Cells[0,i] := '  ' + IntToStr(i);
  end;
  prijava := false;
  racunListStorno := TList.Create;

  HeaderControl1.Width := Width;

  Label3.Left := Width - Label3.Width - 130;
  Label2.Left := Width - Label2.Width - Label3.Width - 150;
  Edit1.Left := Width - Edit1.Width - 50;
  Label1.Left := Width - 70 - Edit1.Width - Label1.Width;
  Button4.Left := Width - 90 - Edit1.Width - Label1.Width - button4.Width;
  Button3.Left := Width - 100 - Edit1.Width - Label1.Width - button4.Width - Button3.Width;
  Button2.Left := Width - 110 - Edit1.Width - Label1.Width - button4.Width - Button3.Width - Button2.Width;

  StringGrid1.Height := Round(Height * 18/23); 
  StringGrid1.Width := Width - 20;
  StringGrid1.ColWidths[2] := Round(Width - StringGrid1.ColWidths[0] - StringGrid1.ColWidths[1] - StringGrid1.ColWidths[3] - StringGrid1.ColWidths[4] - StringGrid1.ColWidths[5] - StringGrid1.ColWidths[6] - StringGrid1.ColWidths[7] - StringGrid1.ColWidths[8] - 40);

end;

procedure TForm2.FormShow(Sender: TObject);
var brojacFis : Integer;

begin
  Label9.Caption :=  Form1.Name;
  prijava := true;
  oib := Form1.OIB;
  nameB := Form1.Name;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Receipts WHERE Receipt_JIR LIKE ' + QuotedStr('% ') + ' OR Receipt_JIR IS NULL OR Receipt_JIR =' + QuotedStr(''));
    Open;
  end;

  brojacFis := 0;

  while not ADOQuery2.Eof do
  begin
    brojacFis := brojacFis + 1;
    ADOQuery2.Next;
  end;

  if brojacFis > 0 then
     Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[6]);

  with ADOQuery2 do begin
      Close;
      SQL.Clear;
      SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
      Open;
  end;

  if Form5.posTip = '1' then
    Button3.Visible := false;

  if Form5.posTip = '0' then
    Button3.Visible := true;

  if DataSource2.DataSet.Fields[0].Value > 0 then
    begin
      maxRacun := DataSource2.DataSet.Fields[0].Value + 1;       // dobavljanje najveceg racuna iz baze i uvecavanje za 1
      Label11.Caption := FloatToStr(maxRacun);
    end
  else
  begin
    maxRacun := 1;
    Label11.Caption := '1';
  end;

  with ADOQuery1 do
begin
  Close;
  SQL.Clear;
  SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrinterName'));
  Open;
end;

if DataSource1.DataSet.Fields[0].IsNull <> true then
  Form5.printer := DataSource1.DataSet.Fields[0].Value;

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form1.ShowModal;
  Label9.Caption := nameB;
  Edit1.SetFocus;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  racun : TRacunData;
  Lines : TStringList;
  racunFile : TextFile;
  i : Integer;
  pnp : Boolean;
  line : String;
  line2 : String;
  maxid : String;
  sumStorno : Double;
  naknadaUkupno : Double;
  linePnp : String;
  pnpUkupno : Double;
  responsFile : TextFile;
  zkijir : String;
  zki : String;
  jir : String;
  datumIvrijeme1 : String;
  datumIvrijeme2 : String;
  datumIvrijeme : String;
  title1 : String;
  title2 : String;
  title3 : String;
  footer1 : String;
  footer2 : String;
  oibS : String;
  kasa : String;
  Tinit,Tpost,Ttotal: TDateTime;
  sumNaknada : Double;

begin
  try
    Form10.ShowModal;
  finally
  if Form10.provjera = true then
  begin

    while FileExists('response.txt') do
    begin
      DeleteFile('response.txt');
    end;

    with ADOQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
        Open;
    end;

    maxid := FloatToStr(DataSource1.DataSet.Fields[0].Value);

    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO Receipts(Receipt_ID, Receipt_Date, Receipt_Ammount, Receipt_PaymentID, Receipt_DiscountRate, Receipt_DiscountAmmount, Receipt_User, Receipt_UserOIB, Receipt_ParagonNo, Receipt_PP) '
      + 'SELECT (' + maxid + ' + 1 ), Receipt_Date, (-(Receipt_Ammount)), Receipt_PaymentID, Receipt_DiscountRate, Receipt_DiscountAmmount, Receipt_User, Receipt_UserOIB, Receipt_ParagonNo, Receipt_PP FROM Receipts '
      + 'WHERE Receipt_ID=' + FloatToStr(Form10.idStorno) );
      ExecSQL;
    end;

    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO TReceipts(Receipt_ID, Item_ID, Item_Name, Item_Qty, Item_Price, Item_VAT_ID, Item_Vat_Rate, Item_Ammount, Item_DiscountName, Item_Discount, Item_DiscountAmmount, Item_PackPrice, Item_PackAmmount) '
      + 'SELECT (' + maxid + ' + 1 ), Item_ID, Item_Name, (-(Item_Qty)), Item_Price, Item_VAT_ID, Item_Vat_Rate, (-(Item_Ammount)), Item_DiscountName, Item_Discount, (-(Item_DiscountAmmount)), Item_PackPrice, (-(Item_PackAmmount)) FROM TReceipts '
      + 'WHERE Receipt_ID=' + FloatToStr(Form10.idStorno));
      ExecSQL;
    end;

    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TReceipts WHERE Receipt_ID=(' + maxid + ' + 1)');
      Open;
    end;

    while not ADOQuery1.Eof do
    begin
      racun := TRacunData.Create;
      with racun do
      begin

        ID := StringReplace(ADOQuery1.FieldByName('Item_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]);
        Name := ADOQuery1.FieldByName('Item_Name').AsString;
        if StringReplace(ADOQuery1.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Number := StrToFloat(StringReplace(ADOQuery1.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Number := 0;
        if StringReplace(ADOQuery1.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Price := StrToFloat(StringReplace(ADOQuery1.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Price := 0;
        if StringReplace(ADOQuery1.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Tax := StrToFloat(StringReplace(ADOQuery1.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Tax := 0;
        if StringReplace(ADOQuery1.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          TaxPNP := StrToFloat(StringReplace(ADOQuery1.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          TaxPNP := 0;
        if StringReplace(ADOQuery1.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Popust := StrToFloat(StringReplace(ADOQuery1.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Popust := 0;

        if StringReplace(ADOQuery1.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
           Naknada := StrToFloat(StringReplace(ADOQuery1.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Naknada := 0;

        if StringReplace(ADOQuery1.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
           Sum := StrToFloat(StringReplace(ADOQuery1.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Sum := 0;

      end;
      racunListStorno.Add(racun);
      ADOQuery1.Next;
    end;

    Lines := TStringList.Create;           //Lista stringova , jedan node jedan red u raèunu

    if Form5.vrstaRacuna = '3' then
    begin

      for i := racunList.Count -1 downto 0 do
      begin
        racun := racunList.Items[i];
        racun.Tax := 0;
      end;
    end;
    
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM Receipts WHERE Receipt_ID=' + maxid);
      Open;
    end;

    try
      with ADOQuery2 do begin
        Close;
        SQL.Clear;
        SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
        Open;
      end;

      if DataSource2.DataSet.Fields[0].Value > 0 then
      begin
        maxRacun := DataSource2.DataSet.Fields[0].Value;       // dobavljanje najveceg racuna iz baze i uvecavanje za 1
        Label11.Caption := FloatToStr(maxRacun + 1);
      end
      else
      begin
        maxRacun := 1;
        Label11.Caption := '1';
      end;

      i := 0;
      while ADOQuery1.FieldByName('Receipt_Date').AsString[i] <> ' ' do
      begin
        i := i + 1;
      end;

          if ADOQuery1.FieldByName('Receipt_Customer').AsString <> '' then
      Form11.naziv := ADOQuery1.FieldByName('Receipt_Customer').AsString
    else
      Form11.naziv := '';

    if ADOQuery1.FieldByName('Receipt_Address').AsString <> '' then
      Form11.adresa := ADOQuery1.FieldByName('Receipt_Address').AsString
    else
      Form11.adresa := '';

    if ADOQuery1.FieldByName('Receipt_GuestID').AsString <> '' then
      Form11.oib := ADOQuery1.FieldByName('Receipt_GuestID').AsString
    else
      Form11.oib := '';

      if IsNumeric2(ADOQuery1.FieldByName('Receipt_Date').AsString[i-2]) then
        datumIvrijeme1 := Copy(ADOQuery1.FieldByName('Receipt_Date').AsString, 0, i-1)
      else
        datumIvrijeme1 := Copy(ADOQuery1.FieldByName('Receipt_Date').AsString, 0, i-2);

      datumIvrijeme2 := Copy(ADOQuery1.FieldByName('Receipt_Date').AsString, i, Length(ADOQuery1.FieldByName('Receipt_Date').AsString) - 1);
      datumIvrijeme := FormatDateTime('dd/mm/yyyy hh:nn:ss',StrToDateTime(datumIvrijeme1 + datumIvrijeme2));

      Lines.Add('R');
      Lines.Add(StringReplace((datumIvrijeme),'.', '/', [rfReplaceAll, rfIgnoreCase]));
      Lines.Add(FloatToStr(maxRacun));

      for i := racunListStorno.Count - 1 downto 0 do
      begin
        pnp := false;
        if i <> racunListStorno.Count - 1 then
        begin
          line := line + ' ';
          line2 := line2 + ' ';
        end;
        racun := racunListStorno.Items[i];

        // Izraèun poreza sa i bez proreza na potrošnju
        if racun.TaxPNP <> 0 then
        begin
          pnp := true;
          racun.iznospnp := (((racun.Price - (racun.Price * racun.Popust / 100)) * racun.TaxPNP)/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosPoreza := (((racun.Price - (racun.Price * racun.Popust / 100)) * racun.Tax)/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosPocetni := ((100 * (racun.Price - (racun.Price * racun.Popust / 100 )))/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosUkupno := racun.iznosPocetni + racun.iznosPoreza;
        end
        else
        begin
          racun.iznosPocetni := (((racun.Price - (racun.Price * racun.Popust / 100)) * 100) / (100 + racun.Tax)) * racun.Number;           // pocetni iznos bez poreza
          racun.iznosPoreza := ((racun.Tax * (racun.Price - (racun.Price * racun.Popust / 100))) / (100 + racun.Tax)) * racun.Number;       // iznos poreza u vrijednosti
          racun.iznosUkupno := racun.iznosPocetni + racun.iznosPoreza;
        end;

        line := line + StringReplace(Format('%.2f', [racun.Tax]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPoreza]), ',', '.', [rfReplaceAll, rfIgnoreCase]);

        if racun.TaxPNP > 0 then
          linePnp := line + StringReplace(Format('%.2f', [racun.TaxPNP]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznospnp]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ' ';

        if i <> 0 then
          line := line + ';';
      end;

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM Discount WHERE DiscountName=' + QuotedStr(ADOQuery1.FieldByName('Receipt_PaymentID').AsString));
        Open;
      end;

      sumStorno := 0; sumNaknada := 0;
      for i := racunListStorno.Count - 1 downto 0 do
      begin
        racun := racunListStorno.Items[i];
        sumStorno := sumStorno + racun.Sum;
        sumNaknada := sumNaknada + racun.Naknada * racun.Number;
      end;

      Lines.Add(line);
      Lines.Add(StringReplace(Format('%.2f', [sumStorno-(Form8.ukupno * Form5.iznosNaknade + sumNaknada)]), ',', '.', [rfReplaceAll, rfIgnoreCase]));

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Gotovina' then
        Lines.Add('G');

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Èek' then
        Lines.Add('C');

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Kartice' then
        Lines.Add('K');

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Transakcijski raèun' then
        Lines.Add('T');

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Ostalo' then
        Lines.Add('O');

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
        Open;
      end;

      Lines.Add(DataSource2.DataSet.Fields[0].Value);

      pnpUkupno := 0; naknadaUkupno := 0;
      for i:= racunListStorno.Count - 1 downto 0 do
      begin
        racun := racunListStorno.Items[i];
        naknadaUkupno := naknadaUkupno;
        pnpUkupno := pnpUkupno + racun.iznospnp;
      end;

      naknadaUkupno := naknadaUkupno + sumNaknada;

      if pnp = true then
        line2 := line2 + StringReplace(Format('%.2f', [racun.TaxPNP]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPoreza]), ',', '.', [rfReplaceAll, rfIgnoreCase])
      else

      if pnpUkupno > 0 then
        Lines.Add(linePnp)
      else
        Lines.Add('');

      if (Form8.ukupno * Form5.iznosNaknade + sumNaknada) <> 0 then
        Lines.Add('naknada ambalaže; ' + StringReplace(Format('%.2f', [-(Form8.ukupno * Form5.iznosNaknade + sumNaknada)]),',', '.', [rfReplaceAll, rfIgnoreCase]) )
      else
        Lines.Add('');

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT Receipt_ParagonNo FROM Receipts WHERE Receipt_ID=' + FloatToStr(Form10.idStorno));
        Open;
      end;

      if DataSource2.DataSet.Fields[0].IsNull = false then
        Form14.paragon := DataSource2.DataSet.Fields[0].Value
      else
        Form14.paragon := '0';

      if Form14.paragon <> '0' then
        Lines.Add(Form14.paragon)
      else
        Lines.Add('');

      AssignFile(racunFile, 'Racun.txt');     //Otvaranje datoteke za upis raèuna
      Rewrite(racunFile);

      for i:= 0 to Lines.Count - 1 do
        WriteLn(racunFile, Lines[i]);

      CloseFile(racunFile);

      // CopyFile('Racun4.txt', 'Racun.txt', true);

    finally
      Lines.Free;

      Tinit := Now;
      while ((IsFileInUse('response.txt') = true) or (FileExists('response.txt') = false)) and (Ttotal < 11) do
      begin
        Tpost := Now;
        Ttotal := Tpost - Tinit;
        Ttotal := Ttotal*(24*60*60);
      end;

      if Ttotal < 11 then
      begin
        Sleep(100);
        AssignFile(responsFile, 'response.txt');
        Reset(responsFile);

        while not Eof(responsFile) do
        begin
          ReadLn(responsFile, zkijir);
        end;

        CloseFile(responsFile);
        jir := Copy(zkijir, 0, 36);
        zki := Copy(zkijir, 75, 32);

        i := 0;
        while i <> 60 do
        begin
        if ((jir = '                                    ') or (jir = '')) and ((zki = '                                ') or ( zki = '')) then
        begin
          if i < 20 then
            Sleep(30);

          if i > 20 then
            Sleep(100);
            
          AssignFile(responsFile, 'response.txt');
          Reset(responsFile);

          while not Eof(responsFile) do
          begin
            ReadLn(responsFile, zkijir);
          end;

          CloseFile(responsFile);
          jir := Copy(zkijir, 0, 36);
          zki := Copy(zkijir, 75, 32);
        end;
          i := i + 1;
        end;

      end;

      while FileExists('response.txt') do
      begin
        DeleteFile('response.txt');
      end;

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE Receipts SET Receipt_ZKI=' + QuotedStr(zki) + ', Receipt_JIR=' + QuotedStr(jir) + ' WHERE Receipt_ID=' + '(' + maxid + ' + 1 )');
        ExecSQL;
      end;

      with ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('POSName'));
          Open;
        end;
        kasa := DataSource1.DataSet.Fields[0].Value;

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
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
          Open;
        end;
        oibS := DataSource1.DataSet.Fields[0].Value;

        with ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('FooterRow1'));
          Open;
        end;
        footer1 := DataSource1.DataSet.Fields[0].Value;

        with ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('FooterRow2'));
          Open;
        end;
        footer2 := DataSource1.DataSet.Fields[0].Value;

        with ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
          Open;
        end;

      if DataSource1.DataSet.Fields[0].Value = 0 then
        PrintOnDotMatrix(Form5.printer, title1, title2, title3, datumIvrijeme1, datumIvrijeme2, oibS, FloatToStr(maxRacun), Form5.posProstor, Form5.naplatniUr, Format('%.2f', [sumStorno - sumNaknada]), '', '', '', '', nameB, Form6.nacinSelected, jir, zki, footer1, footer2, '0', '0', '0', '0', '0', '0', '0', '0', racunListStorno );

      if DataSource1.DataSet.Fields[0].Value = 1 then
        PrintDocument(Form5.printer, title1, title2, title3, datumIvrijeme1, datumIvrijeme2, oibS, FloatToStr(maxRacun), Form5.posProstor, Form5.naplatniUr, Format('%.2f', [sumStorno - sumNaknada]), '', '', '', '', nameB, Form6.nacinSelected, jir, zki, footer1, footer2, '0', '0', '0', '0', '0', '0', '0', '0', racunListStorno );

      for i := racunList.Count - 1 downto 0 do
      begin
        racun := racunList.Items[i];
        racun.Free;
      end;

      racunList.Clear;

      Form11.adresa := '';
      Form11.naziv := '';
      Form11.oib := '';

    end;
  end;
  end;
  Edit1.SetFocus;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  try
    Form8.ShowModal;
  finally
  if Form8.ukupno > 0 then
    Button3.Caption := 'Ctrl A-Ambalaža - ' + IntToStr(Form8.ukupno) + 'kom';

    Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);
  end;

Edit1.SetFocus;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  i : Integer;
  racun : TRacunData;
  naknadaF : Double;

begin
  if StringGrid1.Cells[1, StringGrid1.Row] <> '' then
  begin
  try
     Fsuma := StrToFloat(StringGrid1.Cells[5, StringGrid1.Row]) * StrToFloat(StringGrid1.Cells[4, StringGrid1.Row]);
     Form7.ShowModal;
  finally
    if Form7.popust <> 0 then
    begin
      for i := racunList.Count - 1 downto 0 do
      begin
        racun := racunList.Items[i];
        if racun.priceChange <> true then
        begin
        if (racun.ID = StringGrid1.Cells[1, StringGrid1.Row]) then
        begin
          racun.Sum := racun.Price * racun.Number;
          racun.Sum := racun.Sum - (racun.Sum * Form7.popust) / 100;
          racun.Sum := racun.Sum + racun.Number * racun.Naknada;
          racun.Popust := Form7.Popust;
          StringGrid1.Cells[6, StringGrid1.Row] := FloatToStr(Form7.Popust);
          StringGrid1.Cells[7, StringGrid1.Row] := FloatToStr(racun.Number * racun.Naknada);
          StringGrid1.Cells[8, StringGrid1.Row] := FloatToStr(racun.Price * racun.Number - racun.Popust * racun.Price * racun.Number / 100);
        end;
        end
        else
        begin
          if racun.row = IntToStr(StringGrid1.Row) then
          begin
            racun.Sum := racun.Price * racun.Number;
            racun.Sum := racun.Sum - (racun.Sum * Form7.popust) / 100;
            racun.Sum := racun.Sum + racun.Number * racun.Naknada;
            racun.Popust := Form7.Popust;
            StringGrid1.Cells[6, StringGrid1.Row] := FloatToStr(Form7.Popust);
            StringGrid1.Cells[7, StringGrid1.Row] := FloatToStr(racun.Number * racun.Naknada);
            StringGrid1.Cells[8, StringGrid1.Row] := FloatToStr(racun.Price * racun.Number - racun.Popust * racun.Price * racun.Number / 100);
          end;
        end;
      end;
    end;
  end;
  end
  else
    ShowMessage('Izaberite proizvod na koji želite dodati popust!');

  sum := 0;   naknadaF := 0; FnaknadaL := 0;
  for i := racunList.Count - 1 downto 0 do
  begin
    racun := racunList.Items[i];
    sum := sum + (racun.Sum );
    naknadaF := racun.Naknada * racun.Number;
    FnaknadaL := FnaknadaL + racun.Naknada * racun.Number;
  end;
  Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);

Edit1.SetFocus;
end;

procedure TForm2.HeaderControl1SectionClick(HeaderControl: THeaderControl;
  Section: THeaderSection);
var
  i : Integer;
  racun : TRacunData;
  racunFile : TextFile;
  responsFile : TextFile;
  Lines : TStrings;
  iznosPoreza : Double;
  iznosPNP : Double;
  iznosPocetni : Double;
  line : String;
  line2 : String;
  amount : Double;
  pnp : Boolean;
  buttonSelected : Integer;
  petsum : Double;
  alfesum : Double;
  staklosum : Double;
  totalsum : Double;
  printerOn : Boolean;
  buttonSelected2 : Integer;
  nacinOn : Boolean;
  datumIvrijeme: String;
  datumIvrijeme1 : String;
  datumIvrijeme2 : String;
  oibS : String;
  title1 : String;
  title2 : String;
  title3 : String;
  footer1 : String;
  footer2 : String;
  kasa : String;
  maxid : String;
  linePnp : String;
  naknadaUkupno : Double;
  pnpUkupno : Double;
  provjeraPnp : Boolean;
  zkijir : String;
  jir : String;
  zki : String;
  charArray : Array[0..0] of Char;
  sumNaknada : Double;
  strArray  : Array of String;
  Tinit, Ttotal, Tpost : TDateTime;
  racunID : String;
  Rzki : String;
  nacinR : String;
  paragonR : String;
  petnum : Integer;
  alfenum : Integer;
  staklonum : Integer;
  uknum : Integer;
  brojacFis : Integer;
  naknadaF : Double;
  prolazZki : Boolean;
  kupac : String;
  kupacOIB : String;
  blagajnikOIB: String;
  kupacAdresa : String;
  Handle: THandle;
  N: DWORD;
  DocInfo1: TDocInfo1;
  s : string;
  oibProstor: String;

begin
if Section.Index = 0 then
begin
  Form15.ShowModal;
end;

if Section.Index = 1 then
begin
  try
    Form4.ShowModal;
  finally
  if (StringGrid1.Cells[1, StringGrid1.Row] <> '') and ispravnoKol = true then
  begin
    StringGrid1.Cells[4, StringGrid1.Row] := kolicina;
    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      if racun.priceChange <> true then
      begin
      if racun.ID = StringGrid1.Cells[1, StringGrid1.Row] then
      begin
          racun.Number := StrToFloat(kolicina);
          racun.Sum := racun.Price * racun.Number;
          racun.Sum := racun.Sum - (racun.Sum * racun.popust) / 100;
          racun.Sum := racun.Sum + racun.Number * racun.Naknada;

          StringGrid1.Cells[7, StringGrid1.Row] := FloatToStr(racun.Naknada * racun.Number);
          StringGrid1.Cells[8, StringGrid1.Row] := FloatToStr(racun.Price * racun.Number - racun.Popust * racun.Number * racun.Price / 100);
      end;
      end
      else
      begin
        if racun.row = IntToStr(StringGrid1.Row) then
        begin
          racun.Number := StrToFloat(kolicina);
          racun.Sum := racun.Price * racun.Number;
          racun.Sum := racun.Sum - (racun.Sum * racun.popust) / 100;
          racun.Sum := racun.Sum + racun.Number * racun.Naknada;

          StringGrid1.Cells[7, StringGrid1.Row] := FloatToStr(racun.Naknada * racun.Number);
          StringGrid1.Cells[8, StringGrid1.Row] := FloatToStr(racun.Price * racun.Number - racun.Popust * racun.Number * racun.Price / 100);
        end;
      end;
    end;
    sum := 0; FnaknadaL := 0;
      for i := racunList.Count -1 downto 0 do
      begin
        racun := racunList.Items[i];
        sum := sum + (racun.Sum );
        naknadaF := racun.Naknada * racun.Number;
        FnaknadaL := racun.Naknada * racun.Number;

        Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);
      end;
  end;
  end;
end;

if Section.Index = 2 then
begin

  buttonSelected := MessageDlg('Želite li odustati od trenutnog raèuna?',mtConfirmation, mbOKCancel, 0);

  if buttonSelected = mrOK then
  begin

    for i := racunList.Count - 1 downto 0 do
      racun := racunList.Items[i];
      racun.Free;
      racunList.Clear;

    for i := 1 to StringGrid1.RowCount do
      StringGrid1.Rows[i].Clear;

    sum := 0; FnaknadaL := 0;
    Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);

    for i := 1 to 199 do
    begin
      StringGrid1.Cells[0,i] := '  ' + IntToStr(i);
    end;
  end;
end;

if Section.Index = 3 then
begin


  if StringGrid1.Cells[1, StringGrid1.Row] <> '' then
  begin
    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      if racun.ID = StringGrid1.Cells[1, StringGrid1.Row] then
      begin
        sum := sum - (racun.Sum);
        FnaknadaL := FnaknadaL - racun.Naknada * racun.Number;
        racunList.Delete(i);
      end;
    end;

    for i := 1 to StringGrid1.RowCount do
      StringGrid1.Rows[i].Clear;

    Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);

    for i := 1 to 199 do
    begin
      StringGrid1.Cells[0,i] := '  ' + IntToStr(i);
    end;

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      StringGrid1.Cells[1, i+1] := racun.ID;
      StringGrid1.Cells[2, i+1] := racun.Name;
      StringGrid1.Cells[3, i+1] := racun.Mjera;
      StringGrid1.Cells[4, i+1] := FloatToStr(racun.Number);
      StringGrid1.Cells[5, i+1] := FloatToStr(racun.Price);
      StringGrid1.Cells[6, i+1] := FloatToStr(racun.Popust);
      StringGrid1.Cells[7, i+1] := FloatToStr(racun.Naknada * racun.Number);
      StringGrid1.Cells[8, i+1] := FloatToStr(racun.Price * racun.Number - racun.Popust * racun.Number * racun.Price / 100);
    end;

  end;

end;

if Section.Index = 4 then
begin

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Discount');
    Open;
  end;

  nacinOn := false;
  if DataSource1.DataSet.Fields[0].IsNull <> true then
    nacinOn := true;

if (Form5.printer = 'Ne postoji') or (Form5.printer = '') then
  buttonSelected2 := MessageDlg('Printer nije izabran ili ne postoji! Nastaviti sa izadavanjem raèuna?', mtConfirmation, [mbYes, mbNo], 0);

  if nacinOn = true then
  begin

  if ((racunList.Count <> 0) or (Form8.ukupno <> 0)) and ((buttonSelected2 = mrYes) or (buttonSelected2 = 0) ) then
  begin
  try
    Form6.ShowModal;
  finally
  if Form6.isOk = true then
  begin

    while FileExists('response.txt') do
    begin
      DeleteFile('response.txt');
    end;

    if Form5.vrstaRacuna = '3' then
    begin

      for i := racunList.Count -1 downto 0 do
      begin
        racun := racunList.Items[i];
        racun.Tax := 0;
      end;

    end;

    Lines := TStringList.Create;           //Lista stringova , jedan node jedan red u raèunu

    try

      with ADOQuery2 do begin
        Close;
        SQL.Clear;
        SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
        Open;
      end;

      if DataSource2.DataSet.Fields[0].Value > 0 then
      begin
        maxRacun := DataSource2.DataSet.Fields[0].Value + 1;       // dobavljanje najveceg racuna iz baze i uvecavanje za 1
        Label11.Caption := FloatToStr(maxRacun);
      end
      else
      begin
        maxRacun := 1;
        Label11.Caption := '1';
      end;

      datumIvrijeme1 := FormatDateTime('dd/mm/yyyy', Now);
      datumIvrijeme2 := FormatDateTime('hh:nn:ss', Now);
      datumIvrijeme := datumIvrijeme1 + ' ' + datumIvrijeme2;

      Lines.Add('R');
      Lines.Add(StringReplace(datumIvrijeme,'.', '/', [rfReplaceAll, rfIgnoreCase]));
      Lines.Add(FloatToStr(maxRacun));

      provjeraPnp := false;

      for i := racunList.Count - 1 downto 0 do
      begin
        pnp := false;
        if i <> racunList.Count - 1 then
        begin
          line := line + ' ';
          line2 := line2 + ' ';
        end;
        racun := racunList.Items[i];

        // Izraèun poreza sa i bez proreza na potrošnju
        if racun.TaxPNP <> 0 then
        begin
          pnp := true;
          racun.iznospnp := (((racun.Price - (racun.Price * racun.Popust / 100)) * racun.TaxPNP)/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosPoreza := (((racun.Price - (racun.Price * racun.Popust / 100)) * racun.Tax)/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosPocetni := ((100 * (racun.Price - (racun.Price * racun.Popust / 100)))/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosUkupno := racun.iznosPocetni + racun.iznosPoreza;
        end
        else
        begin
          racun.iznosPocetni := (((racun.Price - (racun.Price * racun.Popust / 100)) * 100) / (100 + racun.Tax)) * racun.Number;           // pocetni iznos bez poreza
          racun.iznosPoreza := ((racun.Tax * (racun.Price - (racun.Price * racun.Popust / 100))) / (100 + racun.Tax)) * racun.Number;       // iznos poreza u vrijednosti
          racun.iznosUkupno := racun.iznosPocetni + racun.iznosPoreza;
        end;

        line := line + StringReplace(Format('%.2f', [racun.Tax]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPoreza]), ',', '.', [rfReplaceAll, rfIgnoreCase]);

        if racun.TaxPNP > 0 then
        begin
          if provjeraPnp = true then
            linePnp := linePnp + '; ' + StringReplace(Format('%.2f', [racun.TaxPNP]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznospnp]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          else
            linePnp := StringReplace(Format('%.2f', [racun.TaxPNP]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznospnp]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
          provjeraPnp := true;
        end;

        if i <> 0 then
          line := line + ';';
      end;

      sumNaknada := 0;
      for i := racunList.Count - 1 downto 0 do
      begin
        racun := racunList.Items[i];
        sumNaknada := sumNaknada + racun.Number * racun.Naknada;
      end;

      Lines.Add(line);
      Lines.Add(StringReplace(Format('%.2f', [sum-(Form8.ukupno * Form5.iznosNaknade + sumNaknada)]), ',', '.', [rfReplaceAll, rfIgnoreCase]));

      if Form6.vrstaSelected = 'Gotovina' then
        Lines.Add('G');

      if Form6.vrstaSelected = 'Èek' then
        Lines.Add('C');

      if Form6.vrstaSelected = 'Kartice' then
        Lines.Add('K');

      if Form6.vrstaSelected = 'Transakcijski raèun' then
        Lines.Add('T');

      if Form6.vrstaSelected = 'Ostalo' then
        Lines.Add('O');

      Lines.Add(oib);

      pnpUkupno := 0; naknadaUkupno := 0;
      for i:= racunList.Count - 1 downto 0 do
      begin
        racun := racunList.Items[i];
        naknadaUkupno := naknadaUkupno + racun.Naknada;
        pnpUkupno := pnpUkupno + racun.iznospnp;
      end;

      if pnpUkupno > 0 then
        Lines.Add(linePnp)
      else
        Lines.Add('');

      if (Form8.ukupno * Form5.iznosNaknade + sumNaknada) > 0 then
        Lines.Add('naknada ambalaže; ' + StringReplace(Format('%.2f', [-(Form8.ukupno * Form5.iznosNaknade + sumNaknada)]), ',', '.', [rfReplaceAll, rfIgnoreCase]))
      else
        Lines.Add('');

      if Form14.paragon <> '0' then
        Lines.Add(Form14.paragon)
      else
        Lines.Add('');

      while IsFileInUse('Racun.txt') = true do
      begin
      end;

      AssignFile(racunFile, 'Racun.txt');     //Otvaranje datoteke za upis raèuna
      Rewrite(racunFile);

      for i:= 0 to Lines.Count - 1 do
        WriteLn(racunFile, Lines[i]);

      //Lines.SaveToFile('Racun.txt');
      CloseFile(racunFile);

       //CopyFile('Racun2.txt', 'Racun.txt', true);

    finally

      Lines.Free;

      Tinit := Now;
      while ((IsFileInUse('response.txt') = true) or (FileExists('response.txt') = false)) and (Ttotal < 20) do
      begin
        Tpost := Now;
        Ttotal := Tpost - Tinit;
        Ttotal := Ttotal*(24*60*60);
      end;

      if Ttotal < 20 then
        begin
        Sleep(100);
        AssignFile(responsFile, 'response.txt');
        Reset(responsFile);

        while not Eof(responsFile) do
        begin
          ReadLn(responsFile, zkijir);
        end;

        CloseFile(responsFile);
        jir := Copy(zkijir, 0, 36);
        zki := Copy(zkijir, 75, 32);

        if ((jir = '                                    ') or (jir = '')) and ((zki = '                                ') or ( zki = '')) then
        begin
            Sleep(100);

          AssignFile(responsFile, 'response.txt');
          Reset(responsFile);

          while not Eof(responsFile) do
          begin
            ReadLn(responsFile, zkijir);
          end;

          CloseFile(responsFile);
          jir := Copy(zkijir, 0, 36);
          zki := Copy(zkijir, 75, 32);
        end;

      end;

      prolazZki := true;
      if ((jir = '                                    ') or (jir = '')) and ((zki = '                                ') or ( zki = '')) then
        prolazZki := false;

      while FileExists('response.txt') do
      begin
        DeleteFile('response.txt');
      end;

      if prolazZki = true then
      begin
      amount := 0;
      for i := racunList.Count -1 downto 0 do
      begin
        racun := racunList.Items[i];
        amount := amount + racun.Sum;
      end;

      with ADOQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
        Open;
      end;

      if DataSource1.DataSet.Fields[0].IsNull = false then
        maxRacun := DataSource1.DataSet.Fields[0].Value + 1
      else
        maxRacun := 1;

      with ADOQuery2 do begin     // upis racuna u bazu Receipts
        Close;
        SQL.Clear;
        SQL.Add('Insert into Receipts(Receipt_ID, Receipt_Ammount, Receipt_Date,'
        + 'Receipt_UserOIB, Receipt_User, Receipt_PaymentID, Receipt_ParagonNo, Receipt_ZKI, Receipt_JIR, Receipt_PP, Receipt_Customer, Receipt_Address, Receipt_GuestID) VALUES (' + FloatToStr(maxRacun)
        + ',' + StringReplace(Format('%.2f', [amount]), ',', '.', [rfReplaceAll, rfIgnoreCase])
        + ',' + QuotedStr(datumIvrijeme) + ','
        + QuotedStr(oib) + ',' + QuotedStr(nameB) + ',' + QuotedStr(Form6.nacinSelected) + ',' + Form14.paragon
        + ',' + QuotedStr(zki) + ',' + QuotedStr(jir) + ',' + Form5.vrstaRacuna + ',' + QuotedStr(Form11.naziv) + ',' + QuotedStr(Form11.adresa) + ',' + QuotedStr(Form11.oib) + ')');
        ExecSQL;
      end;
      Form14.paragon := '0';

      with ADOQuery2 do begin
        for i := racunList.Count - 1 downto 0 do
        begin
          racun := RacunList.Items[i];
          Close;
          SQL.Clear;
          SQL.Add('Insert into TReceipts(Receipt_ID, Item_ID, Item_Name, Item_Qty, Item_Price, Item_Vat_Rate, Item_VAT_ID, Item_Ammount, Item_Discount, Item_DiscountAmmount, Item_PackPrice, Item_PackAmmount) VALUES ('
            + FloatToStr(maxRacun) + ',' + QuotedStr(racun.ID)
            + ',' + QuotedStr(racun.Name)
            + ',' + StringReplace(Format('%.2f', [racun.Number]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ',' + StringReplace(Format('%.2f', [racun.Price]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ',' + StringReplace(Format('%.2f', [racun.Tax]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ',' + StringReplace(Format('%.2f', [racun.TaxPNP]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ',' + StringReplace(Format('%.2f', [racun.Sum]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ',' + StringReplace(Format('%.2f', [racun.Popust]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ',' + StringReplace(Format('%.2f', [(racun.Price * racun.Number * racun.Popust)/100]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ',' + StringReplace(Format('%.2f', [racun.Naknada]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ',' + StringReplace(Format('%.2f', [racun.Naknada * racun.Number]), ',', '.', [rfReplaceAll, rfIgnoreCase])
            + ')' );
          ExecSQL;
        end;
      end;

      with ADOQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
        Open;
      end;

      if DataSource1.DataSet.Fields[0].Value > 0 then
      begin
        maxRacun := DataSource1.DataSet.Fields[0].Value + 1;       // dobavljanje najveceg racuna iz baze i uvecavanje za 1
        Label11.Caption := FloatToStr(maxRacun);
      end
      else
      begin
        Label11.Caption := '1';
        maxRacun := 1;
      end;

      //Za ambalažu upisujemo u tablicu Tpack
      if Form8.ukupno <> 0 then
      begin
        alfesum := 0;
        staklosum := 0;
        petsum := 0;
        totalsum := 0;

        with ADOQuery2 do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PackPrice'));
          Open;
        end;

        alfesum := StrToFloat(DataSource2.DataSet.Fields[0].Value) * Form8.alfe;
        petsum := StrToFloat(DataSource2.DataSet.Fields[0].Value) * Form8.pet;
        staklosum := StrToFloat(DataSource2.DataSet.Fields[0].Value) * Form8.staklo;
        totalsum := alfesum + petsum + staklosum;

        with ADOQuery1 do begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO TPack(Receipt_ID, Receipt_Date, PET, Staklo, ALFE, PETAmmount, StakloAmmount, ALFEAmmount, TotalKn, Receipt_User) VALUES ('
          + FloatToStr(maxRacun - 1) + ',' + QuotedStr(datumIvrijeme)
          + ',' + FloatToStr(Form8.pet) + ',' + FloatToStr(Form8.staklo) + ',' + FloatToStr(Form8.alfe)
          + ',' + StringReplace(Format('%.2f', [petsum]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          + ',' + StringReplace(Format('%.2f', [staklosum]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          + ',' + StringReplace(Format('%.2f', [alfesum]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          + ',' + StringReplace(Format('%.2f', [totalsum]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          + ',' + QuotedStr(nameB) + ')'  );
          ExecSQL;
        end;
        Button3.Caption := 'Ctrl A-Ambalaža';
      end;

      // ISPIS NA PRINTER
      // namePrinter, name, Adress, date, time, oib, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2 : String; lista : TStringList
      if buttonSelected2 = 0 then
      begin
        with ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('POSName'));
          Open;
        end;
        kasa := DataSource1.DataSet.Fields[0].Value;

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
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
          Open;
        end;
        oibProstor := DataSource1.DataSet.Fields[0].Value;

        with ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('FooterRow1'));
          Open;
        end;
        footer1 := DataSource1.DataSet.Fields[0].Value;

        with ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('FooterRow2'));
          Open;
        end;
        footer2 := DataSource1.DataSet.Fields[0].Value;

        with ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
          Open;
        end;

        if DataSource1.DataSet.Fields[0].Value = 0 then
          PrintOnDotMatrix(Form5.printer, title1, title2, title3, datumIvrijeme1, datumIvrijeme2, oibProstor, FloatToStr(maxRacun - 1), Form5.posProstor, Form5.naplatniUr, Format('%.2f', [sum]), '', '', '', '', nameB, Form6.nacinSelected, jir, zki, footer1, footer2, IntToStr(Form8.ukupno), IntToStr(Form8.pet), IntToStr(Form8.alfe), IntToStr(Form8.staklo), Format('%.2f', [alfesum]), Format('%.2f', [staklosum]), Format('%.2f', [petsum]), Format('%.2f', [totalsum]), racunList );

        if DataSource1.DataSet.Fields[0].Value = 1 then
          PrintDocument(Form5.printer, title1, title2, title3, datumIvrijeme1, datumIvrijeme2, oibProstor, FloatToStr(maxRacun - 1), Form5.posProstor, Form5.naplatniUr, Format('%.2f', [sum]), '', '', '', '', nameB, Form6.nacinSelected, jir, zki, footer1, footer2, IntToStr(Form8.ukupno), IntToStr(Form8.pet), IntToStr(Form8.alfe), IntToStr(Form8.staklo), Format('%.2f', [alfesum]), Format('%.2f', [staklosum]), Format('%.2f', [petsum]), Format('%.2f', [totalsum]), racunList );

        Form11.naziv := '';
        Form11.oib := '';
        Form11.adresa := '';
        Form8.ukupno := 0;
        Form8.alfe := 0;
        Form8.staklo := 0;
        Form8.pet := 0;
        alfesum := 0;
        staklosum := 0;
        petsum := 0;
        totalsum := 0;
      end;

      for i := racunList.Count - 1 downto 0 do
      begin
        racun := racunList.Items[i];
        racun.Free;
      end;

      racunList.Clear;

      for i := 1 to StringGrid1.RowCount do
        StringGrid1.Rows[i].Clear;

      sum := 0; FnaknadaL := 0;
      Label3.Caption := Format('%.2f', [sum - (Form8.ukupno * Form5.iznosNaknade)]);

      for i := 1 to 199 do
      begin
        StringGrid1.Cells[0,i] := '  ' + IntToStr(i);
      end;
    end
    else
    begin
      ShowMessage('Neuspjela fiskalizacija! Molimo pokušajte ponovno!');

      with ADOQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
        Open;
      end;

      if DataSource1.DataSet.Fields[0].Value > 0 then
      begin
        maxRacun := DataSource1.DataSet.Fields[0].Value + 1;       // dobavljanje najveceg racuna iz baze i uvecavanje za 1
        Label11.Caption := FloatToStr(maxRacun);
      end
      else
      begin
        Label11.Caption := '1';
        maxRacun := 1;
      end;

    end;
    end;
  end;
  end;
  end
  else
    if (buttonSelected2 <> mrNo) and (buttonSelected2 <> 2) then
    begin
      ShowMessage('Ne može se izdati prazan raèun!');
    end;
  end
  else
    ShowMessage('Popunite parametre plaæanja u Svojstvima!');
end;

if Section.Index = 5 then
begin
  try
    Form5.ShowModal;
  finally
    if Form5.posTip = '1' then
      Button3.Visible := false;

    if Form5.posTip = '0' then
      Button3.Visible := true;
      
    with ADOQuery1 do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PackPrice'));
      Open;
    end;
    if (Form5.iznosNaknade <> 0) and (Form5.iznosNaknade <> StrToFloat(DataSource1.DataSet.Fields[0].Value)) then
    begin
      with ADOQuery1 do begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE Settings SET ValueString=' + StringReplace(Format('%.2f', [Form5.iznosNaknade]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ' WHERE Key=' + QuotedStr('PackPrice'));
        ExecSQL;
      end;
    end;
  end;
end;

if Section.Index = 6 then
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Receipts WHERE Receipt_JIR LIKE ' + QuotedStr('% ') + ' OR Receipt_JIR IS NULL OR Receipt_JIR =' + QuotedStr(''));
    Open;
  end;

  brojacFis := 0;

  while not ADOQuery1.Eof do
  begin
    brojacFis := brojacFis + 1;
    ADOQuery1.Next;
  end;

  if brojacFis > 0 then
    buttonSelected2 := MessageDlg('Imate ' + IntToStr(brojacFis) + ' raèuna za fiskalizaciju! Želite li ih fiskalizirati sada?', mtConfirmation, [mbYes, mbNo], 0)
  else
  begin
    ShowMessage(' Nemate nefiskaliziranih raèuna! ');
    buttonSelected2 := mrNo;
  end;

  if ((buttonSelected2 = mrYes) or (buttonSelected2 = 0)) and (brojacFis > 0) then
  begin

  
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
    Open;
  end;
  oibProstor := DataSource1.DataSet.Fields[0].Value;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Receipts WHERE Receipt_JIR LIKE ' + QuotedStr('% ') + ' OR Receipt_JIR IS NULL OR Receipt_JIR =' + QuotedStr(''));
    Open;
  end;

  while not ADOQuery1.Eof do
  begin
    racunID := ADOQuery1.FieldByName('Receipt_ID').AsString;

    if ADOQuery1.FieldByName('Receipt_Customer').AsString <> '' then
      Form11.naziv := ADOQuery1.FieldByName('Receipt_Customer').AsString
    else
      Form11.naziv := '';

    if ADOQuery1.FieldByName('Receipt_Address').AsString <> '' then
      Form11.adresa := ADOQuery1.FieldByName('Receipt_Address').AsString
    else
      Form11.adresa := '';

    if ADOQuery1.FieldByName('Receipt_UserOIB').AsString <> '' then
      blagajnikOIB := ADOQuery1.FieldByName('Receipt_UserOIB').AsString
    else
      blagajnikOIB := '';

    if ADOQuery1.FieldByName('Receipt_GuestID').AsString <> '' then
      Form11.oib := ADOQuery1.FieldByName('Receipt_GuestID').AsString
    else
      Form11.oib := '';

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TReceipts WHERE Receipt_ID=' + racunID);
      Open;
    end;

    while not ADOQuery2.Eof do
    begin
      racun := TRacunData.Create;
      
      racun.ID := StringReplace(ADOQuery2.FieldByName('Item_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]);
      racun.Name := ADOQuery2.FieldByName('Item_Name').AsString;

      if StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
        racun.Number := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
      else
        racun.Number := 0;

      if StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
        racun.Price := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
      else
        racun.Price := 0;

      if StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
        racun.Tax := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
      else
        racun.Tax := 0;

      if StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
        racun.TaxPNP := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
      else
        racun.TaxPNP := 0;

      if StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
        racun.Popust := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
      else
        racun.Popust := 0;

      if StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
        racun.Naknada := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
      else
        racun.Naknada := 0;

      if StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
        racun.Sum := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
      else
        racun.Sum := 0;

      racunList.Add(racun);

      ADOQuery2.Next;
    end;

    Lines := TStringList.Create;

    while FileExists('response.txt') do
    begin
      DeleteFile('response.txt');
    end;

    i := 0;
    while ADOQuery1.FieldByName('Receipt_Date').AsString[i] <> ' ' do
    begin
      i := i + 1;
    end;

    if IsNumeric2(ADOQuery1.FieldByName('Receipt_Date').AsString[i-2]) then
      datumIvrijeme1 := Copy(ADOQuery1.FieldByName('Receipt_Date').AsString, 0, i-1)
    else
      datumIvrijeme1 := Copy(ADOQuery1.FieldByName('Receipt_Date').AsString, 0, i-2);

    datumIvrijeme2 := Copy(ADOQuery1.FieldByName('Receipt_Date').AsString, i, Length(ADOQuery1.FieldByName('Receipt_Date').AsString) - 1);
    datumIvrijeme := FormatDateTime('dd/mm/yyyy hh:nn:ss',StrToDateTime(datumIvrijeme1 + datumIvrijeme2));

    Lines.Add('P');
    Lines.Add(StringReplace((datumIvrijeme),'.', '/', [rfReplaceAll, rfIgnoreCase]));
    Lines.Add(racunID);

    provjeraPnp := false;

      for i := racunList.Count - 1 downto 0 do
      begin
        pnp := false;
        if i <> racunList.Count - 1 then
        begin
          line := line + ' ';
          line2 := line2 + ' ';
        end;
        racun := racunList.Items[i];

        // Izraèun poreza sa i bez proreza na potrošnju
        if racun.TaxPNP <> 0 then
        begin
          pnp := true;
          racun.iznospnp := (((racun.Price - (racun.Price * racun.Popust / 100 )) * racun.TaxPNP)/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosPoreza := (((racun.Price - (racun.Price * racun.Popust / 100 )) * racun.Tax)/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosPocetni := ((100 * (racun.Price - (racun.Price * racun.Popust / 100 )))/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosUkupno := racun.iznosPocetni + racun.iznosPoreza;
        end
        else
        begin
          racun.iznosPocetni := (((racun.Price - (racun.Price * racun.Popust / 100 )) * 100) / (100 + racun.Tax)) * racun.Number;           // pocetni iznos bez poreza
          racun.iznosPoreza := ((racun.Tax * (racun.Price - (racun.Price * racun.Popust / 100 ))) / (100 + racun.Tax)) * racun.Number;       // iznos poreza u vrijednosti
          racun.iznosUkupno := racun.iznosPocetni + racun.iznosPoreza;
        end;

        line := line + StringReplace(Format('%.2f', [racun.Tax]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPoreza]), ',', '.', [rfReplaceAll, rfIgnoreCase]);

        if racun.TaxPNP > 0 then
        begin
          if provjeraPnp = true then
            linePnp := linePnp + '; ' + StringReplace(Format('%.2f', [racun.TaxPNP]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznospnp]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          else
            linePnp := StringReplace(Format('%.2f', [racun.TaxPNP]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [racun.iznospnp]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
          provjeraPnp := true;
        end;

        if i <> 0 then
          line := line + ';';
      end;

      sumNaknada := 0;
      for i := racunList.Count - 1 downto 0 do
      begin
        racun := racunList.Items[i];
        sumNaknada := sumNaknada + racun.Number * racun.Naknada;
      end;

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM TPack WHERE Receipt_ID=' + racunID);
        Open;
      end;

      if DataSource2.DataSet.Fields[0].IsNull = false then
      begin
        petnum := DataSource2.DataSet.Fields[2].Value;
        staklonum := DataSource2.DataSet.Fields[3].Value;
        alfenum := DataSource2.DataSet.Fields[4].Value;
        uknum := petnum + staklonum + alfenum;
      end
      else
      begin
        staklosum := 0;
        petsum := 0;
        alfesum := 0;
        totalsum := 0;
        staklonum := 0;
        petnum := 0;
        alfenum := 0;
        uknum := 0;
      end;

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PackPrice'));
        Open;
      end;

      if DataSource2.DataSet.Fields[0].IsNull = false then
      begin
        petsum := DataSource2.DataSet.Fields[0].Value * petnum;
        staklosum := DataSource2.DataSet.Fields[0].Value * staklonum;
        alfesum := DataSource2.DataSet.Fields[0].Value * alfenum;
        totalsum := DataSource2.DataSet.Fields[0].Value * uknum;
      end;

      Lines.Add(line);
      Lines.Add(StringReplace(Format('%.2f', [StrToFloat(ADOQuery1.FieldByName('Receipt_Ammount').AsString) - sumNaknada - totalsum]), ',', '.', [rfReplaceAll, rfIgnoreCase]));

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DiscountTypeName FROM Discount WHERE DiscountName=' + QuotedStr(ADOQuery1.FieldByName('Receipt_PaymentID').AsString));
        Open;
      end;

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Gotovina' then
        Lines.Add('G');

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Èek' then
        Lines.Add('C');

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Kartice' then
        Lines.Add('K');

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Transakcijski raèun' then
        Lines.Add('T');

      if ADOQuery2.FieldByName('DiscountTypeName').AsString = 'Ostalo' then
        Lines.Add('O');


      Lines.Add(blagajnikOIB);

      pnpUkupno := 0; naknadaUkupno := 0;
      for i:= racunList.Count - 1 downto 0 do
      begin
        racun := racunList.Items[i];
        naknadaUkupno := naknadaUkupno + racun.Naknada;
        pnpUkupno := pnpUkupno + racun.iznospnp;
      end;

      if pnpUkupno > 0 then
        Lines.Add(linePnp)
      else
        Lines.Add('');

      if (totalsum + sumNaknada) > 0 then
        Lines.Add('naknada ambalaže; ' + StringReplace(Format('%.2f', [-(sumNaknada + totalsum)]), ',', '.', [rfReplaceAll, rfIgnoreCase]))
      else
        Lines.Add('');

      if ADOQuery1.FieldByName('Receipt_ParagonNo').AsString <> '0' then
        Lines.Add(ADOQuery1.FieldByName('Receipt_ParagonNo').AsString)
      else
        Lines.Add('');

      while IsFileInUse('Racun.txt') = true do
      begin
      end;

      AssignFile(racunFile, 'Racun.txt');     //Otvaranje datoteke za upis raèuna
      Rewrite(racunFile);

      for i:= 0 to Lines.Count - 1 do
        WriteLn(racunFile, Lines[i]);

      CloseFile(racunFile);

      //CopyFile('Racun3.txt', 'Racun.txt', true);

      Lines.Free;

      Tinit := Now;
      while ((IsFileInUse('response.txt') = true) or (FileExists('response.txt') = false)) and (Ttotal < 20) do
      begin
        Tpost := Now;
        Ttotal := Tpost - Tinit;
        Ttotal := Ttotal*(24*60*60);
      end;

      if Ttotal < 20 then
        begin
        Sleep(100);
        AssignFile(responsFile, 'response.txt');
        Reset(responsFile);

        while not Eof(responsFile) do
        begin
          ReadLn(responsFile, zkijir);
        end;

        CloseFile(responsFile);
        jir := Copy(zkijir, 0, 36);
        zki := Copy(zkijir, 75, 32);

        if ((jir = '                                    ') or (jir = '')) and ((zki = '                                ') or ( zki = '')) then
        begin

          Sleep(100);
          AssignFile(responsFile, 'response.txt');
          Reset(responsFile);

          while not Eof(responsFile) do
          begin
            ReadLn(responsFile, zkijir);
          end;

          CloseFile(responsFile);
          jir := Copy(zkijir, 0, 36);
          zki := Copy(zkijir, 75, 32);
        end;
      end;

      while FileExists('response.txt') do
      begin
        DeleteFile('response.txt');
      end;

      prolazZki := true;
      if ((jir = '                                    ') or (jir = '')) and ((zki = '                                ') or ( zki = '')) then
        prolazZki := false;

      if prolazZki = true then
      begin
      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE Receipts SET Receipt_JIR=' + QuotedStr(jir) + ' WHERE Receipt_ID=' + racunID);
        ExecSQL;
      end;

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE Receipts SET Receipt_ZKI=' + QuotedStr(zki) + ' WHERE Receipt_ID=' + racunID);
        ExecSQL;
      end;

        with ADOQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('TitleRow1'));
          Open;
        end;
        title1 := DataSource2.DataSet.Fields[0].Value;

        with ADOQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('TitleRow2'));
          Open;
        end;
        title2 := DataSource2.DataSet.Fields[0].Value;

        with ADOQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('TitleRow3'));
          Open;
        end;
        title3 := DataSource2.DataSet.Fields[0].Value;

        with ADOQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('FooterRow1'));
          Open;
        end;
        footer1 := DataSource2.DataSet.Fields[0].Value;

        with ADOQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('FooterRow2'));
          Open;
        end;
        footer2 := DataSource2.DataSet.Fields[0].Value;

                with ADOQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
          Open;
        end;
        oibProstor := DataSource2.DataSet.Fields[0].Value;

      with ADOQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
          Open;
        end;



      if DataSource2.DataSet.Fields[0].Value = 0 then
        PrintOnDotMatrix(Form5.printer, title1, title2, title3, datumIvrijeme1, datumIvrijeme2, oibProstor, racunID, Form5.posProstor, Form5.naplatniUr, Format('%.2f', [StrToFloat(ADOQuery1.FieldByName('Receipt_Ammount').AsString)]), '', '', '', '', nameB, Form6.nacinSelected, jir, zki, footer1, footer2, IntToStr(uknum), IntToStr(petnum), IntToStr(alfenum), IntToStr(staklonum), Format('%.2f', [alfesum]), Format('%.2f', [staklosum]), Format('%.2f', [petsum]), Format('%.2f', [totalsum]), racunList );

      if DataSource2.DataSet.Fields[0].Value = 1 then
        PrintDocument(Form5.printer, title1, title2, title3, datumIvrijeme1, datumIvrijeme2, oibProstor, racunID, Form5.posProstor, Form5.naplatniUr, Format('%.2f', [StrToFloat(ADOQuery1.FieldByName('Receipt_Ammount').AsString)]), '', '', '', '', nameB, Form6.nacinSelected, jir, zki, footer1, footer2, IntToStr(uknum), IntToStr(petnum), IntToStr(alfenum), IntToStr(staklonum), Format('%.2f', [alfesum]), Format('%.2f', [staklosum]), Format('%.2f', [petsum]), Format('%.2f', [totalsum]), racunList );

      for i := racunList.Count - 1 downto 0 do
      begin
        racun := racunList.Items[i];
        racun.Free;
      end;

      racunList.Clear;

      Form11.naziv := '';
      Form11.adresa := '';
      Form11.oib := '';
      alfesum := 0;
      staklosum := 0;
      petsum := 0;
      totalsum := 0;
      line := '';
      linePnp := '';

      end
      else
        ShowMessage('Neuspjela fiskalizacija. Molimo pokušajte ponovo !');

    ADOQuery1.Next;
  end;
  end;

  Edit1.SetFocus;

end;

if Section.Index = 7 then
begin
  if not OpenPrinter(PChar(Form5.printer), Handle, nil) then begin
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

if Section.Index = 8 then
begin

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Receipts WHERE Receipt_JIR LIKE ' + QuotedStr('% ') + ' OR Receipt_JIR IS NULL OR Receipt_JIR =' + QuotedStr(''));
    Open;
  end;

  brojacFis := 0;

  while not ADOQuery1.Eof do
  begin
    brojacFis := brojacFis + 1;
    ADOQuery1.Next;
  end;

  if brojacFis > 0 then
     Form2.HeaderControl1SectionClick(Form2.HeaderControl1, Form2.HeaderControl1.Sections[6]);


  KillTask('Fiska.exe');
  DeleteFile('Backup\KasaBackup2.mdb');
  CopyFile('Kasa.mdb', 'Backup\KasaBackup2.mdb', true);
  Application.Terminate;
  Edit1.SetFocus;

end;

end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

begin
  if(ARow = StringGrid1.Row) then
    with TStringGrid(Sender) do
    begin
      if(ACol) in [1,2,3,4,5,6,7,8] then
      begin
        Canvas.Brush.Color := clMoneyGreen;
        Canvas.FillRect(Rect);
        Canvas.Font.Color := clBlack;
        Canvas.TextOut(Rect.Left+ 2, Rect.Top + 2, StringGrid1.Cells[ACol, ARow]);
      end;
    end;
end;

procedure TForm2.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ADD) and Form5.isCheckdplus then
  begin
    Edit1.Text := '';
  end;

  if (Key = VK_SUBTRACT) and Form5.isCheckdminus then
  begin
    Edit1.Text := '';
  end;

end;

procedure TForm2.Button5Click(Sender: TObject);
var
  datum : String;
  polog : String;
  suma : Double;
  suma2 : Double;
  suma3 : Double;
  itemPack : Double;
  datum2 : String;

begin

  datum := FormatDateTime('d/m/yyyy', Date);
  datum2 := FormatDateTime('d/m/yyyy', Date + 1);

 with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Ammount FROM CashDeposit WHERE DateFrom= ( SELECT MAX(DateFrom) FROM CashDeposit )');
    Open;
  end;

  datum := FormatDateTime('mm/dd/yyyy', Date);
  datum2 := FormatDateTime('mm/dd/yyyy', Date + 1);

  datum := StringReplace(datum , '.', '/', [rfReplaceAll, rfIgnoreCase]);
  datum2 := StringReplace(datum2 , '.', '/', [rfReplaceAll, rfIgnoreCase]);

  if DataSource1.DataSet.Fields[0].IsNull = false then
  begin
    polog := Format('%.2f', [StrToFloat(DataSource1.DataSet.Fields[0].Value)]);

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select TReceipts.Item_Ammount, TReceipts.Item_PackAmmount FROM Receipts INNER JOIN TReceipts ON Receipts.Receipt_ID = TReceipts.Receipt_ID WHERE Receipts.Receipt_Date Between #' + datum + '# AND #' + datum2 + '#');
      Open;
    end;

    suma := 0; suma2 := 0; itemPack := 0;
    while not ADOQuery2.Eof do
    begin
      if StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          suma := suma + StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]));

      if StringReplace(ADOQuery2.FieldByName('Item_PackAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          itemPack := itemPack + StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_PackAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]));

      ADOQuery2.Next;
    end;

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select TotalKn FROM TPack WHERE TPack.Receipt_Date Between #' + datum + '# AND #' + datum2 + '#');
      Open;
    end;

    while not ADOQuery2.Eof do
    begin
      if StringReplace(ADOQuery2.FieldByName('TotalKn').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          suma2 := suma2 + StrToFloat(StringReplace(ADOQuery2.FieldByName('TotalKn').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]));

      ADOQuery2.Next;
    end;

    datum := FormatDateTime('dd/mm/yyyy', Date);

    suma3 := suma  - suma2 + StrToFloat(polog);

    lines5 := TStringList.Create;

    lines5.Add('');
    lines5.Add('           Stanje u blagajni');
    lines5.Add('');
    lines5.Add('Za datum ' + datum);
    lines5.Add('');
    lines5.Add('----------------------------------------');
    lines5.Add('Polog : ' + polog);
    lines5.Add('Prodani artikli : ' + Format('%.2f', [suma]));
    lines5.Add('Ambalaža : -' + Format('%.2f', [suma2]));
    lines5.Add('----------------------------------------');
    lines5.Add('');
    lines5.Add('UKUPNO : ' + Format('%.2f', [suma3]));
    lines5.Add('');

    Form17.ShowModal;

    if Form17.buttonOK = true then
    begin
      PrintOnDotMatrix2(Form5.printer, lines5);
    end;

    lines5.Free;
  end
  else
    ShowMessage('Unesite poèetni polog u blagajni! (Pod parametrima)');

  Edit1.SetFocus;

end;

end.




