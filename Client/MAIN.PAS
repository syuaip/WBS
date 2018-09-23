{ Nama Program : wClient 0.9.8.2 alpha stable }
{ Bagian dari Project : Warnet Billing }
{ Update Terakhir : 31 Maret 2001 }
{ Oleh : Arief W Nugraha ariefwn@yahoo.com }
{ Update 0.9.8.2.as : }
{ - Comply dg format baru hitungan grace period dan free time di WBS4.2.0a }
{ Update 0.9.8.1.as : }
{ - Bug at KILL }
{ Update 0.9.7.1.as : }
{ - Web Page ke Tripod }
{ Update 0.9.7.a : }
{ - Time Sync dengan wServer }

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, ScktComp, ExtCtrls, ComCtrls, WinProcs,
  Registry, ShellAPI;

type
  TwClientForm = class(TForm)
    Panel1: TPanel;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    shpBilling: TShape;
    Label4: TLabel;
    lblDateTime: TLabel;
    shpLine: TShape;
    shpAkses: TShape;
    Memo2: TMemo;
    Memo1: TMemo;
    btnConnect: TButton;
    btnDisconnect: TButton;
    btnExit: TButton;
    edtUserName: TEdit;
    edtPassword: TEdit;
    edtMembership: TEdit;
    txtJam: TStaticText;
    StaticText2: TStaticText;
    txtMenit: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    txtBiaya: TStaticText;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    StaticText6: TStaticText;
    btnMinimize: TButton;
    ClientSocket: TClientSocket;
    Timer1: TTimer;
    Timer2: TTimer;
    tmrDateTime: TTimer;
    procedure FileConnectItemClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ServerSocketError(Sender: TObject; Number: Smallint;
      var Description: string; Scode: Integer; const Source,
      HelpFile: string; HelpContext: Integer; var CancelDisplay: Wordbool);
    procedure Disconnect1Click(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketAccept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Process_SYNC;
    procedure Process_BROADCAST(MessageStr : String);
    procedure Process_TIME(NowStr : String);
    procedure Process_HIDE(ClientID : String);
    procedure Process_SHOW(ClientID : String);
    procedure Process_HIDESTART(ClientID : String);
    procedure Process_SHOWSTART(ClientID : String);
    procedure Process_OPENACCESS(ClientID : String);
    procedure Process_CLOSEACCESS(ClientID : String);
    procedure Process_CLOSE(ClientID : String);
    procedure Process_REC(ClientID : String);
    procedure Process_WHO(ClientID : String);
    procedure Process_SHUTDOWN(ClientID : String);
    procedure Process_REBOOT(ClientID : String);
    procedure Process_AUTHGST(StaStr, StAccess : String);
    procedure Process_AUTHNON(StaStr : String);
    procedure Process_AUTHADM(StaStr : String);
    procedure Process_LOGOUTOK(StaStr : String);
    procedure Process_LOCK;
    procedure Process_UNLOCK;
    procedure Process_COUNT;
    procedure Process_DISCOUNT;
    procedure Process_HOME(StaStr : String);
    procedure ResetDisplay;
    procedure Akses_None;
    procedure Akses_Admin;
    procedure Akses_Guest(stAccess : String);
    procedure Akses_Member;
    procedure Hide_Taskbar;
    procedure Show_Taskbar;
    procedure ShowLamps(Lampu, Warna : Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Process_RATES(StaStr : String);
    procedure btnExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnMinimizeClick(Sender: TObject);
    procedure SafeSend(St : String);
    procedure Label4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure tmrDateTimeTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    IsServer: Boolean;
  end;

var
  wClientForm: TwClientForm;
  Server, ClientAddress: String;
  vExperimental,
  ShallDie,
  bCounting : Boolean;
  bMinutes : Longint;
  Ctr,  vLineStatus,
  vGracePeriod,
  OnlineCost, OtherCost : Longint;
  vHourRates, vFlagFall : Longint;
  vSearchURL, vHomeURL : String;
  T2XiS : Integer;

implementation

uses hideme;

{$R *.DFM}

function ReadRegistryString(Sectionz, Keyz : String) : String;
var
  Valuez : String; Reg: TRegistry;
begin
  Valuez := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\'+Sectionz, True)
      then Valuez := Reg.ReadString(Keyz);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  ReadRegistryString := Valuez;
end;

procedure SetExplorer;
var
  Reg: TRegistry;
begin
  If vExperimental then Exit;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Internet Explorer\Main', True)
      then Reg.WriteString('Start Page',vHomeURL);
    if Reg.OpenKey('\Software\Microsoft\Internet Explorer\Main', True)
      then Reg.WriteString('Search Page',vSearchURL);
    if Reg.OpenKey('\Software\Microsoft\Internet Explorer\SearchUrl', True)
      then Reg.WriteString('(Default)',vSearchURL);
    if Reg.OpenKey('\Software\Mirabilis\ICQ\Bookmarks', True)
      then Reg.WriteString('StartPage',vHomeURL);
    if Reg.OpenKey('\Software\Microsoft\Internet Explorer\MenuExt\GoHip!', False)
      then Reg.DeleteKey('\Software\Microsoft\Internet Explorer\MenuExt\GoHip!');

    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\Software\Microsoft\Internet Explorer\Search', True)
      then begin
         Reg.WriteString('CustomizeSearch',vSearchURL);
         Reg.WriteString('SearchAssistant',vSearchURL);
      end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure WriteRegistryString(Sectionz, Keyz, Valuez : String);
var
  Reg: TRegistry;
begin
  If vExperimental then Exit;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\'+Sectionz, True)
      then Reg.WriteString(Keyz,Valuez);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure WriteRegistryInteger(Sectionz, Keyz : String; Valuez : Integer);
var
  Reg: TRegistry;
begin
  If vExperimental then Exit;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\'+Sectionz, True)
      then Reg.WriteInteger(Keyz,Valuez);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure SetStrictRegistry;
begin
  SetExplorer;

  WriteRegistryInteger('Policies\System','NoDispCPL',1);
  WriteRegistryInteger('Policies\System','NoDispBackgroundPage',1);
  WriteRegistryInteger('Policies\System','NoDispScrSavPage',1);
  WriteRegistryInteger('Policies\System','NoDispAppearancePage',1);
  WriteRegistryInteger('Policies\System','NoDispSettingsPage',1);
  WriteRegistryInteger('Policies\System','NoDevMgrPage',1);
  WriteRegistryInteger('Policies\System','NoVirtMemPage',1);
  WriteRegistryInteger('Policies\System','NoConfigPage',1);
  WriteRegistryInteger('Policies\System','NoFileSysPage',1);

  WriteRegistryInteger('Policies\Explorer','NoSetFolders',1);
  WriteRegistryInteger('Policies\Explorer','NoSaveSettings',1);
  WriteRegistryInteger('Policies\Explorer','NoRun',1);
  WriteRegistryInteger('Policies\Explorer','NoFind',1);
//  WriteRegistryInteger('Policies\Explorer','NoPrinterTabs',1);
//  WriteRegistryInteger('Policies\Explorer','NoDeletePrinter',1);
//  WriteRegistryInteger('Policies\Explorer','NoAddPrinter',1);

  WriteRegistryInteger('Policies\Network','NoNetSetup',1);
  WriteRegistryInteger('Policies\Network','NoNetSetupSecurityPage',1);

  WriteRegistryInteger('Policies\WinOldApp','Disabled',1);
  WriteRegistryInteger('Policies\WinOldApp','NoRealMode',1);
end;

procedure SetLooseRegistry;
begin
  SetExplorer;

  WriteRegistryInteger('Policies\System','NoDispCPL',0);
  WriteRegistryInteger('Policies\System','NoDispBackgroundPage',0);
  WriteRegistryInteger('Policies\System','NoDispScrSavPage',0);
  WriteRegistryInteger('Policies\System','NoDispAppearancePage',0);
  WriteRegistryInteger('Policies\System','NoDispSettingsPage',0);
  WriteRegistryInteger('Policies\System','NoDevMgrPage',0);
  WriteRegistryInteger('Policies\System','NoVirtMemPage',0);
  WriteRegistryInteger('Policies\System','NoConfigPage',0);
  WriteRegistryInteger('Policies\System','NoFileSysPage',0);

  WriteRegistryInteger('Policies\Explorer','NoSetFolders',0);
  WriteRegistryInteger('Policies\Explorer','NoSaveSettings',0);
  WriteRegistryInteger('Policies\Explorer','NoRun',0);
  WriteRegistryInteger('Policies\Explorer','NoFind',0);
//  WriteRegistryInteger('Policies\Explorer','NoPrinterTabs',0);
//  WriteRegistryInteger('Policies\Explorer','NoDeletePrinter',0);
//  WriteRegistryInteger('Policies\Explorer','NoAddPrinter',0);

  WriteRegistryInteger('Policies\Network','NoNetSetup',0);
  WriteRegistryInteger('Policies\Network','NoNetSetupSecurityPage',0);

  WriteRegistryInteger('Policies\WinOldApp','Disabled',0);
  WriteRegistryInteger('Policies\WinOldApp','NoRealMode',0);

  WriteRegistryInteger('Policies\WinOldApp','NoRealMode',0);

end;

function MakeItAString(I: Longint): string;
var
  S: string[11];
begin
  Str(I, S);
  MakeItAString:= S;
end;

procedure ShowDesktopIcons;
var
  hDesktop : THandle;
begin
   hDesktop := FindWindow('Progman', nil);
   ShowWindow(hDesktop, 1);
end;

procedure HideDesktopIcons;
var
  hDesktop : THandle;
begin
   hDesktop := FindWindow('Progman', nil);
   ShowWindow(hDesktop, 0);
end;

procedure TwClientForm.ShowLamps(Lampu, Warna : Char);
var TC : TColor;
begin
  TC := clWhite;
  Case Warna of
    'R' : TC := clRed;
    'Y' : TC := clYellow;
    'G' : TC := clLime;
    'F' : TC := clFuchsia;
  End;
  Case Lampu of
    'B' : shpBilling.Brush.Color := TC;
    'L' : shpLine.Brush.Color := TC;
    'A' : shpAkses.Brush.Color := TC;
  End;
end;

function Limit(XiS, Barrier : Integer) : Integer;
begin
   If XiS <= Barrier then
     Limit := XiS
   else
     Limit := Barrier;
end;

function Encrypt(St : String) : String;
var XiS : Integer; StZ : String;
begin
  If Length(St)> 0 then For XiS := 1 to Length(St) do begin
      St[XiS] := Chr((Ord(St[XiS]) - 17) XOR $25);
  end;
  Encrypt := St;
end;

function Decrypt(St : String) : String;
var XiS : integer; StZ : String;
begin
  If Length(St)> 0 then For XiS := 1 to Length(St) do begin
    St[XiS] := Chr((Ord(St[XiS]) XOR $25) + 17);
  end;
  Decrypt := St;
end;

procedure TwClientForm.SafeSend(St : String);
var XiS : Integer; SendOk : Boolean; St2 : String;
begin
   XiS := 0;
   St2 := Encrypt(St);
   Repeat
     SendOk := True;
     try
       ClientSocket.Socket.SendText(St2);
     except
       SendOk := False;
       Inc(Xis);
     end;
   Until (SendOk) OR (XiS > 20);
   If NOT SendOk then begin
        Memo2.Lines.Add('SafeSend Error//'+ClientSocket.Socket.RemoteAddress+'//'+St);
        ShowLamps('L','F');
     end;
end;

procedure TwClientForm.Hide_Taskbar;
var WindowHandle:  hWnd;
begin
    WindowHandle := FindWindow('Shell_TrayWnd', '');
    IF WindowHandle <> 0 THEN
       Begin
         ShowWindow(WindowHandle, SW_HIDE);
         SafeSend('//TASKBAR GONE//');
       End
    Else SafeSend('//ERROR:HT2//');
end;

procedure TwClientForm.Show_Taskbar;
var WindowHandle:  hWnd;
begin
    WindowHandle := FindWindow('Shell_TrayWnd', '');
    IF WindowHandle <> 0 THEN
       Begin
         ShowWindow(WindowHandle, SW_RESTORE);
         SafeSend('//TASKBAR CAME//');
       End
    Else SafeSend('//ERROR:ST2//');
end;

procedure TwClientForm.FileConnectItemClick(Sender: TObject);
begin
  if ClientSocket.Active then ClientSocket.Active := False;
//  if Length(Server) = 0 then InputQuery('Computer to connect to', 'Address Name:', Server);
  if Length(Server) > 0 then
      with ClientSocket do
      begin
        try
          Host := Server;
          Active := True;
        except
          ;
        end;
      end;
end;

procedure TwClientForm.Exit1Click(Sender: TObject);
begin
  btnDisconnectClick(Self);
  try
 //  ServerSocket.Close;
    ClientSocket.Close;
  except
    ;
  end;
  Close;
end;

procedure TwClientForm.ResetDisplay;
var vJam, vMenit : Longint;
begin
  vJam := bMinutes DIV 60;
  vMenit := bMinutes MOD 60;
  txtJam.Caption := MakeItAString(vJam);
  If Length(txtJam.Caption) < 2 then txtJam.Caption := '0'+txtJam.Caption;
  txtMenit.Caption := MakeItAString(vMenit);
  If Length(txtMenit.Caption) < 2 then txtMenit.Caption := '0'+txtMenit.Caption;
  txtBiaya.Caption := MakeItAString(OnlineCost);
  if vExperimental then
    Application.Title := txtBiaya.Caption+'['+txtJam.Caption+':'+txtMenit.Caption+'] - Experimental'
  else
    Application.Title := txtBiaya.Caption+'['+txtJam.Caption+':'+txtMenit.Caption+']';
end;

procedure TwClientForm.Akses_None;
begin
  Hide_Taskbar;
  HideDesktopIcons;
  edtUserName.Enabled := True;
  edtPassword.Enabled := True;
  edtMembership.Text := '';
  btnConnect.Enabled := True;
  btnDisconnect.Enabled := False;
  btnExit.Visible := False;
  btnMinimize.Enabled := False;
  Memo1.ReadOnly := True;
  if vExperimental then
     Application.Title := 'Warnet Billing Client XP'
  else
     Application.Title := 'Warnet Billing Client';

  SetLooseRegistry;
end;

procedure TwClientForm.Akses_Member;
begin
  Show_Taskbar;
  ShowDesktopIcons;
  edtUserName.Enabled := False;
  edtPassword.Enabled := False;
  edtMembership.Text := 'MEMBER';
  btnConnect.Enabled := False;
  btnDisconnect.Enabled := True;
  btnExit.Visible := False;
  btnMinimize.Enabled := True;
  Memo1.ReadOnly := True;
  ResetDisplay;
  SetStrictRegistry;
end;

procedure TwClientForm.Akses_Guest(stAccess : String);
begin
  Show_Taskbar;
  ShowDesktopIcons;
  edtUserName.Enabled := False;
  edtPassword.Enabled := False;
  edtMembership.Text := stAccess;
  btnConnect.Enabled := False;
  btnDisconnect.Enabled := True;
  btnExit.Visible := False;
  btnMinimize.Enabled := True;
  Memo1.ReadOnly := True;
  ResetDisplay;
  SetStrictRegistry;
end;

procedure TwClientForm.Akses_Admin;
begin
  Show_Taskbar;
  ShowDesktopIcons;
  Process_SHOW('LOCAL');
  edtUserName.Enabled := False;
  edtPassword.Enabled := False;
  edtMembership.Text := 'ADMIN';
  btnConnect.Enabled := False;
  btnDisconnect.Enabled := True;
  btnExit.Visible := True;
  btnMinimize.Enabled := True;
  Memo1.ReadOnly := False;
  ResetDisplay;
  SetLooseRegistry;
end;

procedure TwClientForm.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    if IsServer then
//      ServerSocket.Socket.Connections[0].SendText(Memo1.Lines[Memo1.Lines.Count - 1])
    else
      SafeSend(Memo1.Lines[Memo1.Lines.Count - 1]);
end;

procedure TwClientForm.FormCreate(Sender: TObject);
begin
  ShallDie := False;
  bCounting := False;

  // TEST
  vExperimental := False;

  if ClientSocket.Active then ClientSocket.Active := False;

  Server := Trim(ReadRegistryString('Internet Settings','wServer'));
  if Length(Server) = 0 then Begin
       InputQuery('Billing Server Address', 'IP Address:', Server);
       if Length(Server) > 0 then
          WriteRegistryString('Internet Settings','wServer',Server)
       else Server := 'SERVER';
     End;

  if vExperimental then Server := 'LOCALHOST';

  vSearchURL := Trim(ReadRegistryString('Internet Settings','wSearchURL'));
  if Length(vSearchURL) = 0 then Begin
       InputQuery('Default Search URL', 'Ex. http://www.yahoo.com', vSearchURL);
       if Length(vSearchURL) > 0 then
          WriteRegistryString('Internet Settings','wSearchURL',vSearchURL)
       else vSearchURL := 'http://www.yahoo.com';
     End;

  vHomeURL := Trim(ReadRegistryString('Internet Settings','wHomeURL'));
  if Length(vHomeURL) = 0 then Begin
       InputQuery('Default Home URL', 'Ex. http://mail.yahoo.com', vHomeURL);
       if Length(vHomeURL) > 0 then
          WriteRegistryString('Internet Settings','wHomeURL',vHomeURL)
       else vHomeURL := 'http://www.nyantai.com';
     End;

  if Length(Server) > 0 then
    with ClientSocket do
      begin
        try
          Host := Server;
          Active := True;
        except
          vLineStatus := 3;
        end;
      end;

  bCounting := False;
  OnlineCost := 0;
  bMinutes := 0;
  Ctr := 0;
  ShowLamps('L','R');  {Line, Red}
  ShowLamps('A','R');  {Akses, Red}
  ShowLamps('B','R');  {Billing, Red}
  Application.Title := 'Warnet Billing Client';
  Process_HIDE('LOCAL');
  Akses_None;
end;

procedure TwClientForm.ServerSocketError(Sender: TObject; Number: Smallint;
  var Description: string; Scode: Integer; const Source, HelpFile: string;
  HelpContext: Integer; var CancelDisplay: Wordbool);
begin
  CancelDisplay := True;
  Memo2.Lines.Add('Error:'+Description);
end;

procedure TwClientForm.Disconnect1Click(Sender: TObject);
begin
  try
    ClientSocket.Active := False;
  //  ServerSocket.Active := True;
  except
    Memo2.Lines.Add('Error in disconnecting');
  end;
end;

procedure TwClientForm.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo2.Lines.Add('Connecting with local address as '+Socket.LocalAddress);
  ClientAddress := Socket.LocalAddress;
  ShowLamps('L','G');  {Line, Green}
  vLineStatus := 0;
end;

procedure TwClientForm.Process_LOCK;
begin
  Application.Minimize;
  Hide_Taskbar;
  HideDesktopIcons;
  frmHideMe.ShowModal;
end;

procedure TwClientForm.Process_UNLOCK;
begin
  frmHideMe.Close;
  if edtUserName.Enabled then
    Application.Restore
  else begin
    Show_Taskbar;
    ShowDesktopIcons;
  end;
end;

procedure TwClientForm.Process_SYNC;
begin
   Memo2.Lines.Clear;
   SafeSend('SYNCACK');
end;

function MakeItAInt(S : String) : Longint;
var Code : Integer; I : Longint;
begin
   Val(S, I, Code);
   MakeItAInt := I;
end;

procedure TwClientForm.Process_AUTHNON(StaStr : String);
begin
  MessageDlg('Data Membership '+Trim(edtUserName.Text)+' tidak ditemukan atau password salah.'+#13#10+'Silahkan dicoba lagi, atau login sebagai GUEST',mtInformation,[mbOk],0);
//  edtUserName.Text := '';
  edtPassword.Text := '';

  Akses_None;

  edtUserName.Enabled := True;
  edtUserName.SetFocus;
end;

procedure TwClientForm.Process_AUTHGST(StaStr, StAccess : String);
var XiS, P1, P2, P3, P4 : Integer; vsHourRate, vsFlagFall, vsGracePeriod, vStation : String;
begin
  P1 := Pos('[1]',StaStr);
  P2 := Pos('[2]',StaStr);
  P3 := Pos('[3]',StaStr);
  P4 := Pos('[4]',StaStr);

  vStation := Copy(StaStr,1,P1-1);
  vsHourRate := Copy(StaStr,P1+3,P2-(P1+3));
  vsFlagFall := Copy(StaStr,P2+3,P3-(P2+3));
  vsGracePeriod := Copy(StaStr,P3+3,P4-(P3+3));
  If vsGracePeriod = '' then vsGracePeriod := '0'; // default grace period is zer0

  vHourRates := MakeItAInt(vsHourRate);
  vFlagFall := MakeItAInt(vsFlagFall);
  vGracePeriod := MakeItAInt(vsGracePeriod);

  Memo2.Lines.Add('>PARSE:'+vSTATION+'/'+vsHourRate+'/'+vsFlagFall);

  bMinutes := 0;
  OnlineCost := 0;
  OtherCost := 0;

  ShowLamps('A','G');  {Akses, Green}
  ShowLamps('B','G');  {Billing, Green}
  bCounting := True;

  Memo2.Lines.Add('COUNT STARTED');
  SafeSend('BILL[DEL]START');
  Process_HIDE('LOCAL');

  Akses_Guest(stAccess);
  
  btnMinimize.Enabled := True;
  btnMinimize.SetFocus;
  Application.Minimize;
end;

procedure TwClientForm.Process_AUTHADM(StaStr : String);
var XiS, P1, P2, P3, P4 : Integer; vsHourRate, vsFlagFall, vsGracePeriod, vStation : String;
begin
  P1 := Pos('[1]',StaStr);
  P2 := Pos('[2]',StaStr);
  P3 := Pos('[3]',StaStr);
  P4 := Pos('[4]',StaStr);

  vStation := Copy(StaStr,1,P1-1);
  vsHourRate := Copy(StaStr,P1+3,P2-(P1+3));
  vsFlagFall := Copy(StaStr,P2+3,P3-(P2+3));
  vsGracePeriod := Copy(StaStr,P3+3,P4-(P3+3));
  If vsGracePeriod = '' then vsGracePeriod := '0'; // default grace period is zer0

  vHourRates := MakeItAInt(vsHourRate);
  vFlagFall := MakeItAInt(vsFlagFall);
  vGracePeriod := MakeItAInt(vsGracePeriod);

  Memo2.Lines.Add('>PARSE:'+vSTATION+'/'+vsHourRate+'/'+vsFlagFall);

  bMinutes := 0;
  OnlineCost := 0;
  OtherCost := 0;

  ShowLamps('A','G');  {Akses, Green}
  ShowLamps('B','G');  {Billing, Green}
  bCounting := True;

  Memo2.Lines.Add('BILL COUNT STARTED');
  SafeSend('BILL[DEL]START');
  Akses_Admin;

  btnMinimize.Enabled := True;
  btnMinimize.SetFocus;
  Application.Minimize;
end;

procedure TwClientForm.Process_LOGOUTOK(StaStr : String);
var XiS, P1, P2, P3 : Integer; vsHourRate, vsFlagFall, vStation : String;
begin
  bCounting := False;
  ShowLamps('B','R');  {Billing, Red}
  ShowLamps('A','R');  {Akses, Red}
  SafeSend('COST[DEL]'+MakeItAString(bMinutes)+'[1]'+MakeItAString(OnlineCost)+'[2]-');
  bMinutes := 0;
  OnlineCost := 0;
  OtherCost := 0;
  edtUserName.Text := '';
  edtPassword.Text := '';
  Timer1Timer(Self);
  Akses_None;
end;

procedure TwClientForm.Process_RATES(StaStr : String);
begin
  SafeSend('COST[DEL]'+MakeItAString(bMinutes)+'[1]'+MakeItAString(OnlineCost)+'[2]-');
end;

procedure TwClientForm.Process_HOME(StaStr : String);
begin
  vHomeURL := StaStr;
  if Length(vHomeURL) > 0 then
     WriteRegistryString('Internet Settings','wHomeURL',vHomeURL)
  else vHomeURL := 'http://www.nyantai.com';
end;

procedure TwClientForm.Process_SHUTDOWN(ClientID : String);
begin
  ShallDie := True;
  if not ExitWindowsEx(EWX_Shutdown, 0) then
     Begin
        If btnDisconnect.Enabled then begin
          Application.Restore;
          btnDisconnectClick(Self);
        End;
        SafeSend('APPSEXIT[DEL]'+edtUserName.Text);
        try
          ClientSocket.Close;
        except
          ;
        end;
     End
  else SafeSend('>UPON SHUTDOWN, AN APP REFUSE TO TERMINATE... ')
end;

procedure TwClientForm.Process_REBOOT(ClientID : String);
begin
  ShallDie := True;
  if not ExitWindowsEx(EWX_Reboot, 0) then
     Begin
        If btnDisconnect.Enabled then begin
          Application.Restore;
          btnDisconnectClick(Self);
        End;
        SafeSend('APPSEXIT[DEL]'+edtUserName.Text);
        try
          ClientSocket.Close;
        except
          ;
        end;
     End
  else SafeSend('>UPON RESTART, AN APP REFUSE TO TERMINATE... ')
end;

procedure TwClientForm.Process_REC(ClientID : String);
begin
  SafeSend('ACK');
  ShowLamps('L','G');  {Line, Green}
  vLineStatus := 0;
end;

function HideStartbutton(visi:boolean) : boolean;
Var
    Tray, Child, startbutton_handle : hWnd;
    C : Array[0..127] of Char;
    S : String;
  Begin
    Tray := FindWindow('Shell_TrayWnd', NIL);
    HideStartButton := (Tray <> 0);
    Child := GetWindow(Tray, GW_CHILD);
    While Child <> 0
          do Begin
               If GetClassName(Child, C, SizeOf(C)) > 0
                  Then Begin
                         S := StrPAS(C);
                         If UpperCase(S) = 'BUTTON'
                            then begin
                                   // IsWindowVisible(Child)
                                   startbutton_handle:=child;
                                   If Visi
                                      then ShowWindow(Child, 1)
                                      else ShowWindow(Child, 0);
                                 end;
                       End;
               Child := GetWindow(Child, GW_HWNDNEXT);
             End;
  End;

procedure TwClientForm.Process_HIDESTART(ClientID : String);
begin
    IF HideStartButton(False) THEN
       SafeSend('/SB GONE/')
    Else SafeSend('/ERROR:HS2/');
end;

procedure TwClientForm.Process_SHOWSTART(ClientID : String);
begin
    IF HideStartButton(True) THEN
       SafeSend('/SB CAME/')
    Else SafeSend('/ERROR:SS2/');
end;

procedure TwClientForm.Process_HIDE(ClientID : String);
begin
  Process_HIDESTART(ClientID);
  Process_CLOSEACCESS(ClientID);
end;

procedure TwClientForm.Process_SHOW(ClientID : String);
begin
  Process_SHOWSTART(ClientID);
  Process_OPENACCESS(CLientID);
end;

procedure TwClientForm.Process_WHO(ClientID : String);
var PCNumber, UserName, Password : String;
begin
  PCNumber := ClientSocket.Socket.LocalAddress;
  UserName := edtUserName.Text;
  Password := edtPassword.Text;
  SafeSend('STATION[DEL]'+PCNumber+'[1]'+UserName+'[2]'+Password+'[3]-');
end;

function SetDateTime(tDati: TDateTime): Boolean;
var
   tSetDati: TDateTime;
   vDatiBias: Variant;
   tTZI: TTimeZoneInformation;
   tST: TSystemTime;
begin
   GetTimeZoneInformation(tTZI);
   vDatiBias := tTZI.Bias / 1440;
   tSetDati := tDati + vDatiBias;
   with tST do
   begin
        wYear := StrToInt(FormatDateTime('yyyy', tSetDati));
        wMonth := StrToInt(FormatDateTime('mm', tSetDati));
        wDay := StrToInt(FormatDateTime('dd', tSetDati));
        wHour := StrToInt(FormatDateTime('hh', tSetDati));
        wMinute := StrToInt(FormatDateTime('nn', tSetDati));
        wSecond := StrToInt(FormatDateTime('ss', tSetDati));
        wMilliseconds := 0;
   end;
   SetDateTime := SetSystemTime(tST);
end;

procedure TwClientForm.Process_TIME(NowStr : String);
begin
   If SetDateTime(StrToDateTime(NowStr)) then
      SafeSend('/TIME SYNCED/')
   else
      SafeSend('/ERROR:PT2/');
end;

procedure TwClientForm.Process_BROADCAST(MessageStr : String);
var AppMsg : String;
begin
  AppMsg := Application.Title;
//  Application.Title := 'INFORMASI';
  Timer2.Enabled := True;
//  ShowMessage(MessageStr);

  MessageDlg(MessageStr,mtInformation,[mbOk],0);

  Timer2.Enabled := False;
  Application.Title := AppMsg;
end;

procedure TwClientForm.Process_CLOSE(ClientID : String);
begin
  ShallDie := True;
  SafeSend('APPSEXIT[DEL]'+edtUserName.Text);
  Close;
End;

procedure TwClientForm.Process_CLOSEACCESS(ClientID : String);
var result : integer;
begin
  result := 0;
  SystemParametersInfo(SPI_SCREENSAVERRUNNING, 1, @result, 0);
  SafeSend('/KEY CLOSE/');
End;

procedure TwClientForm.Process_OPENACCESS(ClientID : String);
var result : integer;
begin
  result := 0;
  SystemParametersInfo(SPI_SCREENSAVERRUNNING, 0, @result, 0);
  SafeSend('/KEY OPEN/');
end;

procedure TwClientForm.Process_COUNT;
begin
  bCounting := True;
  ShowLamps('B','G'); {Billing, Green}
  SafeSend('BILL[DEL]START');
End;

procedure TwClientForm.Process_DISCOUNT;
begin
  bCounting := False;
  ShowLamps('B','R');  {Billing, Red}
  SafeSend('BILL[DEL]STOP');
End;

procedure TwClientForm.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
  var SS, S1, S2, P2 : String;
begin

  try
    SS := Decrypt(Socket.ReceiveText);
  except
    S2 := '/FATAL:CSR2/';
  end;

  // SS := COMMAND[DEL]SATU[1]DUA[2]
  // S1  = COMMAND
  // S2  = SATU[1]DUA[2]
  // P2  = SATU

  If (Pos('[DEL]',SS) > 1) then begin
    S1 := Copy(SS,1,Pos('[DEL]',SS)-1);
    S2 := Copy(SS,Pos('[DEL]',SS)+5,Length(SS));
    P2 := Copy(S2,1,Pos('[1]',S2)-1);
    Memo2.Lines.Add('S2:'+S2+'/P2:'+P2);
    End
  Else
    S1 := SS;

  Memo2.Lines.Add('Receive:'+Socket.RemoteAddress+'-'+S1+'--');

  If (S1 = 'SYNC') then Process_SYNC;
  If (S1 = 'RATES') then Process_RATES(SS);
  If (S1 = 'REC') then Process_REC(S2);
  If (S1 = 'BROADCAST') then Process_BROADCAST(S2);
  If (S1 = 'ALLSHUTDOWN') then Process_SHUTDOWN(S2);
  If (S1 = 'TIME') then Process_TIME(S2);

  Memo2.Lines.Add('['+S2+']/['+ClientAddress+']');

  If (S2 = ClientAddress) or (P2 = ClientAddress) or vExperimental then begin
     If (S1 = 'HOME') then Process_HOME(P2); {HOME[DEL]192.168.0.101[1]http://www.nyantai.com}
     If (S1 = 'COUNT') then Process_COUNT;
     If (S1 = 'DISCOUNT') then Process_DISCOUNT;
     If (S1 = 'HIDE') then Process_HIDE(S2);
     If (S1 = 'SHOW') then Process_SHOW(S2);
     If (S1 = 'HIDESTART') then Process_HIDESTART(S2);
     If (S1 = 'SHOWSTART') then Process_SHOWSTART(S2);
     If (S1 = 'WHO') then Process_WHO(S2);
     If (S1 = 'AUTHGST') then Process_AUTHGST(S2,'GUEST');
     If (S1 = 'AUTHMBR') then Process_AUTHGST(S2,'MEMBER');
     If (S1 = 'AUTHNON') then Process_AUTHNON(S2);
     If (S1 = 'AUTHADM') then Process_AUTHADM(S2);
     If (S1 = 'LOCK') then Process_LOCK;
     If (S1 = 'UNLOCK') then Process_UNLOCK;
     If (S1 = 'REBOOT') then Process_REBOOT(S2);
     If (S1 = 'SHUTDOWN') then Process_SHUTDOWN(S2);
     If (S1 = 'OPENACCESS') then Process_OPENACCESS(S2);
     If (S1 = 'CLOSEACCESS') then Process_CLOSEACCESS(S2);
     If (S1 = 'CLOSE') then Process_CLOSE(S2);
     If (S1 = 'KILL') then begin
          If btnDisconnect.Enabled then begin
            Akses_None;
            Application.Restore;
            btnDisconnectClick(Self);

            edtUserName.Enabled := True;
            edtUserName.SetFocus;
          End;
        end;
     If (S1 = 'LOGOUTOK') then Process_LOGOUTOK(S2);
  End;
end;

procedure TwClientForm.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  try
    Memo2.Lines.Add(Socket.ReceiveText);
  except
    ;
  end;
end;

procedure TwClientForm.ServerSocketAccept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  IsServer := True;
end;

procedure TwClientForm.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo2.Lines.Add('LOCAL: '+Socket.LocalAddress);
end;

procedure TwClientForm.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ShowLamps('L','R'); {Line, Red}
  Memo2.Lines.Add('Disconnected from server');
  with ClientSocket do
    begin
     try
       Host := Server;
       Active := True;
       Memo2.Lines.Add('Reconnecting to server...');
      except
       ;
      end;
   end;
end;

procedure TwClientForm.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ShowLamps('L','R'); {Line, Red}
  Memo2.Lines.Add('Error connecting to server');
  ErrorCode := 0;
  If NOT Active then with ClientSocket do begin
     try
       Host := Server;
       Active := True;
       Memo2.Lines.Add('Reconnecting to server...');
     except
       ;
     end;
  end;
end;

procedure TwClientForm.Timer1Timer(Sender: TObject);
var StrTim : String;
begin
  If Ctr > 999 then Begin
       Ctr := 0;
       Memo2.Lines.Clear;
     End;
  If vLineStatus > 999 then Ctr := 1;
  Inc(vLineStatus);
  Inc(Ctr);
  if vLineStatus > 3 then begin
       try
         ClientSocket.Close;
       except
         ShowLamps('L','R'); {Line, Red}
       end;
       try
         ClientSocket.Open;
       except
         ShowLamps('L','G'); {Line, Green}
         vLineStatus := 0;
       end;
     end
    else if vLineStatus > 1 then ShowLamps('L','Y'); {Line, Yellow}
  If bCounting then Begin
     ShowLamps('B','G'); {Billing, Green}
     Inc(bMinutes);
     If ((bMinutes * vHourRates) DIV 60) <= vGracePeriod then OnlineCost := 0 
       else If ((bMinutes * vHourRates) DIV 60) <= vFlagFall then OnlineCost := vFlagFall
        else OnlineCost := (bMinutes * vHourRates) DIV 60;
    End
  else ShowLamps('B','R'); {Billing, Red}

  Memo2.Lines.Add(MakeItAString(Ctr)+'///'+MakeItAString(vLineStatus)+'///'+MakeItAString(bMinutes)+'///'+MakeItAString(vHourRates)+'///'+MakeItAString(OnlineCost));

  ResetDisplay;

  // 12:45:08 AM
  // 12345678901

  If NOT edtUserName.Enabled then begin
       StrTim := TimeToStr(Time);
       If (Copy(StrTim,1,5) = '11:50') AND (Copy(StrTim,10,2) = 'PM') then
          Process_BROADCAST('10 menit lagi kami akan tutup'#13#10#13#10'Pastikan barang-barang anda tidak ada yang tertinggal'#13#10#13#10'Kami senang dapat melayani anda');
     end;

end;

procedure TwClientForm.btnExitClick(Sender: TObject);
begin
  btnDisconnectClick(Self);
  Process_SHOW('LOCAL');
  ShallDie := True;
  with ClientSocket do
    begin
     Memo2.Lines.Add('Client shutting down...');
     If Active then begin
         try
           SafeSend('APPSEXIT[DEL]'+edtUserName.Text);
           Active := False;
           //Close;
         except
           ;
         end;
      end;
     Memo2.Lines.Add('Shutting Down');
    end;
  Close;
end;

procedure TwClientForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   If NOT ShallDie then begin
      If NOT edtUserName.Enabled then Application.Minimize;
      CanClose := False;
   End
   else CanClose := True;
end;

procedure TwClientForm.btnDisconnectClick(Sender: TObject);
begin
  SafeSend('LOGOUT[DEL]'+txtBiaya.Caption+'[1]'+MakeItAString(bMinutes)+'[2]-');
end;

procedure TwClientForm.btnConnectClick(Sender: TObject);
begin
   If (edtUserName.Text='PQRS') AND (edtPassword.Text='10240') then begin
       Akses_ADMIN;
       btnExitClick(Self);
     end
   else
     SafeSend('LOGIN[DEL]~');
end;

procedure TwClientForm.btnMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TwClientForm.Label4Click(Sender: TObject);
begin
  If NOT edtUserName.Enabled then
    ShellExecute(0, Nil, 'http://dekatmu.tripod.com/', Nil, Nil, SW_NORMAL)
  else
    ShowMessage('Anda belum Login. Klik di tombol ''Mulai''');
end;

procedure TwClientForm.Timer2Timer(Sender: TObject);
begin
  Inc(T2XiS);
  If T2XiS = 1 then Application.Title := 'informasi'
   else If T2XiS = 1 then Application.Title := 'INformasi'
    else If T2XiS = 2 then Application.Title := 'inFORmasi'
     else If T2XiS = 3 then Application.Title := 'inforMAsi'
      else If T2XiS = 4 then Application.Title := 'informaSI'
       else If T2XiS = 5 then Application.Title := 'INFORMASI'
        else If T2XiS = 6 then Application.Title := 'inFORMASI'
         else If T2XiS = 7 then Application.Title := 'INforMASI'
          else If T2XiS = 8 then Application.Title := 'INFORmaSI'
           else If T2XiS = 9 then Application.Title := 'INFORMAsi'
             else If T2XiS > 10 then T2XiS := 0;
end;

procedure TwClientForm.Label2Click(Sender: TObject);
begin
  If vExperimental then Process_BROADCAST('10 menit lagi kami akan tutup'#13#10#13#10'Pastikan barang-barang anda tidak ada yang tertinggal'#13#10#13#10'Kami senang dapat melayani anda');
end;

procedure TwClientForm.tmrDateTimeTimer(Sender: TObject);
begin
  lblDateTime.Caption := DateTimeToStr(Now);
end;

procedure TwClientForm.FormShow(Sender: TObject);
begin
   wClientForm.Width  := Screen.Width;
   wClientForm.Height := Screen.Height;

   wClientForm.Left := (Screen.Width - wClientForm.Width) DIV 2;
   wClientForm.Top  := (Screen.Height - wClientForm.Height) DIV 2;

   Panel1.Left := (wClientForm.Width - Panel1.Width) DIV 2;
   Panel1.Top  := (wClientForm.Height - Panel1.Height) DIV 2;
end;

end.
