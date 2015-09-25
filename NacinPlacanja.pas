unit NacinPlacanja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm9 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Fpostotak : Double;
    Fnacin : String;
    Fvrsta : String;

  public
    { Public declarations }
    property nacin : String read Fnacin write Fnacin;
    property vrsta : String read Fvrsta write Fvrsta;
    property postotak : Double read Fpostotak write Fpostotak;
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

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

procedure TForm9.Button1Click(Sender: TObject);
var
  provjera : Boolean;

begin
  provjera := true;

  if IsNumeric(Edit2.Text) then
    Fpostotak := StrToFloat(Edit2.Text)
  else
  begin
    ShowMessage('Postotak nije ispravno unesen');
    Fpostotak := 0;
    provjera := false;
  end;

  Fnacin := Edit1.Text;

  if (Edit1.Text <> '') and (provjera = true) then
  begin
  if RadioButton1.Checked = true then
    Fvrsta := RadioButton1.Caption;

  if RadioButton2.Checked = true then
    Fvrsta := RadioButton2.Caption;

  if RadioButton3.Checked = true then
    Fvrsta := RadioButton3.Caption;

  if RadioButton4.Checked = true then
    Fvrsta := RadioButton4.Caption;

  if RadioButton5.Checked = true then
    Fvrsta := RadioButton5.Caption;

  Form9.Close;
  end
  else
  begin
    if provjera = true then
      ShowMessage('Unesite parametre u polje naziva plaæanja');
  end;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  RadioButton1.Checked := true;

  Fpostotak := 0;
  Fnacin := '';
  
  Form9.Close;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
 EnableMenuItem(GetSystemMenu(Form9.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
Fvrsta := 'Gotovina';
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  RadioButton1.Checked := true;
end;

end.
