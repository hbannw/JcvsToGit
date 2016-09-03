program JvcsToGit_D2007;

uses
  Forms,
  uJVcsToGit in 'uJVcsToGit.pas' {DbIsamToGit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDbIsamToGit, DbIsamToGit);
  Application.Run;
end.
