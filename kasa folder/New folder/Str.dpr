program Str;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmMeni},
  Unit2 in 'Unit2.pas' {frmBlagajna},
  Unit3 in 'Unit3.pas' {frmPretraga},
  Unit4 in 'Unit4.pas' {frmKusur},
  Unit5 in 'Unit5.pas' {frmUnosZaliha},
  Unit6 in 'Unit6.pas' {frmStanjeSve},
  Unit7 in 'Unit7.pas' {frmRacun: TQuickRep},
  Unit8 in 'Unit8.pas' {frmIzbor},
  Unit9 in 'Unit9.pas' {frmLogin};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMeni, frmMeni);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmBlagajna, frmBlagajna);
  Application.CreateForm(TfrmPretraga, frmPretraga);
  Application.CreateForm(TfrmKusur, frmKusur);
  Application.CreateForm(TfrmUnosZaliha, frmUnosZaliha);
  Application.CreateForm(TfrmStanjeSve, frmStanjeSve);
  Application.CreateForm(TfrmRacun, frmRacun);
  Application.CreateForm(TfrmIzbor, frmIzbor);
  Application.Run;
end.
