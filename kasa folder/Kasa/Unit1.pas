unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, DB, ADODB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    XPManifest1: TXPManifest;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FName : String;
    FOIB : Double;
  public
    { Public declarations }
    property Name : String read FName write FName;
    property OIB : Double read FOIB write FOIB;
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  with ADOQuery1 do begin
    Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM Users WHERE User=' + QuotedStr(Edit1.Text) + ' AND Pwd=' + QuotedStr(Edit2.Text));
    Open;
  end;

  if ADOQuery1.RecordCount = 0 then
    begin
      Application.MessageBox('Osoba ne postoji u bazi', 0, 0);
    end;

  if ADOQuery1.RecordCount = 1 then
    begin
      FOIB := DataSource1.DataSet.Fields[2].Value;
      FName := DataSource1.DataSet.Fields[0].Value;
      Form2.Show;
      Form1.Hide;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
