{ This demo illustrates a simple chat program using the Client and Server socket
  components.  With this demo you can send text between two computers.   This
  program must be running on both computers at the same time for a connection
  to be made.  Once connected you can exchange text by typing into the memo and
  pressing the Enter key which will send the last line of text in the memo to
  the other machine.  }
program wClient;

uses
  Forms,
  main in 'main.pas' {wClientForm},
  hideme in 'hideme.pas' {frmHideMe};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Warnet Billing Client';
  Application.CreateForm(TwClientForm, wClientForm);
  Application.CreateForm(TfrmHideMe, frmHideMe);
  Application.Run;
end.
