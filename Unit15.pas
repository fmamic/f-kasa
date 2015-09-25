unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, RacunData, Unit16, StrUtils, Printers, WinSpool, PrinterData;

type
  TForm15 = class(TForm)
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Button5: TButton;
    Button6: TButton;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    Button7: TButton;
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    Flines : TStringList;
    
  public
    { Public declarations }
    property lines : TStringList read Flines write Flines;
  end;

  function PrintOnMemo(namePrinter, title1, title2, title3, date, time, oib, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum, vrstaRac : String; racunList : TList) : TStringList;
  procedure PrintOnDotMatrix2(namePrinter, title1, title2, title3, date, time, oib, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum, vrstaRac, kupac, kupacAdresa, kupacOIB : String; racunList : TList);
  procedure PrintOnDotMatrix(printerName :String; lines : TStringList);
  function pretvoriHrv(line : String) : String;
  function pretvoriEng(line : String) : String;
  function IsNumeric2(sBuffer : String) : Boolean;
  procedure PrintDocument(namePrinter, title1, title2, title3, date, time, oib, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum, vrstaRac, kupac, kupacAdresa, kupacOIB : String; racunList : TList);

var
  Form15: TForm15;

implementation

{$R *.dfm}

uses Unit2, Unit5, Unit11, Unit1;

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

procedure PrintDocument(namePrinter, title1, title2, title3, date, time, oib, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum, vrstaRac, kupac, kupacAdresa, kupacOIB : String; racunList : TList);
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
      lines3.Add(source1 + ' ' + Format('%.2f', [racun.Number]) + DupeString(' ', 14 - Length(Format('%.2f', [racun.Number]))) + Format('%.2f', [racun.Price]) + DupeString(' ', 12 - Length(Format('%.2f', [racun.Price]))) + Format('%.2f', [racun.Sum - racun.Naknada * racun.Number]));
      lines3.Add(source2);
    end
    else
    begin
      lines3.Add(racun.Name + DupeString(' ', 31 - Length(racun.Name)) + Format('%.2f', [racun.Number]) + DupeString(' ', 14 - Length(Format('%.2f', [racun.Number]))) + Format('%.2f', [racun.Price]) + DupeString(' ', 12 - Length(Format('%.2f', [racun.Price]))) + Format('%.2f', [racun.Sum - racun.Naknada * racun.Number]));
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
    popust := popust + racun.Price * racun.Number * racun.Popust / 100 ;
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
  lines4.Add('OIB: ' + oib);
  lines4.Add('');
  lines4.Add('');
  lines4.Add('                RAÈUN BROJ ' + racunBr + '/' + poslovnica + '/' + kasabr);
  lines4.Add('');
  lines4.Add('Datum raèuna: ' + date + '    Vrijeme: ' + time);
  lines4.Add('');
  lines4.Add('');

  if (vrstaRac = '1') or (vrstaRac = '4') then
  begin
  if Length(aporez2) <> 0 then
  begin
    if vrstaRac = '1' then
    lines4.Add('R-1 raèun podaci: ');

    if vrstaRac = '4' then
    lines4.Add('R-2 raèun podaci: ');

    lines4.Add('  ' + kupac);
    lines4.Add('  ' + kupacAdresa);
    lines4.Add('  ' + kupacOIB);
  end;
  end;

  lines4.Add('');

  lines4.Add('Raèun izdao = ' + blagajnik);
  lines4.Add('JIR = ' + jir);
  lines4.Add('ZKI = ' + zki);
  lines4.Add('');

  if (vrstaRac = '1') or  (vrstaRac = '2') or  (vrstaRac = '4') then
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

  if StrToFloat(ambUkupno) <> 0 then
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


function PrintOnMemo(namePrinter, title1, title2, title3, date, time, oib, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum, vrstaRac : String; racunList : TList) : TStringList;
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
  lines4 : TStringList;
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
  lines4 := TStringList.Create;

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

  sumNaknada := 0; popust := 0; kolNaknada := 0;
  for i := racunList.Count -1 downto 0 do
  begin
    racun := racunList.Items[i];
    sumNaknada := sumNaknada + racun.Naknada * racun.Number;
    popust := popust + racun.Number * racun.Price * racun.Popust / 100;
        if racun.Naknada <> 0 then
      kolNaknada := kolNaknada + racun.Number;
  end;
  naknada := Format('%.2f', [sumNaknada]);

  if sumNaknada <> 0 then
  begin
    //lines.Add('Povratna naknada 0,5    ' + Format('%.2f', [kolNaknada]) + DupeString(' ', 10 - Length(Format('%.2f', [kolNaknada]))) + Format('%.2f', [sumNaknada]));
    //lines3.Add('Povratna naknada 0,5 ' + Format('%.2f', [kolNaknada]) + DupeString(' ', 13 - Length(Format('%.2f', [kolNaknada]))) + Format('%.2f', [sumNaknada]));
  end;

  lines4.Add(title1);
  lines4.Add(title2);
  lines4.Add(title3);
  lines4.Add('OIB : ' + oib);
  lines4.Add('');
  lines4.Add('RAÈUN: ' + racunBr + '/' + poslovnica + '/' + kasabr);
  lines4.Add('Datum: ' + date + '   Vrijeme: ' + time);
  lines4.Add('');

  if (vrstaRac = '1') or (vrstaRac = '4') then
  begin
    if Length(aporez2) <> 0 then
    begin
        lines4.Add(Form11.naziv);
        lines4.Add(Form11.adresa);
        lines4.Add(Form11.oib);

        if vrstaRac = '1' then
        lines4.Add('R-1');

        if vrstaRac = '4' then
        lines4.Add('R-2');

    end;
  end;

  if (vrstaRac = '1') or  (vrstaRac = '2') or  (vrstaRac = '4') then
  begin
  if Length(aporez2) <> 0 then
  begin
    lines4.Add('Šifra       PDV       Cijena  JM');
    lines4.Add('Naziv                Kolièina      Iznos');
    lines4.Add('========================================');

    for i:= 0 to lines.Count -1 do
    begin
      lines4.Add(lines[i]);
    end;

    lines.Free;
    lines4.Add('========================================');

    lines4.Add('UKUPNO kn:                       ' + Format('%.2f', [StrToFloat(ukupno)]));

    if popust <> 0 then
    begin
      lines4.Add('POPUST kn:                       ' + Format('%.2f', [popust]));
    end;

    lines4.Add('Stopa     Osnovica      PDV      Ukupno');
    lines4.Add('----------------------------------------');

    p := 0;
    for k := Low(aporez2) to High(aporez2) do
    begin
      lines4.Add(Format('%.2f', [aporez2[k]]) + DupeString(' ', 11 - Length(Format('%.2f', [aporez2[k]]))) + Format('%.2f', [bporez[p]]) + DupeString(' ', 11 - Length(Format('%.2f', [bporez[p]]))) + Format('%.2f', [bporez[p + 1]]) + DupeString(' ', 11 - Length(Format('%.2f', [bporez[p+1]]))) + Format('%.2f', [bporez[p + 2]]));
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

    lines4.Add('----------------------------------------');
    lines4.Add('Uk.        ' + Format('%.2f', [ukOsnovica]) + DupeString(' ', 11 - Length(Format('%.2f', [ukOsnovica]))) + Format('%.2f', [ukPorez]) + DupeString(' ', 11 - Length(Format('%.2f', [ukPorez]))) + Format('%.2f', [ukUkupno]));

    if Form5.posTip = '0' then
    begin
      lines4.Add('Povratna naknada                  ' + naknada);
    end;
    if Form5.posTip = '1' then
    begin
        lines4.Add('Porez na potrošnju               ' + Format('%.2f', [ukpnp]));
    end;
  end;
  end
  else
  begin
    lines4.Add('========================================');
    lines4.Add('Naziv artikla        KOM  Cijena  Ukupno');

    lines4.Add('----------------------------------------');

    for i:= 0 to lines3.Count -1 do
    begin
      lines4.Add(lines3[i]);
    end;
    lines3.Free;

    lines4.Add('========================================');

    if popust <> 0 then
    begin
      lines4.Add('POPUST kn:                       ' + Format('%.2f', [popust]));
    end;

    lines4.Add('UKUPNO kn:                       ' + Format('%.2f', [StrToFloat(ukupno)]));
    lines4.Add('----------------------------------------');

    lines4.Add('NE NALAZIMO SE U SUSTAVU PDV-a');
    lines4.Add('----------------------------------------');

    if Form5.posTip = '0' then
    begin
      lines4.Add('Povratna naknada                  ' + naknada);
    end;

    if Form5.posTip = '1' then
    begin
      if (ukPnp > 0) then
        lines4.Add('Porez na potrošnju               ' + Format('%.2f', [ukpnp]));
    end;
  end;

  if StrToFloat(ambUkupno) <> 0 then
  begin
    lines4.Add('Otkup ambalaže');
    lines4.Add('----------------------------------------');

    lines4.Add('PET ambalaža' + DupeString(' ', 10) + ambPet + ' kom' + DupeString(' ', 7 - Length(ambPet)) + petsum);

    lines4.Add('Staklena ambalaža' + DupeString(' ', 5) + ambStaklo + ' kom' + DupeString(' ', 7 - Length(ambStaklo)) + staklosum);

    lines4.Add('Al-Fe ambalaža' + DupeString(' ', 8) + ambAlfe + ' kom' + DupeString(' ', 7 - Length(ambAlfe)) + alfesum);
    lines4.Add('----------------------------------------');
    lines4.Add('Ukupno' + DupeString(' ', 16) + ambUkupno + ' kom' + DupeString(' ', 7 - Length(ambUkupno)) + totalsum);
    lines4.Add('UKUPNO kn :' + DupeString(' ', 27 - Length(Format('%.2f', [StrToFloat(ukupno) - StrToFloat(totalsum)]))) + Format('%.2f', [StrToFloat(ukupno) - StrToFloat(totalsum)]));

  end;

  lines4.Add('Blagajnik: ' + pretvoriHrv(blagajnik));
  lines4.Add('Naèin plaæanja:  ' + pretvoriHrv(nacinPlacanja));

  lines4.Add('ZKI:' + zki);
  lines4.Add('JIR:' + jir);

  lines4.Add(pozporuka1);
  lines4.Add(pozPoruka2);

  Result := lines4;

end;

procedure PrintOnDotMatrix2(namePrinter, title1, title2, title3, date, time, oib, racunBr, poslovnica, kasabr, ukupno, osnovica, porez, naknada, pnp, blagajnik, nacinPlacanja, jir, zki, pozporuka1, pozPoruka2, ambUkupno, ambPet, ambAlfe, ambStaklo, alfesum, staklosum, petsum, totalsum, vrstaRac, kupac, kupacAdresa, kupacOIB : String; racunList : TList);
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
  s := 'OIB: ' + oib;
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

  if ( vrstaRac = '1') or (vrstaRac = '4') then
  begin
  if Length(aporez2) <> 0 then
  begin
    if Form5.hrSlova = '1' then
    begin
      s := pretvoriHrv(kupac);
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := pretvoriHrv(kupacAdresa);
      WritePrinter(Handle, PChar(s), Length(s), N);
    end
    else
    begin
      s := pretvoriEng(kupac);
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := #10;
      WritePrinter(Handle, PChar(s), Length(s), N);
      s := pretvoriEng(kupacAdresa);
      WritePrinter(Handle, PChar(s), Length(s), N);
    end;

    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := kupacOIB;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);

    if vrstaRac = '1' then
      s := 'R-1';

    if vrstaRac = '4' then
      s := 'R-2';

    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
    s := #10;
    WritePrinter(Handle, PChar(s), Length(s), N);
  end;
  end;

  if (vrstaRac = '1') or  (vrstaRac = '2') or  (vrstaRac = '4') then
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

procedure TForm15.Button4Click(Sender: TObject);
begin
  Form15.Close;
end;

procedure TForm15.FormShow(Sender: TObject);
begin
  ComboBox1.Text := 'Svi blagajnici';
  GroupBox1.Visible := true;
  //GroupBox3.Visible := false;
  RadioButton1.Checked := true;

end;

procedure TForm15.FormCreate(Sender: TObject);
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

  EnableMenuItem(GetSystemMenu(Form15.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);

  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM Users');
    Open;
  end;

  ComboBox1.Items.Add('Svi blagajnici');

  while not ADOQuery1.Eof do
  begin
    ComboBox1.Items.Add(ADOQuery1.FieldByName('User').AsString);
    ADOQuery1.Next;
  end;

end;

procedure TForm15.Button1Click(Sender: TObject);
var
  datum1 : String;
  datum2 : String;
  oib : String;
  racun : TRacunData;
  racunList : TList;
  i : Integer;
  k : Integer;
  racunList2 : TList;
  racun2 : TRacunData;
  provjera : Boolean;
  ukupno : Double;
  oibS : String;
  popust : Double;
  lines2 : TStringList;
  myFile : TextFile;
  index : Integer;
  naknada : Double;
  kolNaknada : Double;

begin
  datum1 := FormatDateTime('mm/dd/yyyy', DateTimePicker1.Date);
  datum2 := FormatDateTime('mm/dd/yyyy', (DateTimePicker2.Date + 1));

  datum1 := StringReplace(datum1 , '.', '/', [rfReplaceAll, rfIgnoreCase]);
  datum2 := StringReplace(datum2 , '.', '/', [rfReplaceAll, rfIgnoreCase]);

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
        Open;
  end;
  oibS := DataSource2.DataSet.Fields[0].Value;


  if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

  if GroupBox3.Visible = false then
  begin
  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2));
      SQL.Add('Select * FROM Receipts WHERE Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#'  );
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND (Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2) + ')');
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#');
      Open;
    end;
  end;
  end
  else
  begin
  if IsNumeric2(Edit1.Text) = false then
    Edit1.Text := '0';
  if IsNumeric2(Edit2.Text) = false then
    Edit2.Text := '0';

  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text);
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND ( Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text + ')' );
      Open;
    end;
  end;
  end;

  racunList2 := TList.Create;

  while not ADOQuery1.Eof do
  begin

  racunList := TList.Create;

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM TReceipts WHERE Receipt_ID=' + ADOQuery1.FieldByName('Receipt_ID').AsString);
      Open;
    end;

    while not ADOQuery2.Eof do
    begin
      racun := TRacunData.Create;

      with racun do
      begin
        ID := ADOQuery2.FieldByName('Item_ID').AsString;
        Name := ADOQuery2.FieldByName('Item_Name').AsString;

        if StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Number := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Number := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Price := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Price := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Tax := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Tax := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          TaxPNP := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          TaxPNP := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Popust := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Popust := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Naknada := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Naknada := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Sum := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Sum := 0;
      end;
      ADOQuery2.Next;
      racunList.Add(racun);
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Sum := racun.Price * racun.Number - (racun.Popust * racun.Number * racun.Price / 100) + racun.Naknada * racun.Number;
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      provjera := false;

      for k := racunList2.Count - 1 downto 0 do
      begin
        racun2 := racunList2.Items[k];
        if racun.ID = racun2.ID then
          provjera := true;
      end;

      if provjera = false then
      begin
        racun2 := TRacunData.Create;
        racun2.ID := racun.ID;
        racun2.Name := racun.Name;
        racun2.Number := racun.Number;
        racun2.Price := racun.Price;
        racun2.Tax := racun.Tax;
        racun2.TaxPNP := racun.TaxPNP;
        racun2.Popust := racun.Popust * racun.Number * racun.Price / 100;
        racun2.Naknada := racun.Naknada;
        racun2.Sum := racun.Sum;
        racunList2.Add(racun2);
      end
      else
      begin
        for k := racunList2.Count - 1 downto 0 do
        begin
          racun2 := racunList2.Items[k];
          if racun.ID = racun2.ID then
          begin
            racun2.Sum := racun2.Sum + racun.Sum;
            racun2.Popust := racun2.Popust + racun.Number * racun.Popust * racun.Price / 100;
            racun2.Number := racun2.Number + racun.Number;
          end;
        end;
      end;

    end;

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Free;
    end;

    racunList.Clear;

    ADOQuery1.Next;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
    Open;
  end;


  lines2 := TStringList.Create;
  lines := TStringList.Create;
  lines.Add('');
  lines.Add('');

  lines2.Add('');

  lines2.Add('OIB: ' + oibS);
  lines.Add('OIB: ' + oibS);

  lines2.Add('');
  lines2.Add('              Pregled prometa po prodanim artiklima');
  lines2.Add('');
  lines2.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines2.Add('Za blagajnika: ' + ComboBox1.Text);
  lines2.Add('');
  lines2.Add('________________________________________________________________');
  lines2.Add('');
  lines2.Add('ŠIFRA         NAZIV                             KOM      IZNOS');
  lines2.Add('________________________________________________________________');
  lines2.Add('');

  lines.Add('');
  lines.Add('           Pregled prometa');
  lines.Add('        po prodanim artiklima');
  lines.Add('');
  lines.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines.Add('Za blagajnika: ' + ComboBox1.Text);
  lines.Add('');
  lines.Add('Šifra Naziv                 KOM    Iznos');
  lines.Add('----------------------------------------');

  ukupno := 0; popust := 0; naknada := 0;
  for i := racunList2.Count - 1 downto 0 do
  begin

    racun := racunList2.Items[i];

    if racun.Naknada <> 0 then
      kolNaknada := kolNaknada + racun.Number;

    naknada := naknada + racun.Naknada * racun.Number;
    popust := popust + racun.Popust;
    ukupno := ukupno + racun.Sum;
    lines.Add(racun.ID + ' ' + racun.Name);
    lines.Add( DupeString(' ', 27) + Format('%.2f', [racun.Number]) + DupeString(' ', 7 - Length(Format('%.2f', [racun.Number]))) + Format('%.2f', [racun.Sum - racun.Number * racun.Naknada]));

    lines2.Add(racun.ID + DupeString(' ', 14 - Length(racun.ID)) + racun.Name + DupeString(' ', 34 - Length(racun.Name)) + Format('%.2f', [racun.Number]) + DupeString(' ', 9 - Length(Format('%.2f', [racun.Number]))) + Format('%.2f', [racun.Sum - racun.Number * racun.Naknada]))
  end;

  if naknada <> 0 then
  begin
    lines.Add('Povratna naknada 0,5');
    lines.Add( DupeString(' ', 27) + Format('%.2f', [kolNaknada]) + DupeString(' ', 7 - Length(Format('%.2f', [kolNaknada]))) + Format('%.2f', [naknada]));
    lines2.Add('Povratna naknada 0,5' + DupeString(' ', 28) + Format('%.2f', [kolNaknada]) + DupeString(' ', 9 - Length(Format('%.2f', [kolNaknada]))) + Format('%.2f', [naknada]))
  end;

  lines2.Add('________________________________________________________________');
  lines2.Add('');

  lines2.Add('UKUPNO:' + DupeString(' ', 50) + Format('%.2f', [ukupno]));

  if popust <> 0 then
    lines2.Add('POPUST:' + DupeString(' ', 50) + Format('%.2f',[popust]));

  if naknada <> 0 then
    lines2.Add('NAKNADA:' + DupeString(' ', 49) + Format('%.2f',[naknada]));

  lines.Add('----------------------------------------');
  lines.Add('UKUPNO:' + DupeString(' ', 27) + Format('%.2f', [ukupno]));

  if popust <> 0 then
    lines.Add('POPUST:' + DupeString(' ', 27) + Format('%.2f', [popust]));

  if naknada <> 0 then
    lines.Add('NAKNADA:' + DupeString(' ', 26) + Format('%.2f', [naknada]));

  //if popust <> 0 then
    //lines.Add('POPUST:' + DupeString(' ', 27) + Format('%.2f', [popust]));

   //if popust <> 0 then
    //lines2.Add('POPUST:' + DupeString(' ', 50) + Format('%.2f', [popust]));

  for i := racunList2.Count - 1 downto 0 do
  begin
    racun := racunList2.Items[i];
    racun.Free;
  end;

  racunList2.Clear;

  Form16.ShowModal;

  if Form16.buttonOK = true then
  begin
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
      Open;
    end;

    if DataSource2.DataSet.Fields[0].Value = 0 then
      PrintOnDotMatrix(Form5.printer, lines);

    if DataSource2.DataSet.Fields[0].Value = 1 then
    begin
      index := Printers.printer.Printers.IndexOf(Form5.printer);
      Printers.Printer.PrinterIndex := index;

      Printers.Printer.Canvas.Font.Name := 'Courier New';
      Printers.Printer.Canvas.Font.Size := 12;

      AssignPrn(myFile);
      ReWrite(myFile);

      for i := 0 to 3 do
        WriteLn(myFile, '');

      for i := 0 to lines2.Count - 1 do
      begin
        Write(myFile, '       ');
        Writeln(myFile, lines2[i]);
      end;

      CloseFile(myFile);
    end;
  end;

  lines.Free;
  lines2.Free;

end;

procedure TForm15.Button3Click(Sender: TObject);
var
  datum1 : String;
  datum2 : String;
  oib : String;
  racun : TRacunData;
  racunList : TList;
  i : Integer;
  k : Integer;
  racunList2 : TList;
  racun2 : TRacunData;
  provjera : Boolean;
  ukupno : Double;
  oibS : String;
  myFile : TextFile;
  index : Integer;
  lines2 : TStringList;
  naknada : Double;

begin

   datum1 := FormatDateTime('mm/dd/yyyy', DateTimePicker1.Date);
  datum2 := FormatDateTime('mm/dd/yyyy', (DateTimePicker2.Date + 1));

  datum1 := StringReplace(datum1 , '.', '/', [rfReplaceAll, rfIgnoreCase]);
  datum2 := StringReplace(datum2 , '.', '/', [rfReplaceAll, rfIgnoreCase]);

      with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
        Open;
  end;
  oibS := DataSource2.DataSet.Fields[0].Value;


  if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

    if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

  if GroupBox3.Visible = false then
  begin
  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2));
      SQL.Add('Select * FROM Receipts WHERE Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#'  );
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND (Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2) + ')');
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#');
      Open;
    end;
  end;
  end
  else
  begin
  if IsNumeric2(Edit1.Text) = false then
    Edit1.Text := '0';
  if IsNumeric2(Edit2.Text) = false then
    Edit2.Text := '0';

  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text);
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND ( Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text + ')' );
      Open;
    end;
  end;
  end;

  racunList2 := TList.Create;

  while not ADOQuery1.Eof do
  begin

  racunList := TList.Create;

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts LEFT JOIN TReceipts ON Receipts.Receipt_ID = TReceipts.Receipt_ID WHERE Receipts.Receipt_ID=' + ADOQuery1.FieldByName('Receipt_ID').AsString);
      Open;
    end;

    while not ADOQuery2.Eof do
    begin
      racun := TRacunData.Create;

      with racun do
      begin
        ID := ADOQuery2.FieldByName('Item_ID').AsString;
        Name := ADOQuery2.FieldByName('Item_Name').AsString;

        if StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Number := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Number := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Price := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Price := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Tax := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Tax := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          TaxPNP := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          TaxPNP := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Popust := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Popust := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Naknada := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Naknada := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Sum := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase])) + Naknada * Number
        else
          Sum := 0;

        if ADOQuery2.FieldByName('Receipt_PaymentID').IsNull = false then
          Nacin := ADOQuery2.FieldByName('Receipt_PaymentID').AsString
        else
          Nacin := '';

      end;
      ADOQuery2.Next;
      racunList.Add(racun);
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Sum := racun.Price * racun.Number - racun.Popust * racun.Price * racun.Number / 100 + (racun.Naknada * racun.Number);
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      provjera := false;

      for k := racunList2.Count - 1 downto 0 do
      begin
        racun2 := racunList2.Items[k];
        if racun.Nacin = racun2.Nacin then
          provjera := true;
      end;

      if provjera = false then
      begin
        racun2 := TRacunData.Create;
        racun2.ID := racun.ID;
        racun2.Name := racun.Name;
        racun2.Number := racun.Number;
        racun2.Price := racun.Price;
        racun2.Tax := racun.Tax;
        racun2.TaxPNP := racun.TaxPNP;
        racun2.Popust := racun.Popust;
        racun2.Naknada := racun.Naknada;
        racun2.Sum := racun.Sum;
        racun2.Nacin := racun.Nacin;
        racunList2.Add(racun2);
      end
      else
      begin
        for k := racunList2.Count - 1 downto 0 do
        begin
          racun2 := racunList2.Items[k];
          if racun.Nacin = racun2.Nacin then
          begin
            racun2.Sum := racun2.Sum + racun.Sum;
            racun2.Number := racun2.Number + racun.Number;
          end;
        end;
      end;

    end;

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Free;
    end;

    racunList.Clear;

    ADOQuery1.Next;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
    Open;
  end;

  lines := TStringList.Create;
  lines2 := TStringList.Create;
  lines.Add('');
  lines.Add('');

  lines2.Add('');

  lines2.Add('OIB: ' + oibS);
  lines.Add('OIB: ' + oibS);

  lines2.Add('');

  lines2.Add('            Pregled prometa po naèinima plaæanja');

  lines2.Add('');
  lines2.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines2.Add('Za blagajnika: ' + ComboBox1.Text);
  lines2.Add('');
  lines2.Add('________________________________________________________________');
  lines2.Add('');
  lines2.Add('Naèin plaæanja                                          IZNOS');
  lines2.Add('________________________________________________________________');
  lines2.Add('');

  lines.Add('');
  lines.Add('           Pregled prometa');
  lines.Add('         po naèinima plaæanja');
  lines.Add('');
  lines.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines.Add('Za blagajnika: ' + ComboBox1.Text);
  lines.Add('');
  lines.Add('Naèin plaæanja                     Iznos');
  lines.Add('----------------------------------------');
  lines.Add('');

  ukupno := 0;  naknada := 0;
  for i := racunList2.Count - 1 downto 0 do
  begin

    racun := racunList2.Items[i];
    ukupno := ukupno + racun.Sum;
    naknada := naknada + racun.Naknada * racun.Number;
    lines2.Add(racun.Nacin + DupeString(' ', 56 - Length(racun.Nacin)) + Format('%.2f', [racun.Sum]));
    lines.Add(racun.Nacin);
    lines.Add( DupeString(' ', 33) + Format('%.2f', [racun.Sum]));
    lines.Add('');

  end;

  lines2.Add('________________________________________________________________');
  lines.Add('----------------------------------------');
  lines.Add('');
  lines2.Add('');
  lines2.Add('UKUPNO:' + DupeString(' ', 49) + Format('%.2f', [ukupno]));
  lines.Add('UKUPNO:' + DupeString(' ', 27) + Format('%.2f', [ukupno]));

  if naknada <> 0 then
  begin
    lines2.Add('NAKNADA:' + DupeString(' ', 48) + Format('%.2f', [naknada]));
    lines.Add('NAKNADA:' + DupeString(' ', 26) + Format('%.2f', [naknada]));
  end;

  for i := racunList2.Count - 1 downto 0 do
  begin
    racun := racunList2.Items[i];
    racun.Free;
  end;

  racunList2.Clear;

  Form16.ShowModal;

  if Form16.buttonOK = true then
  begin
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
      Open;
    end;

    if DataSource2.DataSet.Fields[0].Value = 0 then
      PrintOnDotMatrix(Form5.printer, lines);

    if DataSource2.DataSet.Fields[0].Value = 1 then
    begin
      index := Printers.printer.Printers.IndexOf(Form5.printer);
      Printers.Printer.PrinterIndex := index;

      Printers.Printer.Canvas.Font.Name := 'Courier New';
      Printers.Printer.Canvas.Font.Size := 12;

      AssignPrn(myFile);
      ReWrite(myFile);

      for i := 0 to 3 do
        WriteLn(myFile, '');

      for i := 0 to lines2.Count - 1 do
      begin
        Write(myFile, '       ');
        Writeln(myFile, lines2[i]);
      end;

      CloseFile(myFile);
    end;
  end;

  lines2.Free;
  lines.Free;
end;

procedure TForm15.Button2Click(Sender: TObject);

var
  datum1 : String;
  datum2 : String;
  oib : String;
  racun : TRacunData;
  racunList : TList;
  i : Integer;
  k : Integer;
  racunList2 : TList;
  racun2 : TRacunData;
  provjera : Boolean;
  ukupno : Double;
  osnovica : Double;
  pdv : Double;
  pnp : Double;
  lista : TList;
  popust : Double;
  oibS : String;
  lines2 : TStringList;
  index : Integer;
  myFile : TextFile;

begin

  datum1 := FormatDateTime('mm/dd/yyyy', DateTimePicker1.Date);
  datum2 := FormatDateTime('mm/dd/yyyy', (DateTimePicker2.Date + 1));

  datum1 := StringReplace(datum1 , '.', '/', [rfReplaceAll, rfIgnoreCase]);
  datum2 := StringReplace(datum2 , '.', '/', [rfReplaceAll, rfIgnoreCase]);

    with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
        Open;
  end;
  oibS := DataSource2.DataSet.Fields[0].Value;


  if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

    if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

  if GroupBox3.Visible = false then
  begin
  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2));
      SQL.Add('Select * FROM Receipts WHERE Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#'  );
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND (Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2) + ')');
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#');
      Open;
    end;
  end;
  end
  else
  begin
  if IsNumeric2(Edit1.Text) = false then
    Edit1.Text := '0';
  if IsNumeric2(Edit2.Text) = false then
    Edit2.Text := '0';

  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text);
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND ( Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text + ')' );
      Open;
    end;
  end;
  end;

  lista := TList.Create;
  racunList2 := TList.Create;

  while not ADOQuery1.Eof do
  begin

  racunList := TList.Create;

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM TReceipts WHERE Receipt_ID=' + ADOQuery1.FieldByName('Receipt_ID').AsString);
      Open;
    end;

    while not ADOQuery2.Eof do
    begin
      racun := TRacunData.Create;

      with racun do
      begin
        ID := ADOQuery2.FieldByName('Item_ID').AsString;
        Name := ADOQuery2.FieldByName('Item_Name').AsString;

        if StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Number := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Number := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Price := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Price := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Tax := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Tax := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          TaxPNP := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          TaxPNP := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Popust := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Popust := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Naknada := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Naknada := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Sum := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Sum := 0;

      end;
      ADOQuery2.Next;
      racunList.Add(racun);
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];

      racun.Sum := racun.Price * racun.Number - (racun.Popust * racun.Number * racun.Price / 100) + racun.Naknada * racun.Number;

      if racun.TaxPNP <> 0 then
        begin
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
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      provjera := false;

      for k := racunList2.Count - 1 downto 0 do
      begin
        racun2 := racunList2.Items[k];
        if racun.Tax = racun2.Tax then
          provjera := true;
      end;

      if provjera = false then
      begin
        racun2 := TRacunData.Create;
        racun2.ID := racun.ID;
        racun2.Name := racun.Name;
        racun2.Number := racun.Number;
        racun2.Price := racun.Price;
        racun2.Tax := racun.Tax;
        racun2.TaxPNP := racun.TaxPNP;
        racun2.Popust := racun.Popust;
        racun2.Naknada := racun.Naknada;
        racun2.Sum := racun.Sum;
        racun2.iznosPocetni := racun.iznosPocetni;
        racun2.iznosPoreza := racun.iznosPoreza;
        racun2.iznosUkupno := racun.iznosUkupno;
        racun2.iznospnp := racun.iznospnp;
        racunList2.Add(racun2);
      end
      else
      begin
        for k := racunList2.Count - 1 downto 0 do
        begin
          racun2 := racunList2.Items[k];
          if racun.Tax = racun2.Tax then
          begin
            racun2.Sum := racun2.Sum + racun.Sum;
            racun2.iznosPocetni := racun2.iznosPocetni + racun.iznosPocetni;
            racun2.iznosPoreza := racun2.iznosPoreza + racun.iznosPoreza;
            racun2.iznospnp := racun2.iznospnp + racun.iznospnp;
            racun2.iznosUkupno := racun2.iznosUkupno + racun.iznosUkupno;
            racun2.Number := racun2.Number + racun.Number;
          end;
        end;
      end;

    end;

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Free;
    end;

    racunList.Clear;

    ADOQuery1.Next;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
    Open;
  end;

  lines := TStringList.Create;
  lines2 := TStringList.Create;
  lines.Add('');
  lines.Add('');
  lines2.Add('');
  lines2.Add('');

  lines2.Add('OIB: ' + oibs);
  lines.Add('OIB: ' + oibS);

  lines2.Add('');

  lines2.Add('             Pregled prometa po tarifnim brojevima');
  lines2.Add('');
  lines2.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines2.Add('Za blagajnika: ' + ComboBox1.Text);
  lines2.Add('________________________________________________________________');
  lines2.Add('');
  lines2.Add('STOPA                OSNOVICA            PDV           UKUPNO');
  lines2.Add('________________________________________________________________');
  lines2.Add('');

  lines.Add('');
  lines.Add('           Pregled prometa');
  lines.Add('        po tarifnim brojevima');
  lines.Add('');
  lines.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines.Add('Za blagajnika: ' + ComboBox1.Text);
  lines.Add('');
  lines.Add('Stopa     Osnovica       PDV      Ukupno');
  lines.Add('----------------------------------------');
  ukupno := 0; osnovica := 0; pdv := 0; pnp := 0; popust := 0;
  for i := racunList2.Count - 1 downto 0 do
  begin

    racun := racunList2.Items[i];
    popust := popust + racun.Price * racun.Number * racun.Popust / 100;
    ukupno := ukupno + racun.Sum;
    osnovica := osnovica + racun.iznosPocetni;
    pdv := pdv + racun.iznosPoreza;
    pnp := pnp + racun.iznospnp;
    lines.Add(Format('%.2f', [racun.Tax]) + '%' + DupeString(' ', 9 - Length(Format('%.2f', [racun.Tax]))) + Format('%.2f', [racun.iznosPocetni]) + DupeString(' ', 14 - Length(Format('%.2f', [racun.iznosPocetni]))) + Format('%.2f', [racun.iznosPoreza]) + DupeString(' ', 10 - Length(Format('%.2f', [racun.iznosPoreza]))) + Format('%.2f', [racun.iznosUkupno]));
    lines2.Add(Format('%.2f', [racun.Tax]) + '%' + DupeString(' ', 21 - Length(Format('%.2f', [racun.Tax]))) + Format('%.2f', [racun.iznosPocetni]) + DupeString(' ', 20 - Length(Format('%.2f', [racun.iznosPocetni]))) + Format('%.2f', [racun.iznosPoreza]) + DupeString(' ', 14 - Length(Format('%.2f', [racun.iznosPoreza]))) + Format('%.2f', [racun.iznosUkupno]));
    lines2.Add('');
  end;

  if pnp > 0 then
    lines.Add('PNP                         ' + Format('%.2f', [pnp]));

  if pnp > 0 then
  begin

    lines2.Add('PNP' + DupeString(' ', 60) + Format('%.2f', [pnp]));
    lines2.Add('');
    
  end;

  lines.Add('');


  lines2.Add('________________________________________________________________');
  lines.Add('----------------------------------------');
  lines.Add('');
  lines2.Add('');
  lines2.Add('UKUPNO:               ' + Format('%.2f', [osnovica]) + DupeString(' ', 20 - Length(Format('%.2f', [osnovica]))) + Format('%.2f', [pdv]) + DupeString(' ', 14 - Length(Format('%.2f', [pdv]))) + Format('%.2f', [ukupno]));
  lines.Add('UKUPNO:');
  lines.Add('          ' + Format('%.2f', [osnovica]) + DupeString(' ', 14 - Length(Format('%.2f', [osnovica]))) + Format('%.2f', [pdv]) + DupeString(' ', 10 - Length(Format('%.2f', [pdv]))) + Format('%.2f', [ukupno]));

  for i := racunList2.Count - 1 downto 0 do
  begin
    racun := racunList2.Items[i];
    racun.Free;
  end;

  racunList2.Clear;

  Form16.ShowModal;

  if Form16.buttonOK = true then
  begin
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
      Open;
    end;

    if DataSource2.DataSet.Fields[0].Value = 0 then
      PrintOnDotMatrix(Form5.printer, lines);

    if DataSource2.DataSet.Fields[0].Value = 1 then
    begin
      index := Printers.printer.Printers.IndexOf(Form5.printer);
      Printers.Printer.PrinterIndex := index;

      Printers.Printer.Canvas.Font.Name := 'Courier New';
      Printers.Printer.Canvas.Font.Size := 12;

      AssignPrn(myFile);
      ReWrite(myFile);

      for i := 0 to 3 do
        WriteLn(myFile, '');

      for i := 0 to lines2.Count - 1 do
      begin
        Write(myFile, '       ');
        Writeln(myFile, lines2[i]);
      end;

      CloseFile(myFile);

    end;

  end;

  lines2.Free;
  lines.Free;

end;

procedure TForm15.RadioButton2Click(Sender: TObject);
begin
  GroupBox3.Visible := true;
  GroupBox1.Visible := false;
end;

procedure TForm15.RadioButton1Click(Sender: TObject);
begin
  GroupBox3.Visible := false;
  GroupBox1.Visible := true;
end;

procedure TForm15.Button5Click(Sender: TObject);

var
  datum1 : String;
  datum2 : String;
  oib : String;
  racun : TRacunData;
  racun2 : TRacunData;
  racunList : TList;
  data : TPrinterData;
  i : Integer;
  k : Integer;
  racunList2 : TList;
  provjera : Boolean;
  ukupno : Double;
  osnovica : Double;
  pdv : Double;
  pnp : Double;
  kasabr : String;
  poslovnica : String;
  title1 : String;
  title2 : String;
  title3 : String;
  footer1 : String;
  footer2 : String;
  suma : Double;
  petsum : Double;
  staklosum : Double;
  alfesum : Double;
  petnum : Integer;
  staklonum : Integer;
  alfenum : Integer;
  totalsum : Double;
  totalnum : Integer;
  oibs : String;
  lines2 : TStringList;
  vrsta : String;
  sumNaknada : Double;
  pnpUkupno : Double;
  naknadaUkupno : Double;
  datumIvrijeme1 : String;
  datumIvrijeme2 : String;
  popust : Double;
  oibCashier : String;
  oibPoslovnica: String;

begin

  datum1 := FormatDateTime('mm/dd/yyyy', DateTimePicker1.Date);
  datum2 := FormatDateTime('mm/dd/yyyy', (DateTimePicker2.Date + 1));

  datum1 := StringReplace(datum1 , '.', '/', [rfReplaceAll, rfIgnoreCase]);
  datum2 := StringReplace(datum2 , '.', '/', [rfReplaceAll, rfIgnoreCase]);

  with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
        Open;
  end;
  oibPoslovnica := DataSource2.DataSet.Fields[0].Value;

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

  if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

  if GroupBox3.Visible = false then
  begin
  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2));
      SQL.Add('Select * FROM Receipts WHERE Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#'  );
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND (Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2) + ')');
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#');
      Open;
    end;
  end;
  end
  else
  begin
  if IsNumeric2(Edit1.Text) = false then
    Edit1.Text := '0';
  if IsNumeric2(Edit2.Text) = false then
    Edit2.Text := '0';

  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text);
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND ( Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text + ')' );
      Open;
    end;
  end;
  end;

  lines := TStringList.Create;
  racunList2 := TList.Create;

  while not ADOQuery1.Eof do
  begin

  racunList := TList.Create;

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM TReceipts WHERE Receipt_ID=' + ADOQuery1.FieldByName('Receipt_ID').AsString);
      Open;
    end;

    oibCashier := ADOQuery1.FieldByName('Receipt_UserOIB').AsString;

    while not ADOQuery2.Eof do
    begin
      racun := TRacunData.Create;

      with racun do
      begin
        ID := ADOQuery2.FieldByName('Item_ID').AsString;
        Name := ADOQuery2.FieldByName('Item_Name').AsString;

        if StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Number := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Number := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Price := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Price := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Tax := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Tax := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          TaxPNP := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          TaxPNP := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Popust := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Popust := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Naknada := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Naknada := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Sum := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Sum := 0;

      end;
      ADOQuery2.Next;
      racunList.Add(racun);
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Sum := racun.Price * racun.Number - racun.Popust * racun.Price * racun.Number / 100 + racun.Naknada * racun.Number;
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      if racun.TaxPNP <> 0 then
        begin
          racun.iznospnp := (((racun.Price - (racun.Price * racun.Popust / 100 )) * racun.TaxPNP)/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosPoreza := (((racun.Price - (racun.Price * racun.Popust / 100 )) * racun.Tax)/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosPocetni := ((100 * (racun.Price - (racun.Price * racun.Popust / 100 )))/(100 + racun.Tax + racun.TaxPNP)) * racun.Number;
          racun.iznosUkupno := racun.iznosPocetni + racun.iznosPoreza;
        end
        else
        begin
          racun.iznosPocetni := (((racun.Price - (racun.Price * racun.Popust / 100)) * 100) / (100 + racun.Tax)) * racun.Number;           // pocetni iznos bez poreza
          racun.iznosPoreza := ((racun.Tax * (racun.Price - (racun.Price * racun.Popust / 100))) / (100 + racun.Tax)) * racun.Number;       // iznos poreza u vrijednosti
          racun.iznosUkupno := racun.iznosPocetni + racun.iznosPoreza;
        end;
    end;

    sumNaknada := 0; popust := 0;
    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      sumNaknada := sumNaknada + racun.Number * racun.Naknada;
      popust := popust + racun.Price * racun.Number * racun.Popust / 100;
    end;

    pnpUkupno := 0; naknadaUkupno := 0;
    for i:= racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      naknadaUkupno := naknadaUkupno + racun.Naknada;
      pnpUkupno := pnpUkupno + racun.iznospnp;
    end;

    naknadaUkupno := naknadaUkupno + sumNaknada;
    
    with ADOQuery3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TPack WHERE Receipt_ID=' + ADOQuery1.FieldByName('Receipt_ID').AsString);
      Open;
    end;

    if ADOQuery3.FieldByName('PET').IsNull = false then
      petnum := StrToInt(ADOQuery3.FieldByName('PET').Value)
    else
      petnum := 0;

    if ADOQuery3.FieldByName('Staklo').IsNull = false then
      staklonum := StrToInt(ADOQuery3.FieldByName('Staklo').Value)
    else
      staklonum := 0;

    if ADOQuery3.FieldByName('ALFE').IsNull = false then
      alfenum := StrToInt(ADOQuery3.FieldByName('ALFE').Value)
    else
      alfenum := 0;

    if ADOQuery3.FieldByName('PETAmmount').IsNull = false then
      petsum := StrToFloat(StringReplace(ADOQuery3.FieldByName('PETAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
    else
      petsum := 0;

    if ADOQuery3.FieldByName('StakloAmmount').IsNull = false then
      staklosum := StrToFloat(StringReplace(ADOQuery3.FieldByName('StakloAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
    else
      staklosum := 0;

    if ADOQuery3.FieldByName('ALFEAmmount').IsNull = false then
      alfesum := StrToFloat(StringReplace(ADOQuery3.FieldByName('ALFEAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
    else
      alfesum := 0;

    if ADOQuery3.FieldByName('TotalKn').IsNull = false then
      totalsum := StrToFloat(StringReplace(ADOQuery3.FieldByName('TotalKn').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
    else
      totalsum := 0;

    totalnum := petnum + alfenum + staklonum;

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

    lines2 := TStringList.Create;
    lines2 := PrintOnMemo(Form5.printer, title1, title2, title3, datumIvrijeme1, datumIvrijeme2, oibPoslovnica, ADOQuery1.FieldByName('Receipt_ID').AsString, Form5.posProstor, Form5.naplatniUr, Format('%.2f', [StrToFloat(ADOQuery1.FieldByName('Receipt_Ammount').AsString)]), '', '', '', '', Form1.Name, ADOQuery1.FieldByName('Receipt_PaymentID').AsString, ADOQuery1.FieldByName('Receipt_JIR').AsString, ADOQuery1.FieldByName('Receipt_ZKI').AsString,footer1, footer2, IntToStr(totalnum), IntToStr(petnum), IntToStr(alfenum), IntToStr(staklonum), Format('%.2f', [alfesum]), Format('%.2f', [staklosum]), Format('%.2f', [petsum]), Format('%.2f', [totalsum]), ADOQuery1.FieldByName('Receipt_PP').AsString, racunList );

    data := TPrinterData.Create;
    data.printer := Form5.printer;
    data.placanje := ADOQuery1.FieldByName('Receipt_PaymentID').AsString;
    data.title1 := title1;
    data.title2 := title2;
    data.title3 := title3;
    data.datum1 := datumIvrijeme1;
    data.datum2 := datumIvrijeme2;
    data.oib := oibCashier;
    data.racunID := ADOQuery1.FieldByName('Receipt_ID').AsString;
    data.prostor := Form5.posProstor;
    data.naplatniUr := Form5.naplatniUr;
    data.ukupno := Format('%.2f', [StrToFloat(ADOQuery1.FieldByName('Receipt_Ammount').AsString)]);
    data.name := Form1.Name;
    data.vrsta := ADOQuery1.FieldByName('Receipt_PP').AsString;
    data.jir := ADOQuery1.FieldByName('Receipt_JIR').AsString;
    data.zki := ADOQuery1.FieldByName('Receipt_ZKI').AsString;
    data.footer1 := footer1;
    data.footer2 := footer2;
    data.totalnum := IntToStr(totalnum);
    data.staklonum := IntToStr(staklonum);
    data.alfenum := IntToStr(alfenum);
    data.petnum := IntToStr(petnum);
    data.alfesum := Format('%.2f', [alfesum]);
    data.petsum := Format('%.2f', [petsum]);
    data.totalsum := Format('%.2f', [totalsum]);
    data.staklosum := Format('%.2f', [staklosum]);
    data.kupac := Form11.naziv;
    data.kupacAdresa := Form11.adresa;
    data.kupacOIB := Form11.oib;

    Form11.naziv := '';
    Form11.adresa := '';
    Form11.oib := '';

    data.racunList := TList.Create;

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];

      racun2 := TRacunData.Create;
      racun2.ID := racun.ID;
      racun2.Name := racun.Name;
      racun2.Number := racun.Number;
      racun2.Price := racun.Price;
      racun2.Tax := racun.Tax;
      racun2.TaxPNP := racun.TaxPNP;
      racun2.Popust := racun.Popust;
      racun2.Naknada := racun.Naknada;
      racun2.Sum := racun.Sum;
      racun2.iznosPocetni := racun.iznosPocetni;
      racun2.iznosPoreza := racun.iznosPoreza;
      racun2.iznosUkupno := racun.iznosUkupno;
      racun2.iznospnp := racun.iznospnp;


      data.racunList.Add(racun2);
    end;

    racunList2.Add(data);

    for i := 0 to lines2.Count - 1 do
    begin
      lines.Add(lines2[i]);
    end;
    lines.Add('');
    lines.Add('');
    lines.Add('');
    lines.Add('');

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Free;
    end;

    racunList.Clear;
    lines2.Free;
    ADOQuery1.Next;
  end;

  Form16.ShowModal;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
    Open;
  end;

  if Form16.buttonOK = true then
  begin
    for i := 0 to racunList2.Count - 1 do
    begin
      data := racunList2.Items[i];

      if DataSource2.DataSet.Fields[0].Value = 0 then
        PrintOnDotMatrix2(data.printer, data.title1, data.title2, data.title3, data.datum1, data.datum2, oibPoslovnica, data.racunID, data.prostor, data.naplatniUr, data.ukupno, '', '', '', '', data.name, data.placanje, data.jir, data.zki, data.footer1, data.footer2, data.totalnum, data.petnum, data.alfenum, data.staklonum, data.alfesum, data.staklosum, data.petsum, data.totalsum, data.vrsta, data.kupac, data.kupacAdresa, data.kupacOIB ,data.racunList );

      if DataSource2.DataSet.Fields[0].Value = 1 then
        PrintDocument(data.printer, data.title1, data.title2, data.title3, data.datum1, data.datum2, oibPoslovnica, data.racunID, data.prostor, data.naplatniUr, data.ukupno, '', '', '', '', data.name, data.placanje, data.jir, data.zki, data.footer1, data.footer2, data.totalnum, data.petnum, data.alfenum, data.staklonum, data.alfesum, data.staklosum, data.petsum, data.totalsum, data.vrsta, data.kupac, data.kupacAdresa, data.kupacOIB ,data.racunList );

    end;
  end;

   for i := racunList2.Count - 1 downto 0 do
  begin
    data := racunList2.Items[i];

    for k := data.racunList.Count - 1 downto 0 do
    begin
      racun := data.racunList.Items[k];
      racun.Free;
    end;

    data.Free;
  end;

  racunList2.Clear;

  lines.Free;
  
end;

procedure TForm15.Button7Click(Sender: TObject);
var
  datum1 : String;
  datum2 : String;
  oib : String;
  racun : TRacunData;
  racunList : TList;
  i : Integer;
  k : Integer;
  racunList2 : TList;
  racun2 : TRacunData;
  provjera : Boolean;
  ukupno : Double;
  oibS : String;
  lines2 : TStringList;
  myFile : TextFile;
  index : Integer;
  naknada : Double;

begin

   datum1 := FormatDateTime('mm/dd/yyyy', DateTimePicker1.Date);
  datum2 := FormatDateTime('mm/dd/yyyy', (DateTimePicker2.Date + 1));

  datum1 := StringReplace(datum1 , '.', '/', [rfReplaceAll, rfIgnoreCase]);
  datum2 := StringReplace(datum2 , '.', '/', [rfReplaceAll, rfIgnoreCase]);

  with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
        Open;
  end;
  oibS := DataSource2.DataSet.Fields[0].Value;


  if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

    if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

  if GroupBox3.Visible = false then
  begin
  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2));
      SQL.Add('Select * FROM Receipts WHERE Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#'  );
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND (Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2) + ')');
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#');
      Open;
    end;
  end;
  end
  else
  begin
  if IsNumeric2(Edit1.Text) = false then
    Edit1.Text := '0';
  if IsNumeric2(Edit2.Text) = false then
    Edit2.Text := '0';

  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text);
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND ( Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text + ')' );
      Open;
    end;
  end;
  end;

  racunList2 := TList.Create;

  while not ADOQuery1.Eof do
  begin

  racunList := TList.Create;

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts LEFT JOIN TReceipts ON Receipts.Receipt_ID = TReceipts.Receipt_ID WHERE Receipts.Receipt_ID=' + ADOQuery1.FieldByName('Receipt_ID').AsString);
      Open;
    end;

    while not ADOQuery2.Eof do
    begin
      racun := TRacunData.Create;

      with racun do
      begin
        ID := ADOQuery2.FieldByName('Item_ID').AsString;
        Name := ADOQuery2.FieldByName('Item_Name').AsString;

        if StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Number := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Qty').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Number := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Price := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Price').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Price := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Tax := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Vat_Rate').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Tax := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          TaxPNP := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_VAT_ID').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          TaxPNP := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Popust := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Discount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Popust := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Naknada := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_PackPrice').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]))
        else
          Naknada := 0;

        if StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          Sum := StrToFloat(StringReplace(ADOQuery2.FieldByName('Item_Ammount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase])) + Naknada * Number
        else
          Sum := 0;

        if ADOQuery2.FieldByName('Receipt_PaymentID').IsNull = false then
          Nacin := ADOQuery2.FieldByName('Receipt_PaymentID').AsString
        else
          Nacin := '';

        with ADOQuery3 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT DiscountTypeName FROM Discount WHERE DiscountName=' + QuotedStr(ADOQuery2.FieldByName('Receipt_PaymentID').AsString));
          Open;
        end;

        Vrsta := ADOQuery3.FieldByName('DiscountTypeName').AsString;

      end;
      ADOQuery2.Next;
      racunList.Add(racun);
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Sum := racun.Price * racun.Number - racun.Popust * racun.Price * racun.Number / 100 + racun.Number * racun.Naknada;
    end;

    for i := racunList.Count -1 downto 0 do
    begin
      racun := racunList.Items[i];
      provjera := false;

      for k := racunList2.Count - 1 downto 0 do
      begin
        racun2 := racunList2.Items[k];
        if racun.Vrsta = racun2.Vrsta then
          provjera := true;
      end;

      if provjera = false then
      begin
        racun2 := TRacunData.Create;
        racun2.ID := racun.ID;
        racun2.Name := racun.Name;
        racun2.Number := racun.Number;
        racun2.Price := racun.Price;
        racun2.Tax := racun.Tax;
        racun2.TaxPNP := racun.TaxPNP;
        racun2.Popust := racun.Popust;
        racun2.Naknada := racun.Naknada;
        racun2.Sum := racun.Sum;
        racun2.Nacin := racun.Nacin;
        racun2.Vrsta := racun.Vrsta;
        racunList2.Add(racun2);
      end
      else
      begin
        for k := racunList2.Count - 1 downto 0 do
        begin
          racun2 := racunList2.Items[k];
          if racun.Vrsta = racun2.Vrsta then
          begin
            racun2.Sum := racun2.Sum + racun.Sum;
            racun2.Number := racun2.Number + racun.Number;
          end;
        end;
      end;

    end;

    for i := racunList.Count - 1 downto 0 do
    begin
      racun := racunList.Items[i];
      racun.Free;
    end;

    racunList.Clear;

    ADOQuery1.Next;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
    Open;
  end;

  lines := TStringList.Create;
  lines2 := TStringList.Create;
  lines.Add('');
  lines.Add('');
  lines2.Add('');

  lines2.Add('OIB: ' + oibS);
  lines.Add('OIB: ' + oibS);

  lines2.Add('');

  lines2.Add('            Pregled prometa po vrstama plaæanja');

  lines2.Add('');
  lines2.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines2.Add('Za blagajnika: ' + ComboBox1.Text);
  lines2.Add('');
  lines2.Add('________________________________________________________________');
  lines2.Add('');
  lines2.Add('Vrsta plaæanja                                          IZNOS');
  lines2.Add('________________________________________________________________');
  lines2.Add('');

  lines.Add('');
  lines.Add('           Pregled prometa');
  lines.Add('         po vrstama plaæanja');
  lines.Add('');
  lines.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines.Add('Za blagajnika: ' + ComboBox1.Text);
  lines.Add('');
  lines.Add('Vrsta plaæanja                     Iznos');
  lines.Add('----------------------------------------');
  lines.Add('');

  ukupno := 0; naknada := 0;
  for i := racunList2.Count - 1 downto 0 do
  begin

    racun := racunList2.Items[i];
    ukupno := ukupno + racun.Sum;
    naknada := naknada + racun.Naknada * racun.Number;

    lines2.Add(racun.Vrsta + DupeString(' ', 56) + Format('%.2f', [racun.Sum]));

    lines.Add(racun.Vrsta);
    lines.Add( DupeString(' ', 33) + Format('%.2f', [racun.Sum]));
    lines.Add('');

  end;

  lines2.Add('________________________________________________________________');
  lines2.Add('');

  lines.Add('----------------------------------------');
  lines.Add('');
  lines.Add('UKUPNO:' + DupeString(' ', 27) + Format('%.2f', [ukupno]));
  lines2.Add('UKUPNO:' + DupeString(' ', 49) + Format('%.2f', [ukupno]));

  if naknada <> 0 then
  begin
    lines.Add('NAKNADA:' + DupeString(' ', 26) + Format('%.2f', [naknada]));
    lines2.Add('NAKNADA:' + DupeString(' ', 48) + Format('%.2f', [naknada]));
  end;

  for i := racunList2.Count - 1 downto 0 do
  begin
    racun := racunList2.Items[i];
    racun.Free;
  end;

  racunList2.Clear;

  Form16.ShowModal;

  if Form16.buttonOK = true then
  begin
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('PrintType'));
      Open;
    end;

    if DataSource2.DataSet.Fields[0].Value = 0 then
      PrintOnDotMatrix(Form5.printer, lines);

    if DataSource2.DataSet.Fields[0].Value = 1 then
    begin
      index := Printers.printer.Printers.IndexOf(Form5.printer);
      Printers.Printer.PrinterIndex := index;

      Printers.Printer.Canvas.Font.Name := 'Courier New';
      Printers.Printer.Canvas.Font.Size := 12;

      AssignPrn(myFile);
      ReWrite(myFile);

      for i := 0 to 3 do
        WriteLn(myFile, '');

      for i := 0 to lines2.Count - 1 do
      begin
        Write(myFile, '       ');
        Writeln(myFile, lines2[i]);
      end;

      CloseFile(myFile);

    end;

  end;

  lines2.Free;
  lines.Free;
end;

procedure TForm15.Button6Click(Sender: TObject);

var
  datum1 : String;
  datum2 : String;
  oib : String;
  oibS : String;
  petsum : Double;
  staklosum : Double;
  alfesum : Double;
  petnum : Integer;
  staklonum : Integer;
  alfenum : Integer;
  totalsum : Double;
  totalnum : Integer;

begin

  datum1 := FormatDateTime('mm/dd/yyyy', DateTimePicker1.Date);
  datum2 := FormatDateTime('mm/dd/yyyy', (DateTimePicker2.Date + 1));

  datum1 := StringReplace(datum1 , '.', '/', [rfReplaceAll, rfIgnoreCase]);
  datum2 := StringReplace(datum2 , '.', '/', [rfReplaceAll, rfIgnoreCase]);

  with ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ValueString FROM Settings WHERE Key=' + QuotedStr('OIB'));
        Open;
  end;
  oibS := DataSource2.DataSet.Fields[0].Value;


  if ComboBox1.Text <> 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT OIB FROM Users WHERE User=' + QuotedStr(ComboBox1.Text));
      Open;
    end;
    if DataSource1.DataSet.Fields[0].IsNull = false then
      oib := DataSource1.DataSet.Fields[0].Value;
  end;

  if GroupBox3.Visible = false then
  begin
  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2));
      SQL.Add('Select * FROM Receipts WHERE Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#'  );
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND (Format(Receipt_Date,' + QuotedStr('dd-mm-yyyy') + ') BETWEEN ' + QuotedStr(datum1) + ' AND ' + QuotedStr(datum2) + ')');
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND Receipts.Receipt_Date Between #' + datum1 + '# AND #' + datum2 + '#');
      Open;
    end;
  end;
  end
  else
  begin
  if IsNumeric2(Edit1.Text) = false then
    Edit1.Text := '0';
  if IsNumeric2(Edit2.Text) = false then
    Edit2.Text := '0';

  if ComboBox1.Text = 'Svi blagajnici' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text);
      Open;
    end;
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM Receipts WHERE Receipt_UserOIB= ' + QuotedStr(oib) + ' AND ( Receipt_ID BETWEEN ' + Edit1.Text + ' AND ' + Edit2.Text + ')' );
      Open;
    end;
  end;
  end;

  petnum := 0; staklonum := 0; alfenum := 0; petsum := 0; staklosum := 0; alfesum := 0; totalsum := 0; totalnum := 0;
  while not ADOQuery1.Eof do
  begin

    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * FROM TPack WHERE Receipt_ID=' + ADOQuery1.FieldByName('Receipt_ID').AsString);
      Open;
    end;

    while not ADOQuery2.Eof do
    begin
      if ADOQuery2.FieldByName('PET').AsString <> '' then
          petnum := petnum + ADOQuery2.FieldByName('PET').Value;

      if ADOQuery2.FieldByName('Staklo').AsString <> '' then
          staklonum := staklonum + ADOQuery2.FieldByName('Staklo').Value;

      if ADOQuery2.FieldByName('ALFE').AsString <> '' then
          alfenum := alfenum + ADOQuery2.FieldByName('ALFE').Value;

      if StringReplace(ADOQuery2.FieldByName('PETAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          petsum := petsum + StrToFloat(StringReplace(ADOQuery2.FieldByName('PETAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]));

      if StringReplace(ADOQuery2.FieldByName('StakloAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          staklosum := staklosum + StrToFloat(StringReplace(ADOQuery2.FieldByName('StakloAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]));

      if StringReplace(ADOQuery2.FieldByName('ALFEAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]) <> '' then
          alfesum := alfesum + StrToFloat(StringReplace(ADOQuery2.FieldByName('ALFEAmmount').AsString, '.', ',', [rfReplaceAll, rfIgnoreCase]));

      ADOQuery2.Next;
    end;
    ADOQuery1.Next;
  end;

  totalsum := alfesum + staklosum + petsum;
  totalnum := alfenum + staklonum + petnum;

  lines := TStringList.Create;
  lines.Add('');
  lines.Add('');

  lines.Add('OIB : ' + oibS );

  lines.Add('');
  lines.Add('           Pregled prometa');
  lines.Add('          po otkupu ambalaže');
  lines.Add('');
  lines.Add('Za period od ' + FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date) + ' do ' + FormatDateTime('dd/mm/yyyy', DateTimePicker2.Date + 1));
  lines.Add('Za blagajnika: ' + ComboBox1.Text);
  lines.Add('');
  lines.Add('Vrsta ambalaže         Kolièina   Iznos');
  lines.Add('----------------------------------------');
  lines.Add('');

  lines.Add('PET ambalaža          ' + IntToStr(petnum) + ' kom' + DupeString(' ', 11 - Length(IntToStr(petnum) + ' kom')) + Format('%.2f', [petsum]));
  lines.Add('Staklena ambalaža     ' + IntToStr(staklonum) + ' kom' + DupeString(' ', 11 - Length(IntToStr(staklonum) + ' kom')) + Format('%.2f', [staklosum]));
  lines.Add('Al-Fe ambalaža        ' + IntToStr(alfenum) + ' kom' + DupeString(' ', 11 - Length(IntToStr(alfenum) + ' kom')) + Format('%.2f', [alfesum]));

  lines.Add('----------------------------------------');
  lines.Add('');
  lines.Add('UKUPNO:' + DupeString(' ', 16) + IntToStr(totalnum) + ' kom' + DupeString(' ', 11 - Length(IntToStr(totalnum) + ' kom')) + Format('%.2f', [totalsum]));
  lines.Add('');

  Form16.ShowModal;

  if Form16.buttonOK = true then
    PrintOnDotMatrix(Form5.printer, lines);

  lines.Free;

end;

end.
