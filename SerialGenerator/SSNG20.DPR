program ssng20;

uses
  Forms,
  ssng1 in 'ssng1.pas' {frmSSNG};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'WBS Serial Generator';
  Application.CreateForm(TfrmSSNG, frmSSNG);
  Application.Run;
end.
