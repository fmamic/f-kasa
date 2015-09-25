unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm17 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
        FbuttonOK : Boolean;
  public
    { Public declarations }
        property buttonOK : Boolean read FbuttonOK write FbuttonOK;
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}
uses Unit2;

procedure TForm17.Button2Click(Sender: TObject);
begin
  FbuttonOK := false;
  Form17.Close;
end;

procedure TForm17.FormShow(Sender: TObject);
begin
  Memo1.Lines.Assign(Form2.lines5);
end;

procedure TForm17.Button1Click(Sender: TObject);
begin
  FbuttonOK := true;
  Form17.Close;
end;

procedure TForm17.FormCreate(Sender: TObject);
begin
    EnableMenuItem(GetSystemMenu(Form17.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

end.
