unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm14 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Fparagon : String;
    
  public
    { Public declarations }
    property paragon : String read Fparagon write Fparagon;
  end;

var
  Form14: TForm14;

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
    if (NOT (sBuffer[i] in ['0'..'9'])) then begin
      Result := False;
    exit;
  end;
end;
end;

procedure TForm14.Button2Click(Sender: TObject);
begin
  Form14.Close;
end;

procedure TForm14.Button1Click(Sender: TObject);
begin
  if (IsNumeric(Edit1.Text) = true) and (Edit1.Text <> '0')then
  begin
    Fparagon := Edit1.Text;
    Form14.Close;
  end
  else
    ShowMessage('Neispravan broj! Broj mora biti veæi od 0 ');

end;

procedure TForm14.FormCreate(Sender: TObject);
begin
  Fparagon := '0';
end;

end.
