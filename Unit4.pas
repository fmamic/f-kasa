unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function IsNumeric(sBuffer : String) : Boolean;

var
  Form4: TForm4;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then 
  begin
    if isNumeric(Edit1.Text) = true then
    begin
      Form2.ispravnoKol := true;
      Form2.kolicina := Edit1.Text;
    end
    else
    begin
      Form2.ispravnoKol := false;
      Form2.kolicina := 'x';
    end;

    Edit1.Text := '';
    Form4.Close;
  end;

  if Key = VK_ESCAPE  then
    Form4.Close;
end;

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
    if (NOT (sBuffer[i] in ['0'..'9'])) and (sBuffer[i] <> ',') and (sBuffer[i] <> '-') then begin
      Result := False;
    exit;
  end;
end;

end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  if isNumeric(Edit1.Text) = true then
      Form2.ispravnoKol := true
    else
      Form2.ispravnoKol := false;

    Form2.kolicina := Edit1.Text;
    Form4.Close;

end;

procedure TForm4.Button2Click(Sender: TObject);
begin
   Form4.Close;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
    EnableMenuItem(GetSystemMenu(Form4.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.
