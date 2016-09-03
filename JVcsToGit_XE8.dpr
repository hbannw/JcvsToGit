program JVcsToGit_XE8;

uses
  Vcl.Forms,
  uJVcsToGit in 'uJVcsToGit.pas' {DbIsamToGit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDbIsamToGit, DbIsamToGit);
  Application.Run;
end.
