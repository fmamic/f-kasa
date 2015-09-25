unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, Mask, DBCtrls, DB,
  ADODB;

type
  TFormablagajne = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    DBEdit3: TDBEdit;
    TimeLabel: TLabel;
    DateLabel: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    ADOracuni: TADOTable;
    ADOQueryracuni: TADOQuery;
    DataSourceracuni: TDataSource;
    DataSourceracuniupit: TDataSource;
    Panel5: TPanel;
    Timer2: TTimer;
    TotalLabel: TLabel;
    Item_ID_Edit: TEdit;
    SpeedButton7: TSpeedButton;
    Button8: TButton;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    ADOItems: TADOTable;
    DataItems: TDataSource;
    ADOracuniReceipt_ID: TIntegerField;
    ADOracuniReceipt_VATNumber: TWideStringField;
    ADOracuniReceipt_Date: TDateTimeField;
    ADOracuniReceipt_Ammount: TFloatField;
    ADOracuniReceipt_ZKI: TWideStringField;
    ADOItemsItem_ID: TWideStringField;
    ADOItemsItem_Name: TWideStringField;
    ADOItemsItem_Measure: TWideStringField;
    ADOItemsItem_Price: TFloatField;
    ADOItemsItem_Type: TFloatField;
    ADOItemsVAT_ID: TWideStringField;
    ADOItemsVAT_Rate: TFloatField;
    ADOItemsVAT_Type: TFloatField;
    ADOItemsItem_ConsumptionID: TSmallintField;
    ADOItemsItem_Pack: TSmallintField;
    ADOItemsItem_PackPrice: TFloatField;
    ADOItemsItem_PackMPC: TFloatField;
    ADOItemsGRUPA: TWideStringField;
    ADOItemsTEZINA: TFloatField;
    ADOItemsPOVRAT: TWideStringField;
    ADOItemsNaknada: TFloatField;
    ADOItemsDobavljaci: TWideStringField;
    ADOtemp: TADOTable;
    DataTemp: TDataSource;
    ADOracstavke: TADOTable;
    Dataracstavke: TDataSource;
    ADOtempReceipt_ID: TIntegerField;
    ADOtempItem_ID: TWideStringField;
    ADOtempItem_Name: TWideStringField;
    ADOtempItem_Qty: TFloatField;
    ADOtempItem_Price: TFloatField;
    ADOtempItem_VAT_ID: TWideStringField;
    ADOtempItem_Vat_Rate: TFloatField;
    ADOtempItem_Ammount: TFloatField;
    ADOtempItem_DiscountName: TWideStringField;
    ADOtempItem_Discount: TFloatField;
    ADOtempItem_DiscountAmmount: TFloatField;
    ADOtempItem_Type: TIntegerField;
    ADOtempItem_PPURate: TSmallintField;
    ADOtempItem_PackPrice: TFloatField;
    ADOtempItem_PackAmmount: TFloatField;
    ADOtempGrupe: TWideStringField;
  //  procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Item_ID_EditChange(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formablagajne: TFormablagajne;

implementation

uses Unit2, Unit4, Unitzakljuci, Total;

{$R *.dfm}
//Item_Id_Edit.Text.SetFocus;

//procedure TFormablagajne.BitBtn1Click(Sender: TObject);
//begin
//Formablagajne.Hide;
//Formakase.Show;
//end;

procedure TFormablagajne.Timer1Timer(Sender: TObject);
begin
TimeLabel.caption:=FormatDateTime('hh:mm:ss',Time);
DateLabel.Caption:=FormatDateTime('dddd dd. mmmm. yyy',Date);
end;

procedure TFormablagajne.Image1Click(Sender: TObject);
begin
Formablagajne.Close;
Formakase.Show;
end;



procedure TFormablagajne.Button3Click(Sender: TObject);
begin
Adoracuni.Close;
end;

procedure TFormablagajne.SpeedButton7Click(Sender: TObject);
begin

//AdoItems.Filter :='Items_Name' + QuotedStr(Item_ID_Edit.Text);
//AdoItems.Filtered:=true;
//dbgrid1.DataSource.DataSet.Insert;
Dbgrid1.DataSource :=Datasourceracuniupit;
//Item_Id_Edit.SetFocus;
//Dbgrid1.DataSource :=DataTemp;
// AdoTemp.Open;
 //Dbgrid1.DataSource.DataSet.Insert;
ADOQueryracuni.Open;
  ADOQueryracuni.SQL.Clear;
  ADOQueryracuni.SQL.Add('SELECT Item_ID,Item_Name,Item_Measure,Item_price,Vat_rate FROM Items');
  ADOQueryracuni.SQL.Add('WHERE Item_ID =' + QuotedStr(Item_ID_Edit.Text));
 //dbgrid1.DataSource.DataSet.Insert;
  ADOQueryracuni.Open;
 //dbgrid1.DataSource.DataSet.Post;
 //dbgrid1.DataSource.DataSet.Insert;
// Dbgrid1.DataSource :=DataTemp;
// Dbgrid1.DataSource.InsertComponent(Datasourceracuniupit);
 //dbgrid1.Datasource.Dataset.Post;
// Item_ID_Edit.Text :='';
 // Insert;


end;

procedure TFormablagajne.Item_ID_EditChange(Sender: TObject);
begin
//Adoartikli.Filter :='NAZIV' + QuotedStr(Item_ID_Edit.Text);
//Adoartikli.Filtered:=true;
end;

procedure TFormablagajne.Button8Click(Sender: TObject);
begin
Dbgrid1.DataSource :=Datasourceracuniupit;
ADOQueryracuni.Close;
  ADOQueryracuni.SQL.Clear;
  ADOQueryracuni.SQL.Add('SELECT Item_ID,Item_Name,Item_Measure,Item_Price,Vat_rate FROM Items');
  ADOQueryracuni.SQL.Add('WHERE Item_Name =' + QuotedStr(edit1.Text));
  ADOQueryracuni.Open;

end;
procedure TFormablagajne.Button2Click(Sender: TObject);
 //var:
begin
//if Key = VK_F2 then
//Adoracuni.Open;
Artikli.Show;
end;

procedure TFormablagajne.Button1Click(Sender: TObject);
//var
begin
//if KEY = vk_f2 THEN
Artikli.show;
end;


procedure TFormablagajne.Button7Click(Sender: TObject);
begin
Artikli.Hide;
end;

procedure TFormablagajne.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
if Key = VK_F2 then
//Adoracuni.Open;
Artikli.Show
else
//procedure TFormablagajne.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);

if Key = VK_F4 then
//Adoracuni.Open;
Artikli.Show;
end;
//procedure TFormablagajne.Button2Click(Sender: TObject);
 //var:
//begin
//if Key = VK_F2 then
//Adoracuni.Open;
//Artikli.Show;
//end;

//procedure TFormablagajne.Button1Click(Sender: TObject);
//var
//begin
//if KEY = vk_f2 THEN
//Artikli.show;
//end;

procedure TFormablagajne.Button5Click(Sender: TObject);
begin
Dbgrid1.DataSource := datasourceracuni;
Adoracuni.Open;
end;

procedure TFormablagajne.Button4Click(Sender: TObject);
begin
Totalform.show;
end;

end.
