unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Fpopust : Double;

  public
    { Public declarations }

    property popust : Double read Fpopust write Fpopust;

  end;

  function IsNumeric(sBuffer : String) : Boolean;

var
  Form7: TForm7;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Edit1.Text := '';
  Label5.Caption := '0,00';
  Form7.Close;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  Label5.Caption := '0,00';
  if Edit1.Text <> '' then
    popust := strToFloat(Edit1.Text);
  Form7.Close;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  Edit1.Text := '';
  Label5.Caption := '0,00';
  Form7.Close;
end;

procedure TForm7.FormShow(Sender: TObject);
var 
  l: DWORD;
  
begin
  Label4.Caption := Format('%.2f', [Form2.suma ]);
  Edit1.SetFocus;
  EnableMenuItem(GetSystemMenu(Form7.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
  l := GetWindowLong(Self.Handle, GWL_STYLE);
  l := l and not (WS_MINIMIZEBOX);
  l := l and not (WS_MAXIMIZEBOX);
  l := SetWindowLong(Self.Handle, GWL_STYLE, l);
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
    if (NOT (sBuffer[i] in ['0'..'9'])) and (sBuffer[i] <> ',') then begin
      Result := False;
    exit;
  end;
end;

end;

procedure TForm7.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if isNumeric(Edit1.Text) = true then
      Label5.Caption := Format('%.2f', [(Form2.suma * StrToFloat(Edit1.Text))/100])
    else
      Edit1.Text := '';

    if Key = VK_RETURN then
      Form7.Button1Click(sender);

    if Key = VK_ESCAPE then
      Form7.Button2Click(sender);
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  EnableMenuItem(GetSystemMenu(Form7.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

end.
