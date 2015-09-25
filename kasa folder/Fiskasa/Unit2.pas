unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, ADODB, Grids,
  DBGrids, ComCtrls;

type
  TFormakase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Matinipodaci1: TMenuItem;
    Primka1: TMenuItem;
    IzlazRobe1: TMenuItem;
    Ostalo1: TMenuItem;
    Krajrada1: TMenuItem;
    Artikli1: TMenuItem;
    Repromaterijal1: TMenuItem;
    GrupeArtikala1: TMenuItem;
    StopePoreza1: TMenuItem;
    Operateri1: TMenuItem;
    Dobavljai1: TMenuItem;
    Osnovnipodaci1: TMenuItem;
    Fiskal1: TMenuItem;
    Zasirovine1: TMenuItem;
    Zavlastituproizvodnju1: TMenuItem;
    Blagajna1: TMenuItem;
    BlagajnaTouch1: TMenuItem;
    Dnevniblagajnikiizvjetaj1: TMenuItem;
    Dnevniprometrobe1: TMenuItem;
    Ispisraunazadan1: TMenuItem;
    Pregledprometa1: TMenuItem;
    Otvarajeladice1: TMenuItem;
    Promjenagodine1: TMenuItem;
    Panel3: TPanel;
    Button1: TButton;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Izlaz1: TMenuItem;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    Panel5: TPanel;
    ADOTable2: TADOTable;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    DBNavigator2: TDBNavigator;
    ADORepro: TADOTable;
    DataSource3: TDataSource;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    DBNavigator4: TDBNavigator;
    Button3: TButton;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Button4: TButton;
    Button5: TButton;
    Button2: TButton;
    Button6: TButton;
    ADOGrupe: TADOTable;
    DataSource4: TDataSource;
    DBGrid2: TDBGrid;
    DBNavigator3: TDBNavigator;
    ADOuser: TADOTable;
    DataSource5: TDataSource;
    DBGrid4: TDBGrid;
    DBNavigator5: TDBNavigator;
    ADOTable6: TADOTable;
    DataSource6: TDataSource;
    DBGrid5: TDBGrid;
    DBNavigator6: TDBNavigator;
    Memo1: TMemo;
    ADOTablenormativi: TADOTable;
    DataSource7normativi: TDataSource;
    DBGrid6: TDBGrid;
    DBNavigator7: TDBNavigator;
    Label12: TLabel;
    Label13: TLabel;
    Memo2: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Panel10: TPanel;
    ADOTable7Dobavljaci: TADOTable;
    DataSource7dobavljaci: TDataSource;
    DBGrid7: TDBGrid;
    DBNavigator8: TDBNavigator;
    Label18: TLabel;
    Button7: TButton;
    DataSource7datum: TDataSource;
    ADOTable7datum: TADOTable;
    Image1: TImage;
    Panel11: TPanel;
    DataSource7firma: TDataSource;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    Label20: TLabel;
    DBEdit14: TDBEdit;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    Label23: TLabel;
    DBEdit17: TDBEdit;
    Label24: TLabel;
    DBEdit18: TDBEdit;
    Label25: TLabel;
    DBEdit19: TDBEdit;
    Label26: TLabel;
    DBEdit20: TDBEdit;
    DBNavigator9: TDBNavigator;
    Label27: TLabel;
    DBEdit21: TDBEdit;
    Timer1: TTimer;
    Timer2: TTimer;
    TimeLabel: TLabel;
    DateLabel: TLabel;
    Label28: TLabel;
    DBEdit22: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Label29: TLabel;
    Pnp: TLabel;
    Label33: TLabel;
    DBEdit9: TDBEdit;
    Label34: TLabel;
    DBEdit23: TDBEdit;
    ADOTablenormativiSIFRA1: TWideStringField;
    ADOTablenormativiSIFRA2: TWideStringField;
    ADOTablenormativiNORMA: TFloatField;
    ADOuserUser: TWideStringField;
    ADOuserPwd: TWideStringField;
    ADOuserOIB: TWideStringField;
    ADOGrupeSIFRA: TWideStringField;
    ADOGrupeNAZIV: TWideStringField;
    ADOReproSIFRA: TWideStringField;
    ADOReproNAZIV: TWideStringField;
    ADOReproJM: TWideStringField;
    ADOReproKOL: TFloatField;
    ADOReproGRUPA: TWideStringField;
    Label1: TLabel;
    DBEdit11: TDBEdit;
    ADOTable1Item_ID: TWideStringField;
    ADOTable1Item_Name: TWideStringField;
    ADOTable1Item_Measure: TWideStringField;
    ADOTable1Item_Price: TFloatField;
    ADOTable1Item_Type: TFloatField;
    ADOTable1VAT_ID: TWideStringField;
    ADOTable1VAT_Rate: TFloatField;
    ADOTable1VAT_Type: TFloatField;
    ADOTable1Item_ConsumptionID: TSmallintField;
    ADOTable1Item_Pack: TSmallintField;
    ADOTable1Item_PackPrice: TFloatField;
    ADOTable1Item_PackMPC: TFloatField;
    ADOTable1GRUPA: TWideStringField;
    ADOTable1TEZINA: TFloatField;
    ADOTable1POVRAT: TWideStringField;
    ADOTable1Naknada: TFloatField;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    PrintDialog1: TPrintDialog;
    ADOTable1Dobavljaci: TWideStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOTable7DobavljaciIme_dobavljaa: TWideStringField;
    ADOTable2Item_ID: TWideStringField;
    ADOTable2Item_Name: TWideStringField;
    ADOTable2Item_Measure: TWideStringField;
    ADOTable2Item_Price: TFloatField;
    ADOTable2Item_Type: TFloatField;
    ADOTable2VAT_ID: TWideStringField;
    ADOTable2VAT_Rate: TFloatField;
    ADOTable2VAT_Type: TFloatField;
    ADOTable2Item_ConsumptionID: TSmallintField;
    ADOTable2Item_Pack: TSmallintField;
    ADOTable2Item_PackPrice: TFloatField;
    ADOTable2Item_PackMPC: TFloatField;
    ADOTable2GRUPA: TWideStringField;
    ADOTable2TEZINA: TFloatField;
    ADOTable2POVRAT: TWideStringField;
    ADOTable2Naknada: TFloatField;
    ADOTable2Dobavljaci: TWideStringField;
    //TimeLabel.caption:=FormatDateTime('hh:mm:ss',Time);
    //DateLabel.Caption:=FormatDateTime('dddd dd. mmmm. yyy',Date);
    procedure BlagajnaTouch1Click(Sender: TObject);
    procedure Krajrada1Click(Sender: TObject);
    procedure Artikli1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Izlaz1Click(Sender: TObject);
    procedure Blagajna1Click(Sender: TObject);
    procedure Repromaterijal1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GrupeArtikala1Click(Sender: TObject);
    procedure StopePoreza1Click(Sender: TObject);
    procedure Operateri1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Dobavljai1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Primka1Click(Sender: TObject);
    procedure IzlazRobe1Click(Sender: TObject);
    procedure Ostalo1Click(Sender: TObject);
    procedure Osnovnipodaci1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Promjenagodine1Click(Sender: TObject);
    procedure Fiskal1Click(Sender: TObject);
    procedure Matinipodaci1Click(Sender: TObject);
    procedure Zasirovine1Click(Sender: TObject);
    procedure Ispisraunazadan1Click(Sender: TObject);
    procedure Zavlastituproizvodnju1Click(Sender: TObject);
    procedure Dnevniblagajnikiizvjetaj1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formakase: TFormakase;

implementation

uses Kasapekara, Unit3, Login, fiska,unitKasa, Unit4, UnitRepro;

{$R *.dfm}

procedure TFormakase.BlagajnaTouch1Click(Sender: TObject);
begin
Form1.Show;
end;

procedure TFormakase.Krajrada1Click(Sender: TObject);
begin
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel11.Hide;
//Form1.Close;
end;

procedure TFormakase.Matinipodaci1Click(Sender: TObject);
begin
Glavna.Close;
end;

procedure TFormakase.Artikli1Click(Sender: TObject);
begin
Panel3.Show;
Panel5.Show;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel11.Hide;
end;

procedure TFormakase.Button1Click(Sender: TObject);
begin
Panel3.Hide;
Panel5.Hide;
end;

procedure TFormakase.Izlaz1Click(Sender: TObject);
begin
Logiranje.Close;
Close;
end;

procedure TFormakase.Blagajna1Click(Sender: TObject);
begin
Formakase.Hide;
Formablagajne.Show;
//frmblagajna.Show;
end;

procedure TFormakase.Repromaterijal1Click(Sender: TObject);
begin
Panel7.Show;
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel11.Hide;
Glavna.Close;
end;

procedure TFormakase.Button2Click(Sender: TObject);
begin
Panel7.Hide;
end;

procedure TFormakase.GrupeArtikala1Click(Sender: TObject);
begin
Panel6.Show;
Panel3.Hide;
Panel5.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel11.Hide;
Glavna.Close;
end;

procedure TFormakase.StopePoreza1Click(Sender: TObject);
begin
Panel9.Show;
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel10.Hide;
Panel11.Hide;
Glavna.Close;
end;

procedure TFormakase.Operateri1Click(Sender: TObject);
begin
Panel8.Show;
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel9.Hide;
Panel10.Hide;
Panel11.Hide;
Glavna.Close;
end;

procedure TFormakase.Button4Click(Sender: TObject);
begin
Panel9.Hide;
end;

procedure TFormakase.Button5Click(Sender: TObject);
begin
Panel8.Hide;
Glavna.Close;
end;

procedure TFormakase.Button6Click(Sender: TObject);
begin
Panel6.Hide;
Glavna.Close;
end;

procedure TFormakase.Dobavljai1Click(Sender: TObject);
begin
Panel10.Show;
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel11.Hide;
Glavna.Close;
end;

procedure TFormakase.Fiskal1Click(Sender: TObject);
begin
Glavna.show;
end;

procedure TFormakase.Button7Click(Sender: TObject);
begin
Panel10.Hide;
end;

procedure TFormakase.Primka1Click(Sender: TObject);
begin
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel11.Hide;
Glavna.Close;
end;

procedure TFormakase.Promjenagodine1Click(Sender: TObject);
begin
  ShowMessage ('Running on Windows: ' +
    IntToStr (Win32MajorVersion) + '.' +
    IntToStr (Win32MinorVersion) + ' (Build ' +
    IntToStr (Win32BuildNumber) + ') ' + #10#13 +
    'Update: ' + Win32CSDVersion)
end;

procedure TFormakase.IzlazRobe1Click(Sender: TObject);
begin
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel11.Hide;
end;

procedure TFormakase.Ostalo1Click(Sender: TObject);
begin
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel11.Hide;
end;

procedure TFormakase.Osnovnipodaci1Click(Sender: TObject);
begin
Panel11.Show;
Panel3.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
end;

procedure TFormakase.Timer1Timer(Sender: TObject);


begin
//begin
    TimeLabel.caption:=FormatDateTime('hh:mm:ss',Time);
    DateLabel.Caption:=FormatDateTime('dddd dd. mmmm. yyy',Date);
end;
//---------------------------------
//procedure TFormakase.Edit7Change(Sender: TObject);
//var n:integer;
//begin
   //  n:=BSearch();
   //  if n=-1 then beep
   //  else begin
   //       RecNumb:=n;
   //       ComboBox1.ItemIndex:=RecNumb;
   //       SeekRecord;
   //       NumLabel.Caption:=IntToStr(RecNumb+1);
   //  end;
//end;


procedure TFormakase.Zasirovine1Click(Sender: TObject);
begin
Artikli.Show;
end;

procedure TFormakase.Ispisraunazadan1Click(Sender: TObject);
begin
Artikli.Print;
end;

procedure TFormakase.Zavlastituproizvodnju1Click(Sender: TObject);
begin
Frepro.show;
end;

procedure TFormakase.Dnevniblagajnikiizvjetaj1Click(Sender: TObject);
begin
//Formablagajne.show;
frmblagajna.show;
end;

end.
