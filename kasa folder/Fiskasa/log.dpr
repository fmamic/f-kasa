program log;

uses
  Forms,
  Login in 'Login.pas' {Logiranje},
  Unit3 in 'Unit3.pas' {Formablagajne};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLogiranje, Logiranje);
  Application.CreateForm(TFormablagajne, Formablagajne);
  Application.Run;
end.
