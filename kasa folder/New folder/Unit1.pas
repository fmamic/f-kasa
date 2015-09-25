unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, StdCtrls, Buttons, ToolWin, ExtCtrls;

type
  TfrmMeni = class(TForm)
    MainMenu1: TMainMenu;
    Kasa1: TMenuItem;
    Blagajna1: TMenuItem;
    Izvestaji1: TMenuItem;
    Dnevnipromet1: TMenuItem;
    Prometzaradnika1: TMenuItem;
    administarcija1: TMenuItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    Pretragaporacunu1: TMenuItem;
    SpeedButton2: TSpeedButton;
    Zalihe1: TMenuItem;
    Unos1: TMenuItem;
    SpeedButton3: TSpeedButton;
    Stanje1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure Blagajna1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pretragaporacunu1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Unos1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Stanje1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMeni: TfrmMeni;

implementation

uses Unit2, Unit3, Unit5, Unit6;

{$R *.DFM}

procedure TfrmMeni.Blagajna1Click(Sender: TObject);
begin
frmBlagajna.show;
end;


procedure TfrmMeni.SpeedButton1Click(Sender: TObject);
begin
frmBlagajna.show;
end;

procedure TfrmMeni.FormCreate(Sender: TObject);
begin
DecimalSeparator := ',';
end;

procedure TfrmMeni.Pretragaporacunu1Click(Sender: TObject);
begin
frmpretraga.show;
end;

procedure TfrmMeni.SpeedButton2Click(Sender: TObject);
begin
frmpretraga.show;
end;

procedure TfrmMeni.Unos1Click(Sender: TObject);
begin
frmunoszaliha.show;
end;

procedure TfrmMeni.SpeedButton3Click(Sender: TObject);
begin
frmunoszaliha.show;
end;

procedure TfrmMeni.Stanje1Click(Sender: TObject);
begin
frmstanjesve.Query1.Close;
frmstanjesve.Query1.open;
frmstanjesve.show;
end;

procedure TfrmMeni.FormActivate(Sender: TObject);
begin
statusbar1.Panels[0].text := datetostr(date);
statusbar1.Panels[1].text := timetostr(now);
end;

procedure TfrmMeni.Timer1Timer(Sender: TObject);
begin
statusbar1.Panels[1].text := timetostr(now);
end;

end.
