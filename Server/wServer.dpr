program wServer;

uses
  Forms,
  main in 'main.pas' {wServerForm},
  quitdlg in 'quitdlg.pas' {OKRightDlg},
  uuser in 'uuser.pas' {frmUser},
  uuserflds in 'uuserflds.pas' {frmUserFields},
  ucost in 'ucost.pas' {frmCost},
  ucostflds in 'ucostflds.pas' {frmCostFields},
  upc in 'upc.pas' {frmPC},
  upcflds in 'upcflds.pas' {frmPCFields},
  umbr in 'umbr.pas' {frmMember},
  umbrflds in 'umbrflds.pas' {frmMemberFields},
  about in 'about.pas' {AboutBox},
  regist in 'regist.pas' {frmRegister},
  upwd in 'upwd.pas' {PasswordDlg};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Warnet Billing Server';
  Application.CreateForm(TwServerForm, wServerForm);
  Application.CreateForm(TOKRightDlg, OKRightDlg);
  Application.CreateForm(TfrmUser, frmUser);
  Application.CreateForm(TfrmUserFields, frmUserFields);
  Application.CreateForm(TfrmCost, frmCost);
  Application.CreateForm(TfrmCostFields, frmCostFields);
  Application.CreateForm(TfrmPC, frmPC);
  Application.CreateForm(TfrmPCFields, frmPCFields);
  Application.CreateForm(TfrmMember, frmMember);
  Application.CreateForm(TfrmMemberFields, frmMemberFields);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.Run;
end.
