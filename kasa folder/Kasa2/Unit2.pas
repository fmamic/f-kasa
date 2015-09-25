unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, XPMan, ExtCtrls, StdCtrls, dbcgrids, Grids, DBGrids,
  DB, ADODB, RacunData, ListRacun, Unit1, ShellApi, Menus, Unit3;

type
  TForm2 = class(TForm)
    XPManifest1: TXPManifest;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button5: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label8: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StringGrid1: TStringGrid;
    Label3: TLabel;
    Button6: TButton;
    HeaderControl1: THeaderControl;
    Label7: TLabel;
    Label9: TLabel;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure HeaderControl1SectionClick(HeaderControl: THeaderControl;
      Section: THeaderSection);
  private
    racunList : TList;
    { Private declarations }
  public
    { Public declarations }
  end;     

  procedure addToList(list : TList; stringGrid : TStringGrid; number : Integer);

var
  Form2: TForm2;
  sum : Double = 0;

implementation

{$R *.dfm}

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := FormatDateTime('dd/mm/yyyy', Now);
  StatusBar1.Panels[1].Text := FormatDateTime('H:m:ss', Now);
end;

procedure TForm2.FormClick(Sender: TObject);
begin
  if GetKeyState(VK_F9) < 0 then
    begin
      Application.Terminate;
    end;
end;

procedure TForm2.FormCreate(Sender: TObject);

var
  maxRacun : Double;
  
begin
  racunList := TList.Create;
  ADOConnection1.LoginPrompt := False;

  with ADOQuery2 do begin
      Close;
      SQL.Clear;
      SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
      Open;
  end;

  maxRacun := DataSource2.DataSet.Fields[0].Value;       // dobavljanje najveceg racuna iz baze i uvecavanje za 1
  Label9.Caption := FloatToStr(maxRacun);

  StringGrid1.Cells[0,0] := 'Ime';
  StringGrid1.Cells[1,0] := 'Kolicina';
  StringGrid1.Cells[2,0] := 'Cijena';
  StringGrid1.Cells[3,0] := 'Iznos';
end;

// za pretrazivanje po imenu
procedure TForm2.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with ADOQuery1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM items WHERE item_Name LIKE ' + QuotedStr(Edit1.Text + '%'));
    Open;
  end;

end;

// za pretrazivanje po ID
procedure TForm2.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with ADOQuery1 do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM items WHERE item_ID LIKE ' + QuotedStr(Edit2.Text + '%'));
    Open;
  end;
end;

// funkcija za dodavanje u stringrid
procedure addToList(list : TList; stringGrid : TStringGrid; number : Integer);

var
k : Integer;
racun : TRacunData;

begin

  for k := 0 to StringGrid.RowCount - 1 do
    stringGrid.Rows[k].Clear;

  // postavljamo prvi fixni red
  stringGrid.Cells[0,0] := 'Ime';
  stringGrid.Cells[1,0] := 'Kolicina';
  stringGrid.Cells[2,0] := 'Cijena';
  stringGrid.Cells[3,0] := 'Iznos';

  for k := list.Count - 1 downto 0 do
  begin
    racun := list[k];
    stringGrid.Cells[0, k+1] := racun.Name;
    stringGrid.Cells[1, k+1] := FloatToStr(racun.Number);
    stringGrid.Cells[2, k+1] := FloatToStr(racun.Price);
    stringGrid.Cells[3, k+1] := FloatToStr(racun.Sum);
  end;
  if number = 0 then
    stringGrid.RowCount := stringGrid.RowCount + 1
  else
    stringGrid.RowCount := stringGrid.RowCount - 1;
end;

// Kada se pritsne tipka na stringgridu
procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var
 Racun : TRacunData;
 i : Integer;
 racun2 : TRacunData;
 pass : Boolean;

begin
  if Key = VK_ADD then    // ako se pritisne tipka '+'
  begin
    pass := false;
    for i := racunList.Count - 1 downto 0 do
    begin
      racun2 := racunList.Items[i];

      // ako postoji artikl vec na racunu onda mu povecaj kolicinu i promjeni pass na true
      if racun2.Name = DBGrid1.DataSource.DataSet.Fields[1].Value then
      begin
        racun2.Number := racun2.Number + 1;
        racun2.Sum := racun2.Price * racun2.Number;
        pass := true;
      end;

    end;

    // samo ako je novi proizvod (pass je false) onda stvori novi objekt
    if pass <> true then
    begin
    Racun := TRacunData.Create;
    with Racun do
    begin
      Name := DBGrid1.DataSource.DataSet.Fields[1].Value;
      ID := DBGrid1.DataSource.DataSet.Fields[0].Value;
      Number := 1;
      Price := DBGrid1.DataSource.DataSet.Fields[2].Value;
      Sum := Number * Price;
      if DBGrid1.DataSource.DataSet.Fields[3].Value <> 0 then
        Tax := DBGrid1.DataSource.DataSet.Fields[3].Value;

      if DBGrid1.DataSource.DataSet.Fields[4].Value <> 0 then
        TaxPNP := DBGrid1.DataSource.DataSet.Fields[4].Value;;

    end;
    racunList.Add(Racun);
    end;

    // Dodaj u celije Stringrida
    for i := racunList.Count - 1 downto 0 do
    begin
      Racun := racunList[i];
      StringGrid1.Cells[0, i+1] := Racun.Name;
      StringGrid1.Cells[1, i+1] := FloatToStr(Racun.Number);
      StringGrid1.Cells[2, i+1] := FloatToStr(Racun.Price);
      StringGrid1.Cells[3, i+1] := FloatToStr(Racun.Sum);
    end;

    // ako je dodan novi proizvod onda dodaj rowCount
    if pass <> true then
    begin
      StringGrid1.RowCount := StringGrid1.RowCount + 1
    end;

    // Zbrajanje iznosa racuna
    sum := 0;
    for i := racunList.Count - 1 downto 0 do
    begin
      racun2 := racunList.Items[i];
      sum := sum + racun2.Sum;
    end;

    // Prikazivanje na label iznosa
    Label8.Caption := FloatToStr(sum);
  end;

  // promjena fokusa na pritisak Shift tipke
  if Key = VK_SHIFT then
  begin
    StringGrid1.SetFocus;
  end;

  if Key = VK_CONTROL then
    Edit1.SetFocus;
  
end;

// ako se pritisne tipka na stringridu za oduzimanje onda mice artikl
procedure TForm2.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  numberGrid : Integer;
  rac : TRacunData;

begin
  if Key = VK_SUBTRACT then
  begin
    numberGrid := StringGrid1.Row - 1;

    rac := racunList.Items[numberGrid];
    sum := sum - rac.Number * rac.Price;

    racunList.Delete(numberGrid);
    
    Label8.Caption := FloatToStr(sum);
    addToList(racunList, StringGrid1, 1);

  end;

  if Key = VK_F11 then
    Button6Click(sender);

  if Key = VK_SHIFT then
    DBGrid1.SetFocus;

  if Key = VK_CONTROL then
    Edit1.SetFocus;

end;

procedure TForm2.Button6Click(Sender: TObject);

var
  k : Integer;
  rac : TRacunData;

begin
  for k:= racunList.Count - 1 downto 0 do
    rac := racunList.Items[k];
    rac.Free;
  racunList.Clear;

  for k:= 1 to StringGrid1.RowCount do
    StringGrid1.Rows[k].Clear;
  StringGrid1.RowCount := 2;
  sum := 0;
  Label8.Caption := FloatToStr(sum);
end;

// Ispis racuna i fiskalizacija i spremanje racuna u bazu
procedure TForm2.Button4Click(Sender: TObject);

var
  racunFile : TextFile;
  Lines : TStrings;
  racunTemp : TRacunData;
  k : Integer;
  iznosPoreza : Double;
  iznosPocetni : Double;
  line : String;
  maxRacun : Double;
  amount : Double;

begin
  AssignFile(racunFile, 'Racun.txt');
  Rewrite(racunFile);
  CloseFile(racunFile);

  Lines := TStringList.Create;


  try

    Lines.Add('P');
    Lines.Add(StringReplace(FormatDateTime('dd/mm/yyyy hh:nn:ss', Now),'.', '/', [rfReplaceAll, rfIgnoreCase]));
    Lines.Add('1');

    for k := racunList.Count - 1 downto 0 do
    begin
      if k <> racunList.Count - 1 then
        line := line + ' ';
      racunTemp := racunList.Items[k];
      iznosPocetni := (racunTemp.Price * 100) / (100 + racunTemp.Tax);           // pocetni iznos bez poreza
      iznosPoreza := (racunTemp.Tax * racunTemp.Price) / (100 + racunTemp.Tax);       // iznos poreza u vrijednosti
      line := line + StringReplace(Format('%.2f', [racunTemp.Tax]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [iznosPocetni]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ';' + StringReplace(Format('%.2f', [iznosPoreza]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
      if k <> 0 then
        line := line + ';';
    end;

    Lines.Add(line);
    Lines.Add(StringReplace(Format('%.2f', [StrToFloat(Label8.Caption)]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
    Lines.Add('G');
    Lines.Add(FloatToStr(Form1.OIB));
    Lines.Add('');
    Lines.Add('');
    Lines.Add('');

    Lines.SaveToFile('Racun.txt');

  finally
    Lines.Free;
    //ShellExecute (Handle, 'open', PChar('Fiska'), PChar('Fiska.exe'), nil, SW_SHOW);
    with ADOQuery2 do begin
      Close;
      SQL.Clear;
      SQL.Add('Select MAX(Receipt_ID) FROM Receipts');
      Open;
    end;

    maxRacun := DataSource2.DataSet.Fields[0].Value + 1;       // dobavljanje najveceg racuna iz baze i uvecavanje za 1
    Label9.Caption := FloatToStr(maxRacun);

    amount := 0;
    for k := racunList.Count -1 downto 0 do
    begin
      racunTemp := racunList.Items[k];
      amount := amount + racunTemp.Sum;
    end;

    with ADOQuery2 do begin     // upis racuna u bazu Receipts
      Close;
      SQL.Clear;
      SQL.Add('Insert into Receipts(Receipt_ID, Receipt_Ammount, Receipt_Date,'
      + 'Receipt_UserOIB, Receipt_User) VALUES (' + FloatToStr(maxRacun)
      + ',' + StringReplace(Format('%.2f', [amount]), ',', '.', [rfReplaceAll, rfIgnoreCase])
      + ',' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)) + ','
      + QuotedStr(FloatToStr(Form1.OIB)) + ',' + QuotedStr(Form1.Name) + ')');
      ExecSQL;
    end;

    with ADOQuery2 do begin
      for k := racunList.Count - 1 downto 0 do
      begin
        racunTemp := RacunList.Items[k];
        Close;
        SQL.Clear;
        SQL.Add('Insert into TReceipts(Receipt_ID, Item_ID, Item_Name, Item_Qty, Item_Price, Item_Vat_Rate, Item_Ammount) VALUES ('
          + FloatToStr(maxRacun) + ',' + FloatToStr(racunTemp.ID)
          + ',' + QuotedStr(racunTemp.Name)
          + ',' + StringReplace(Format('%.2f', [racunTemp.Number]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          + ',' +  StringReplace(Format('%.2f', [racunTemp.Price]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          + ',' + StringReplace(Format('%.2f', [racunTemp.Tax]), ',', '.', [rfReplaceAll, rfIgnoreCase])
          + ',' + StringReplace(Format('%.2f', [racunTemp.Sum]), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ')' );
        ExecSQL;
      end;
    end;

    Form2.Button6Click(sender);
  end;

end;

// Promjena blagajnika
procedure TForm2.HeaderControl1SectionClick(HeaderControl: THeaderControl;
  Section: THeaderSection);

var
  Form : TForm3;

begin
  if Section.Index = 0 then
  begin
    Form1.Show;
  end;

  if Section.Index = 1 then
  begin

  Form := Form3.Create(nil);

  try
    Form.ShowModal;
  finally
    Form.Free;
  end;

  end;
end;

end.


