unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm16 = class(TForm)
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
  Form16: TForm16;

implementation

{$R *.dfm}

uses Unit15;

procedure TForm16.Button2Click(Sender: TObject);
begin

  FbuttonOK := false;
  Form16.Close;
end;

procedure TForm16.FormShow(Sender: TObject);
begin

  Memo1.Lines.Assign(Form15.lines);
  
end;

procedure TForm16.Button1Click(Sender: TObject);
begin
  FbuttonOK := true;
  Form16.Close;
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  EnableMenuItem(GetSystemMenu(Form16.Handle, LongBool(False)),
    SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

end.
