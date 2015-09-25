unit Ambalaza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm8 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Fpet : Integer;
    Fstaklo : Integer;
    Falfe : Integer;
    Fukupno : Integer;

  public
    { Public declarations }
    property ukupno : Integer read Fukupno write Fukupno;
    property pet : Integer read Fpet write Fpet;
    property staklo : Integer read Fstaklo write Fstaklo;
    property alfe : Integer read Falfe write Falfe;
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.Button2Click(Sender: TObject);
begin
  Fukupno := 0;
  Form8.Close;
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
    if (NOT (sBuffer[i] in ['0'..'9'])) then begin
      Result := False;
    exit;
  end;
end;

end;

procedure TForm8.Button1Click(Sender: TObject);
begin
  Fukupno := 0;
  if IsNumeric(Edit3.Text) = true then
  begin
    Falfe := StrToInt(Edit3.Text);
    Fukupno := Fukupno + StrToInt(Edit3.Text);
  end;

  if IsNumeric(Edit2.Text) = true then
  begin
    Fstaklo := StrToInt(Edit2.Text);
    Fukupno := Fukupno + StrToInt(Edit2.Text);
  end;

  if IsNumeric(Edit1.Text) = true then
  begin
    Fpet := StrToInt(Edit1.Text);
    Fukupno := Fukupno + StrToInt(Edit1.Text);
  end;

  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';

  Label5.Caption := '0';

  Form8.Close;
end;

procedure TForm8.FormShow(Sender: TObject);
var 
  l: DWORD;

begin
  Edit1.SetFocus;
  Fpet := 0;
  Fstaklo := 0;
  Falfe := 0;
  Fukupno := 0;
  EnableMenuItem(GetSystemMenu(Form8.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
  l := GetWindowLong(Self.Handle, GWL_STYLE); 
  l := l and not (WS_MINIMIZEBOX);
  l := l and not (WS_MAXIMIZEBOX);
  l := SetWindowLong(Self.Handle, GWL_STYLE, l);
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
  Fukupno := 0;
  if IsNumeric(Edit3.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit3.Text);
  end;

  if IsNumeric(Edit2.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit2.Text);
  end;

  if IsNumeric(Edit1.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit1.Text);
  end;

  Label5.Caption := IntToStr(Fukupno);
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  Fukupno := 0;
end;

procedure TForm8.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
  Fukupno := 0;
    Edit2.SetFocus;
    if IsNumeric(Edit3.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit3.Text);
  end;

  if IsNumeric(Edit2.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit2.Text);
  end;

  if IsNumeric(Edit1.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit1.Text);
  end;

  Label5.Caption := IntToStr(Fukupno);
  end;

  if Key = VK_ESCAPE then
    Form8.Button2Click(sender);
end;

procedure TForm8.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
  Fukupno := 0;
    if IsNumeric(Edit3.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit3.Text);
  end;

  if IsNumeric(Edit2.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit2.Text);
  end;

  if IsNumeric(Edit1.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit1.Text);
  end;

  Label5.Caption := IntToStr(Fukupno);
    Edit3.SetFocus;
  end;

  if Key = VK_ESCAPE then
    Form8.Button2Click(sender);
end;

procedure TForm8.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
  Fukupno := 0;
    if IsNumeric(Edit3.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit3.Text);
  end;

  if IsNumeric(Edit2.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit2.Text);
  end;

  if IsNumeric(Edit1.Text) = true then
  begin
    Fukupno := Fukupno + StrToInt(Edit1.Text);
  end;

  Label5.Caption := IntToStr(Fukupno);
    Button1.SetFocus;
  end;

  if Key = VK_ESCAPE then
    Form8.Button2Click(sender);
end;

end.
