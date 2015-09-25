unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, Menus, Buttons, StdCtrls, IniFiles, StrUtils, AppEvnts;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TfrmMain = class(TForm)
    PopupMenu1: TPopupMenu;
    Mostrar1: TMenuItem;
    Ocultar1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    ComboBox1: TComboBox;
    btnEjecutar: TBitBtn;
    ReOpen1: TMenuItem;
    N2: TMenuItem;
    OpenDialog1: TOpenDialog;
    btnExaminar: TBitBtn;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    About1: TMenuItem;
    Open1: TMenuItem;
    Browse1: TMenuItem;
    N3: TMenuItem;
    Hidetotray1: TMenuItem;
    Clearrecentlist1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Exit1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    HideonMinimize1: TMenuItem;
    About2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Mostrar1Click(Sender: TObject);
    procedure Ocultar1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure btnExaminarClick(Sender: TObject);
    procedure btnEjecutarClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Hidetotray1Click(Sender: TObject);
    procedure Clearrecentlist1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure About2Click(Sender: TObject);
  private
    { Private declarations }
    TrayIconData: TNotifyIconData;
    function ReadIni(Section, Key, Default: String): String;
    procedure WriteIni(Section, Key, Value: String);
    procedure RefreshList;
  public
    { Public declarations }
    procedure TrayMessage(var msg: TMessage);
    message WM_ICONTRAY;
  end;

var
  frmMain: TfrmMain;

implementation


//uses untAboutBox;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
var
  I, J: Integer;
  strAux: String;
  MenuItem: TMenuItem;
begin
  with TrayIconData do
  begin
  //  cbSize := SizeOf(TrayIconData);
    Wnd := Handle;                              //Window.
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;           //We use the same application icon.
    StrPCopy(szTip, Application.Title);         //This is the hint of the icon.
  end;

  Shell_NotifyIcon(NIM_ADD, @TrayIconData);

//Load the recent list
  J:= StrToInt(ReadIni('Recent', 'Count', '0'));
  ReOpen1.Clear;
  for I:= 0 to J - 1 do
  begin
    strAux:= ReadIni('Recent', IntToStr(I), '');
    ComboBox1.Items.Add(strAux);

    MenuItem:= TMenuItem.Create(PopupMenu1);
    MenuItem.Caption:= strAux;
    MenuItem.OnClick:= MenuItem1Click;

    ReOpen1.Add(MenuItem);
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TfrmMain.TrayMessage(var msg: TMessage);
var
  p : TPoint;
begin
  case Msg.lParam of
    WM_LBUTTONDBLCLK:
      Mostrar1.Click;

    WM_RBUTTONDOWN:
    begin
       SetForegroundWindow(Handle);
       GetCursorPos(p);
       PopUpMenu1.Popup(p.x, p.y);
       PostMessage(Handle, WM_NULL, 0, 0);
    end;
  end;
end;

procedure TfrmMain.Mostrar1Click(Sender: TObject);
begin
  if HideonMinimize1.Checked then
  begin
    Application.Restore;
    application.BringToFront;
  end;

  Self.Show;
end;

procedure TfrmMain.Ocultar1Click(Sender: TObject);
begin
  Self.Hide;
end;

procedure TfrmMain.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnExaminarClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    ComboBox1.Text:= OpenDialog1.FileName;
  end;
end;

procedure TfrmMain.btnEjecutarClick(Sender: TObject);
var
  I: Integer;
  strAux: String;
begin
  if ComboBox1.Text <> '' then
  begin
    if ShellExecute(Self.Handle, nil, PChar(ComboBox1.Text), nil, PChar(ExtractFileDir(ComboBox1.Text)), SW_SHOWNORMAL) > 32 then
    begin
      I:= ComboBox1.Items.IndexOf(ComboBox1.Text);
      if I = -1 then
        ComboBox1.Items.Insert(0, ComboBox1.Text)
      else
      begin
        strAux:= ComboBox1.Text;
        ComboBox1.Items.Delete(I);
        ComboBox1.Items.Insert(0, strAux);
      end;
      RefreshList;
    end
    else
      MessageDlg('can''t open the file', mtWarning, [mbOK], 0);
  end;
end;

function TfrmMain.ReadIni(Section, Key, Default: String): String;
var
  IFile: TIniFile;
begin
  IFile:= TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    if IFile.ValueExists(Section, Key) then
      Result:= IFile.ReadString(Section, Key, Default)
    else
    begin
      IFile.WriteString(Section, Key, Default);
      Result:= Default;
    end;
  finally
    IFile.Free;
  end;
end;

procedure TfrmMain.WriteIni(Section, Key, Value: String);
var
  IFile: TIniFile;
begin
  IFile:= TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    IFile.WriteString(Section, Key, Value);
  finally
    IFile.Free;
  end;
end;

procedure TfrmMain.RefreshList;
var
  I: Integer;
  MenuItem: TMenuItem;
begin
  ReOpen1.Clear;
  WriteIni('Recent', 'Count', IntToStr(ComboBox1.Items.Count));

  for I:= 0 to ComboBox1.Items.Count - 1 do
  begin
    WriteIni('Recent', IntToStr(I), ComboBox1.Items[I]);

    MenuItem:= TMenuItem.Create(PopupMenu1);
    MenuItem.Caption:= ComboBox1.Items[I];
    MenuItem.OnClick:= MenuItem1Click;

    ReOpen1.Insert(I, MenuItem);
  end;
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Hidetotray1Click(Sender: TObject);
begin
  Self.Hide;
end;

procedure TfrmMain.Clearrecentlist1Click(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  RefreshList;
end;

procedure TfrmMain.MenuItem1Click(Sender: TObject);
var
  strAux: String;
begin
  strAux:= AnsiReplaceStr(TMenuItem(Sender).Caption, '&', '');
  ShellExecute(Self.Handle, nil, PChar(strAux), nil, PChar(ExtractFileDir(strAux)), SW_SHOWNORMAL);
end;

procedure TfrmMain.About1Click(Sender: TObject);
begin
 // frmAboutBox.ShowModal;
end;

procedure TfrmMain.ApplicationEvents1Minimize(Sender: TObject);
begin
  if HideonMinimize1.Checked then
    Self.Hide;
end;

procedure TfrmMain.About2Click(Sender: TObject);
begin
  About1.Click;
end;

end.
