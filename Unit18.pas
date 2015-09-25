unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm18 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Fcijena : Double;
  public
    { Public declarations }
    property cijena : Double read Fcijena write Fcijena;
  end;

var
  Form18: TForm18;

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

procedure TForm18.Button2Click(Sender: TObject);
begin
  Fcijena := -1;
  Edit1.SetFocus;
  Form18.Close;
end;

procedure TForm18.Button1Click(Sender: TObject);
begin
  if IsNumeric(Edit1.Text) = true then
  begin
    Fcijena := StrToFloat(Edit1.Text);
    Form18.Close;
  end
  else
    ShowMessage(' Niste unijeli ispravnu cijenu! ');

  Edit1.SetFocus;
end;

procedure TForm18.FormShow(Sender: TObject);
begin
    Edit1.SetFocus;
end;

procedure TForm18.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Form18.Button1Click(sender);

  if Key = VK_ESCAPE then
    Form18.Button2Click(sender);
end;

end.
