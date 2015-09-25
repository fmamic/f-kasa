program blagajna;

uses
  Forms,
  UnitKasa in 'UnitKasa.pas' {frmBlagajna};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmBlagajna, frmBlagajna);
  Application.Run;
end.
