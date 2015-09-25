unit fiska;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TGlavna = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    VOznakaPP: TEdit;
    vRadnoVrijemePP: TEdit;
    vDatumPrimjenePP: TDateTimePicker;
    vOznakaZatvaranjaPP: TComboBox;
    vSpecificnaNamjenaPP: TEdit;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    vDKBRPP: TEdit;
    vPrBostePP: TEdit;
    vNaseljePP: TEdit;
    vOpcinaPP: TEdit;
    vAdresaPP: TEdit;
    vKbrPP: TEdit;
    TabSheet5: TTabSheet;
    Label9: TLabel;
    vOstaliTipoviPP: TEdit;
    Button1: TButton;
    TabSheet3: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    vRacun_SustavPDV: TComboBox;
    vRacun_Datum: TDateTimePicker;
    vRacun_Slijedivost: TComboBox;
    vRacun_BrojRacuna: TEdit;
    vRacun_OznakaPP: TEdit;
    vRacun_OznakaNapUredaja: TEdit;
    PageControl3: TPageControl;
    TabSheet10: TTabSheet;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    vRacun_OIBOperatera: TEdit;
    vRacun_OznakaNaknadno: TComboBox;
    vRacun_OznakaParagon: TEdit;
    vRacun_SpecificnaNamjena: TEdit;
    Button3: TButton;
    vRacun_NacinPlacanja: TComboBox;
    TabSheet6: TTabSheet;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    vOibKorisnika: TEdit;
    vFiskalFileName: TEdit;
    vFiskalPassword: TEdit;
    vOibProgram: TEdit;
    vOIBoperatera: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Glavna: TGlavna;

implementation

{$R *.dfm}

end.
