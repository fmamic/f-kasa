unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, Grids, DBGrids, RacunData, Unit18;

type
  THackDBGrid = Class(TCustomDBGrid); 
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    HeaderControl1: THeaderControl;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    procedure HeaderControl1SectionClick(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2, Unit5;

{$R *.dfm}

procedure TForm3.HeaderControl1SectionClick(HeaderControl: THeaderControl;
  Section: THeaderSection);
begin
  if Section.Index = 1 then
    Form3.Close;

  if Section.Index = 2 then
    Form3.Close;
end;

procedure TForm3.FormShow(Sender: TObject);
var
  l: DWORD;

begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Form2.SqlString);
    Open;
  end;

  EnableMenuItem(GetSystemMenu(Form3.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
  l := GetWindowLong(Self.Handle, GWL_STYLE);
  l := l and not (WS_MINIMIZEBOX);
  l := l and not (WS_MAXIMIZEBOX);
  l := SetWindowLong(Self.Handle, GWL_STYLE, l);

end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 i : Integer;
 racun2 : TRacunData;
 pass : Boolean;

 begin
  if Key = VK_RETURN then
  begin
    with Form2 do begin
      pass := false;
      for i := racunList.Count - 1 downto 0 do
      begin
        racun2 := racunList.Items[i];

        // ako postoji artikl vec na racunu onda mu povecaj kolicinu i promjeni pass na true
        if (racun2.ID = DBGrid1.DataSource.DataSet.Fields[0].Value) and (racun2.priceChange <> true ) then
        begin
          racun2.Number := racun2.Number + 1;
          racun2.Sum := racun2.Price * racun2.Number + racun2.Naknada * racun2.Number;
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
          Mjera := DBGrid1.DataSource.DataSet.Fields[2].Value;
          Number := 1;

          if (DBGrid1.DataSource.DataSet.Fields[7].AsString = '1') and (Form5.change = '1') then
          begin
            Form18.ShowModal;
            priceChange := true;
            if Form18.cijena = (-1) then
              Price := DBGrid1.DataSource.DataSet.Fields[3].Value
            else
              Price := Form18.cijena;
          end
          else
          begin
            Price := DBGrid1.DataSource.DataSet.Fields[3].Value;
          end;

          Popust := 0;

          if DBGrid1.DataSource.DataSet.Fields[4].Value <> 0 then
            Tax := DBGrid1.DataSource.DataSet.Fields[4].Value;

          if DBGrid1.DataSource.DataSet.Fields[5].Value <> 0 then
            TaxPNP := DBGrid1.DataSource.DataSet.Fields[5].Value;

          if DbGrid1.DataSource.DataSet.Fields[6].Value <> 0 then
            Naknada := DBGrid1.DataSource.DataSet.Fields[6].Value;

          if DBGrid1.DataSource.DataSet.Fields[7].AsString <> '' then
            Promjena := DBGrid1.DataSource.DataSet.Fields[7].AsString;

          if DBGrid1.DataSource.DataSet.Fields[8].AsString <> '' then
            Dobavljac := DBGrid1.DataSource.DataSet.Fields[8].AsString;

          Sum := Number * Price + Naknada * Number;

        end;
        racunList.Add(Racun);
      end;
      Form3.Close;
    end;
  end;

  if Key = VK_ESCAPE then
    Form3.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);

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
end;

procedure TForm3.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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
