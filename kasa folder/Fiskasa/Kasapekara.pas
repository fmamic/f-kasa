unit Kasapekara;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Menus;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    LabeledEdit1: TLabeledEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    MainMenu1: TMainMenu;
    Otvori1: TMenuItem;
    Menu1: TMenuItem;
    Bijeli1: TMenuItem;
    Polubijeli1: TMenuItem;
    Crni1: TMenuItem;
    Razeni1: TMenuItem;
    Kukuruzni1: TMenuItem;
    Mijesani1: TMenuItem;
    Pecivo1: TMenuItem;
    Posebnevrste1: TMenuItem;
    Sokovi1: TMenuItem;
    Ostalo1: TMenuItem;
    Izvjesca1: TMenuItem;
    Kraj1: TMenuItem;
    Izlaz1: TMenuItem;
    Panel1: TPanel;
    Button1: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    LabeledEdit2: TLabeledEdit;
    DBGrid2: TDBGrid;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn48: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    LabeledEdit3: TLabeledEdit;
    DBGrid3: TDBGrid;
    BitBtn49: TBitBtn;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn54: TBitBtn;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    BitBtn61: TBitBtn;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    BitBtn64: TBitBtn;
    BitBtn65: TBitBtn;
    BitBtn66: TBitBtn;
    BitBtn67: TBitBtn;
    BitBtn68: TBitBtn;
    BitBtn69: TBitBtn;
    BitBtn70: TBitBtn;
    BitBtn71: TBitBtn;
    BitBtn72: TBitBtn;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    LabeledEdit4: TLabeledEdit;
    DBGrid4: TDBGrid;
    BitBtn73: TBitBtn;
    BitBtn74: TBitBtn;
    BitBtn75: TBitBtn;
    BitBtn76: TBitBtn;
    BitBtn77: TBitBtn;
    BitBtn78: TBitBtn;
    BitBtn79: TBitBtn;
    BitBtn80: TBitBtn;
    BitBtn81: TBitBtn;
    BitBtn82: TBitBtn;
    BitBtn83: TBitBtn;
    BitBtn84: TBitBtn;
    BitBtn85: TBitBtn;
    BitBtn86: TBitBtn;
    BitBtn87: TBitBtn;
    BitBtn88: TBitBtn;
    BitBtn89: TBitBtn;
    BitBtn90: TBitBtn;
    BitBtn91: TBitBtn;
    BitBtn92: TBitBtn;
    BitBtn93: TBitBtn;
    BitBtn94: TBitBtn;
    BitBtn95: TBitBtn;
    BitBtn96: TBitBtn;
    Button41: TButton;
    Button42: TButton;
    Button43: TButton;
    Button44: TButton;
    Button45: TButton;
    Button46: TButton;
    Button47: TButton;
    Button48: TButton;
    Button49: TButton;
    Button50: TButton;
    LabeledEdit5: TLabeledEdit;
    DBGrid5: TDBGrid;
    BitBtn97: TBitBtn;
    BitBtn98: TBitBtn;
    BitBtn99: TBitBtn;
    BitBtn100: TBitBtn;
    BitBtn101: TBitBtn;
    BitBtn102: TBitBtn;
    BitBtn103: TBitBtn;
    BitBtn104: TBitBtn;
    BitBtn105: TBitBtn;
    BitBtn106: TBitBtn;
    BitBtn107: TBitBtn;
    BitBtn108: TBitBtn;
    BitBtn109: TBitBtn;
    BitBtn110: TBitBtn;
    BitBtn111: TBitBtn;
    BitBtn112: TBitBtn;
    BitBtn113: TBitBtn;
    BitBtn114: TBitBtn;
    BitBtn115: TBitBtn;
    BitBtn116: TBitBtn;
    BitBtn117: TBitBtn;
    BitBtn118: TBitBtn;
    BitBtn119: TBitBtn;
    BitBtn120: TBitBtn;
    Button51: TButton;
    Button52: TButton;
    Button53: TButton;
    Button54: TButton;
    Button55: TButton;
    Button56: TButton;
    Button57: TButton;
    Button58: TButton;
    Button59: TButton;
    Button60: TButton;
    LabeledEdit6: TLabeledEdit;
    DBGrid6: TDBGrid;
    BitBtn121: TBitBtn;
    BitBtn122: TBitBtn;
    BitBtn123: TBitBtn;
    BitBtn124: TBitBtn;
    BitBtn125: TBitBtn;
    BitBtn126: TBitBtn;
    BitBtn127: TBitBtn;
    BitBtn128: TBitBtn;
    BitBtn129: TBitBtn;
    BitBtn130: TBitBtn;
    BitBtn131: TBitBtn;
    BitBtn132: TBitBtn;
    BitBtn133: TBitBtn;
    BitBtn134: TBitBtn;
    BitBtn135: TBitBtn;
    BitBtn136: TBitBtn;
    BitBtn137: TBitBtn;
    BitBtn138: TBitBtn;
    BitBtn139: TBitBtn;
    BitBtn140: TBitBtn;
    BitBtn141: TBitBtn;
    BitBtn142: TBitBtn;
    BitBtn143: TBitBtn;
    BitBtn144: TBitBtn;
    Button61: TButton;
    Button62: TButton;
    Button63: TButton;
    Button64: TButton;
    Button65: TButton;
    Button66: TButton;
    Button67: TButton;
    Button68: TButton;
    Button69: TButton;
    Button70: TButton;
    LabeledEdit7: TLabeledEdit;
    DBGrid7: TDBGrid;
    BitBtn145: TBitBtn;
    BitBtn146: TBitBtn;
    BitBtn147: TBitBtn;
    BitBtn148: TBitBtn;
    BitBtn149: TBitBtn;
    BitBtn150: TBitBtn;
    BitBtn151: TBitBtn;
    BitBtn152: TBitBtn;
    BitBtn153: TBitBtn;
    BitBtn154: TBitBtn;
    BitBtn155: TBitBtn;
    BitBtn156: TBitBtn;
    BitBtn157: TBitBtn;
    BitBtn158: TBitBtn;
    BitBtn159: TBitBtn;
    BitBtn160: TBitBtn;
    BitBtn161: TBitBtn;
    BitBtn162: TBitBtn;
    BitBtn163: TBitBtn;
    BitBtn164: TBitBtn;
    BitBtn165: TBitBtn;
    BitBtn166: TBitBtn;
    BitBtn167: TBitBtn;
    BitBtn168: TBitBtn;
    Button71: TButton;
    Button72: TButton;
    Button73: TButton;
    Button74: TButton;
    Button75: TButton;
    Button76: TButton;
    Button77: TButton;
    Button78: TButton;
    Button79: TButton;
    Button80: TButton;
    LabeledEdit8: TLabeledEdit;
    DBGrid8: TDBGrid;
    BitBtn169: TBitBtn;
    BitBtn170: TBitBtn;
    BitBtn171: TBitBtn;
    BitBtn172: TBitBtn;
    BitBtn173: TBitBtn;
    BitBtn174: TBitBtn;
    BitBtn175: TBitBtn;
    BitBtn176: TBitBtn;
    BitBtn177: TBitBtn;
    BitBtn178: TBitBtn;
    BitBtn179: TBitBtn;
    BitBtn180: TBitBtn;
    BitBtn181: TBitBtn;
    BitBtn182: TBitBtn;
    BitBtn183: TBitBtn;
    BitBtn184: TBitBtn;
    BitBtn185: TBitBtn;
    BitBtn186: TBitBtn;
    BitBtn187: TBitBtn;
    BitBtn188: TBitBtn;
    BitBtn189: TBitBtn;
    BitBtn190: TBitBtn;
    BitBtn191: TBitBtn;
    BitBtn192: TBitBtn;
    Button81: TButton;
    Button82: TButton;
    Button83: TButton;
    Button84: TButton;
    Button85: TButton;
    Button86: TButton;
    Button87: TButton;
    Button88: TButton;
    Button89: TButton;
    Button90: TButton;
    LabeledEdit9: TLabeledEdit;
    DBGrid9: TDBGrid;
    BitBtn193: TBitBtn;
    BitBtn194: TBitBtn;
    BitBtn195: TBitBtn;
    BitBtn196: TBitBtn;
    BitBtn197: TBitBtn;
    BitBtn198: TBitBtn;
    BitBtn199: TBitBtn;
    BitBtn200: TBitBtn;
    BitBtn201: TBitBtn;
    BitBtn202: TBitBtn;
    BitBtn203: TBitBtn;
    BitBtn204: TBitBtn;
    BitBtn205: TBitBtn;
    BitBtn206: TBitBtn;
    BitBtn207: TBitBtn;
    BitBtn208: TBitBtn;
    BitBtn209: TBitBtn;
    BitBtn210: TBitBtn;
    BitBtn211: TBitBtn;
    BitBtn212: TBitBtn;
    BitBtn213: TBitBtn;
    BitBtn214: TBitBtn;
    BitBtn215: TBitBtn;
    BitBtn216: TBitBtn;
    Button91: TButton;
    Button92: TButton;
    Button93: TButton;
    Button94: TButton;
    Button95: TButton;
    Button96: TButton;
    Button97: TButton;
    Button98: TButton;
    Button99: TButton;
    Button100: TButton;
    LabeledEdit10: TLabeledEdit;
    DBGrid10: TDBGrid;
    BitBtn217: TBitBtn;
    BitBtn218: TBitBtn;
    BitBtn219: TBitBtn;
    BitBtn220: TBitBtn;
    BitBtn221: TBitBtn;
    BitBtn222: TBitBtn;
    BitBtn223: TBitBtn;
    BitBtn224: TBitBtn;
    BitBtn225: TBitBtn;
    BitBtn226: TBitBtn;
    BitBtn227: TBitBtn;
    BitBtn228: TBitBtn;
    BitBtn229: TBitBtn;
    BitBtn230: TBitBtn;
    BitBtn231: TBitBtn;
    BitBtn232: TBitBtn;
    BitBtn233: TBitBtn;
    BitBtn234: TBitBtn;
    BitBtn235: TBitBtn;
    BitBtn236: TBitBtn;
    BitBtn237: TBitBtn;
    BitBtn238: TBitBtn;
    BitBtn239: TBitBtn;
    BitBtn240: TBitBtn;
    Button101: TButton;
    Button102: TButton;
    Button103: TButton;
    Button104: TButton;
    Button105: TButton;
    Button106: TButton;
    Button107: TButton;
    Button108: TButton;
    Button109: TButton;
    Button110: TButton;
    LabeledEdit11: TLabeledEdit;
    DBGrid11: TDBGrid;
    BitBtn241: TBitBtn;
    BitBtn242: TBitBtn;
    BitBtn243: TBitBtn;
    BitBtn244: TBitBtn;
    BitBtn245: TBitBtn;
    BitBtn246: TBitBtn;
    BitBtn247: TBitBtn;
    BitBtn248: TBitBtn;
    BitBtn249: TBitBtn;
    BitBtn250: TBitBtn;
    BitBtn251: TBitBtn;
    BitBtn252: TBitBtn;
    BitBtn253: TBitBtn;
    BitBtn254: TBitBtn;
    BitBtn255: TBitBtn;
    BitBtn256: TBitBtn;
    BitBtn257: TBitBtn;
    BitBtn258: TBitBtn;
    BitBtn259: TBitBtn;
    BitBtn260: TBitBtn;
    BitBtn261: TBitBtn;
    BitBtn262: TBitBtn;
    BitBtn263: TBitBtn;
    BitBtn264: TBitBtn;
    TimeLabel: TLabel;
    DateLabel: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Polubijeli1Click(Sender: TObject);
    procedure Crni1Click(Sender: TObject);
    procedure Razeni1Click(Sender: TObject);
    procedure Kukuruzni1Click(Sender: TObject);
    procedure Mijesani1Click(Sender: TObject);
    procedure Pecivo1Click(Sender: TObject);
    procedure Bijeli1Click(Sender: TObject);
    procedure Izlaz1Click(Sender: TObject);
    procedure Button109Click(Sender: TObject);
    procedure Button110Click(Sender: TObject);
    procedure Button101Click(Sender: TObject);
    procedure Button102Click(Sender: TObject);
    procedure Button103Click(Sender: TObject);
    procedure Button104Click(Sender: TObject);
    procedure Button105Click(Sender: TObject);
    procedure Button106Click(Sender: TObject);
    procedure Posebnevrste1Click(Sender: TObject);
    procedure Button107Click(Sender: TObject);
    procedure Sokovi1Click(Sender: TObject);
    procedure Button108Click(Sender: TObject);
    procedure Ostalo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//Panel1.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//Panel1.Hide;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
//Panel2.Hide;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
//Panel2.Show;
end;

procedure TForm1.Polubijeli1Click(Sender: TObject);
begin
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel1.Show;
end;

procedure TForm1.Crni1Click(Sender: TObject);
begin
Panel2.Show;
Panel1.Hide;
//Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel2.Show;
end;

procedure TForm1.Razeni1Click(Sender: TObject);
begin
Panel3.Show;
Panel1.Hide;
Panel2.Hide;
//Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel3.Show;
end;

procedure TForm1.Kukuruzni1Click(Sender: TObject);
begin
Panel4.Hide;
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
//Panel4.Hide;
Panel5.Show;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel4.Show;
end;

procedure TForm1.Mijesani1Click(Sender: TObject);
begin
Panel5.Hide;
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
//Panel5.Hide;
Panel6.Show;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel5.Show;
end;

procedure TForm1.Pecivo1Click(Sender: TObject);
begin
Panel6.Hide;
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
//Panel6.Hide;
Panel7.Show;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel6.Show;
end;

procedure TForm1.Bijeli1Click(Sender: TObject);
begin
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Form1.Show;
end;

procedure TForm1.Izlaz1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.Button109Click(Sender: TObject);
begin
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Show;
Panel10.Hide;

end;

procedure TForm1.Button110Click(Sender: TObject);
begin
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Show;

end;

procedure TForm1.Button101Click(Sender: TObject);
begin
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
Panel1.Show;
end;

procedure TForm1.Button102Click(Sender: TObject);
begin
Panel2.Show;
Panel1.Hide;
//Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel2.Show;
end;

procedure TForm1.Button103Click(Sender: TObject);
begin
Panel3.Show;
Panel1.Hide;
Panel2.Hide;
//Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel3.Show;
end;

procedure TForm1.Button104Click(Sender: TObject);
begin
 Panel4.Show;
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
//Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel4.Show;
end;

procedure TForm1.Button105Click(Sender: TObject);
begin
Panel5.Show;
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
//Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel5.Show;
end;

procedure TForm1.Button106Click(Sender: TObject);
begin
Panel6.Show;
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
//Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Hide;
//Panel6.Show;
end;

procedure TForm1.Posebnevrste1Click(Sender: TObject);
begin
// Panel6.Show;
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Show;
Panel9.Hide;
Panel10.Hide;
//Panel6.Show;
end;

procedure TForm1.Button107Click(Sender: TObject);
begin
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Show;
Panel9.Hide;
Panel10.Hide;
end;

procedure TForm1.Sokovi1Click(Sender: TObject);
begin
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Show;
Panel10.Hide;
end;

procedure TForm1.Button108Click(Sender: TObject);
begin
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Show;
Panel10.Hide;
end;

procedure TForm1.Ostalo1Click(Sender: TObject);
begin
Panel1.Hide;
Panel2.Hide;
Panel3.Hide;
Panel4.Hide;
Panel5.Hide;
Panel6.Hide;
Panel7.Hide;
Panel8.Hide;
Panel9.Hide;
Panel10.Show;
end;

end.