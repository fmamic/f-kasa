unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TfrmKusur = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKusur: TfrmKusur;

implementation

uses Unit2, Unit1, Unit7 ;

{$R *.DFM}





procedure TfrmKusur.FormActivate(Sender: TObject);
begin
edit1.Text := frmblagajna.edit4.text;
label5.Caption := frmblagajna.Edit5.Text ;
edit2.Text := '0,00';
edit2.SetFocus ;

end;

procedure TfrmKusur.Edit2Exit(Sender: TObject);
var
prvo,drugo,trece : double;
begin
prvo := strtofloat(edit1.text);
drugo := strtofloat(edit2.text);
edit1.Text := (Format('%f', [prvo]));
edit2.Text := (Format('%f', [drugo]));
edit3.Text := (Format('%f', [trece])); 

edit3.Text := floattostr(drugo - prvo);
end;

procedure TfrmKusur.Edit1Exit(Sender: TObject);

var
prvo,drugo,trece : double;
begin
prvo := strtofloat(edit1.text);
drugo := strtofloat(edit2.text);
trece := strtofloat(edit3.text);
edit1.Text := (Format('%f', [prvo]));
edit2.Text := (Format('%f', [drugo]));
edit3.Text := (Format('%f', [trece]));
end;

procedure TfrmKusur.Edit3Change(Sender: TObject);
var
prvo,drugo,trece : double;
begin
prvo := strtofloat(edit1.text);
drugo := strtofloat(edit2.text);
trece := strtofloat(edit3.text);
edit1.Text := (Format('%f', [prvo]));
edit2.Text := (Format('%f', [drugo]));
edit3.Text := (Format('%f', [trece]));
end;

procedure TfrmKusur.BitBtn1Click(Sender: TObject);
 
begin
frmkusur.close;
 frmracun.QRLabel2.Caption := frmkusur.label5.Caption ;
 frmracun.QRLabel6.Caption := frmblagajna.Edit4.Text ;
  frmracun.QRLabel7.Caption := frmmeni.StatusBar1.Panels[2].text;
 frmracun.Preview ;
 




end;

procedure TfrmKusur.BitBtn2Click(Sender: TObject);
begin
WinExec ('calc.exe', SW_SHOWNORMAL); 
end;

end.
