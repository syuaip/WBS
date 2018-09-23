{ Nama Program : WBS }
{ Bagian dari Project : Warnet Billing }
{ Update Terakhir : 1 Juli 2001, 01.55 }
{ Oleh : Arief W Nugraha ariefwn@yahoo.com }
{ Update 0.5.1 alpha : 22 Juli 2001 }
{ - Client diberi window tabir untuk proteksi }
{ - Jumlah Client diperbanyak (12 ke 16, dan ke 20) }
{ - Dump Billing Log dibalik dari TimeLogin, TimeLogout, Biaya }
{   jadi TimeLogout, TimeLogin, Biaya }
{ Update 0.5 alpha : 10 Juni 2001 }
{ - Tambah User Login }
{ Update 0.4.2 alpha stable : 17 Mei 2001 }
{ - Tambah field Grace Period di DB }
{ - Buat entry edit/maintenance Grace Period dan Flag Fall }
{ Update 0.4.1.6 alpha stable : }
{ - Remove 'Add Member' Bug }
{ Update 0.4.1.5 alpha stable : }
{ - Confirmation on Reboot, Shutdown }
{ - Log Timer set to 15 minutes }
{ Update 0.4.1.1 alpha stable : }
{ - Change Web Address }
{ Update 0.4.1.0 alpha : }
{ - Support CRC-sort-of }

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, ScktComp, ExtCtrls, ComCtrls, Registry,
  Mask, Db, DBTables, FileCtrl, ShellAPI, Grids, DBGrids;

type
  TwServerForm = class(TForm)
    Bevel1: TBevel;
    Memo1: TMemo;
    Memo2: TMemo;
    ServerSocket: TServerSocket;
    Timer1: TTimer;
    Timer2: TTimer;
    memoBilling: TMemo;
    gbClient01: TGroupBox;
    Label1: TLabel;
    shpLine01: TShape;
    btnMsg01: TButton;
    btnReset01: TButton;
    btnTrans01: TButton;
    btnDisabl01: TButton;
    btnKill01: TButton;
    edtMulai01: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtWaktu01: TEdit;
    edtBiaya01: TEdit;
    gbGlobal: TGroupBox;
    shpAcc01: TShape;
    shpBill01: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSetup01: TButton;
    Label7: TLabel;
    lblRevenue: TLabel;
    gbClient02: TGroupBox;
    Label8: TLabel;
    shpLine02: TShape;
    Label9: TLabel;
    Label10: TLabel;
    shpAcc02: TShape;
    shpBill02: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnMsg02: TButton;
    btnReset02: TButton;
    btnTrans02: TButton;
    btnDisabl02: TButton;
    btnKill02: TButton;
    edMulai02: TEdit;
    edWaktu02: TEdit;
    edBiaya02: TEdit;
    btnSetup02: TButton;
    gbClient03: TGroupBox;
    Label14: TLabel;
    shpLine03: TShape;
    Label15: TLabel;
    Label16: TLabel;
    shpAcc03: TShape;
    shpBill03: TShape;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btnMsg03: TButton;
    btnReset03: TButton;
    btnTrans03: TButton;
    btnDisabl03: TButton;
    btnKill03: TButton;
    edMulai03: TEdit;
    edWaktu03: TEdit;
    edBiaya03: TEdit;
    btnSetup03: TButton;
    gbClient06: TGroupBox;
    Label20: TLabel;
    shpLine06: TShape;
    Label21: TLabel;
    Label22: TLabel;
    shpAcc06: TShape;
    shpBill06: TShape;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    btnMsg06: TButton;
    btnReset06: TButton;
    btnTrans06: TButton;
    btnDisabl06: TButton;
    btnKill06: TButton;
    edMulai06: TEdit;
    edWaktu06: TEdit;
    edBiaya06: TEdit;
    btnSetup06: TButton;
    gbClient05: TGroupBox;
    Label26: TLabel;
    shpLine05: TShape;
    Label27: TLabel;
    Label28: TLabel;
    shpAcc05: TShape;
    shpBill05: TShape;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    btnMsg05: TButton;
    btnReset05: TButton;
    btnTrans05: TButton;
    btnDisabl05: TButton;
    btnKill05: TButton;
    edMulai05: TEdit;
    edWaktu05: TEdit;
    edBiaya05: TEdit;
    btnSetup05: TButton;
    gbClient04: TGroupBox;
    Label32: TLabel;
    shpLine04: TShape;
    Label33: TLabel;
    Label34: TLabel;
    shpAcc04: TShape;
    shpBill04: TShape;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    btnMsg04: TButton;
    btnReset04: TButton;
    btnTrans04: TButton;
    btnDisabl04: TButton;
    btnKill04: TButton;
    edMulai04: TEdit;
    edWaktu04: TEdit;
    edBiaya04: TEdit;
    btnSetup04: TButton;
    gbClient09: TGroupBox;
    Label38: TLabel;
    shpLine09: TShape;
    Label39: TLabel;
    Label40: TLabel;
    shpAcc09: TShape;
    shpBill09: TShape;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    btnMsg09: TButton;
    btnReset09: TButton;
    btnTrans09: TButton;
    btnDisabl09: TButton;
    btnKill09: TButton;
    edMulai09: TEdit;
    edWaktu09: TEdit;
    edBiaya09: TEdit;
    btnSetup09: TButton;
    gbClient08: TGroupBox;
    Label44: TLabel;
    shpLine08: TShape;
    Label45: TLabel;
    Label46: TLabel;
    shpAcc08: TShape;
    shpBill08: TShape;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    btnMsg08: TButton;
    btnReset08: TButton;
    btnTrans08: TButton;
    btnDisabl08: TButton;
    btnKill08: TButton;
    edMulai08: TEdit;
    edWaktu08: TEdit;
    edBiaya08: TEdit;
    btnSetup08: TButton;
    gbClient07: TGroupBox;
    Label50: TLabel;
    shpLine07: TShape;
    Label51: TLabel;
    Label52: TLabel;
    shpAcc07: TShape;
    shpBill07: TShape;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    btnMsg07: TButton;
    btnReset07: TButton;
    btnTrans07: TButton;
    btnDisabl07: TButton;
    btnKill07: TButton;
    edMulai07: TEdit;
    edWaktu07: TEdit;
    edBiaya07: TEdit;
    btnSetup07: TButton;
    gbClient12: TGroupBox;
    Label56: TLabel;
    shpLine12: TShape;
    Label57: TLabel;
    Label58: TLabel;
    shpAcc12: TShape;
    shpBill12: TShape;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    btnMsg12: TButton;
    btnReset12: TButton;
    btnTrans12: TButton;
    btnDisabl12: TButton;
    btnKill12: TButton;
    edMulai12: TEdit;
    edWaktu12: TEdit;
    edBiaya12: TEdit;
    btnSetup12: TButton;
    gbClient11: TGroupBox;
    Label62: TLabel;
    shpLine11: TShape;
    Label63: TLabel;
    Label64: TLabel;
    shpAcc11: TShape;
    shpBill11: TShape;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    btnMsg11: TButton;
    btnReset11: TButton;
    btnTrans11: TButton;
    btnDisabl11: TButton;
    btnKill11: TButton;
    edMulai11: TEdit;
    edWaktu11: TEdit;
    edBiaya11: TEdit;
    btnSetup11: TButton;
    gbClient10: TGroupBox;
    Label68: TLabel;
    shpLine10: TShape;
    Label69: TLabel;
    Label70: TLabel;
    shpAcc10: TShape;
    shpBill10: TShape;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    btnMsg10: TButton;
    btnReset10: TButton;
    btnTrans10: TButton;
    btnDisabl10: TButton;
    btnKill10: TButton;
    edMulai10: TEdit;
    edWaktu10: TEdit;
    edBiaya10: TEdit;
    btnSetup10: TButton;
    btnShutdown: TButton;
    btnReboot: TButton;
    btnBilling: TButton;
    btnBroadcast: TButton;
    MainMenu1: TMainMenu;
    mniAccess: TMenuItem;
    mniMaintenance: TMenuItem;
    mniReport: TMenuItem;
    mnuLogin: TMenuItem;
    mnuLogout: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    mniSetting: TMenuItem;
    N2: TMenuItem;
    mnuAbout: TMenuItem;
    mnuMember: TMenuItem;
    mnuComputer: TMenuItem;
    mnuDailyRecapitulation: TMenuItem;
    mnuCost: TMenuItem;
    Database1: TDatabase;
    Query1: TQuery;
    DataSource1: TDataSource;
    Label74: TLabel;
    lblPrint: TLabel;
    Label75: TLabel;
    lblScan: TLabel;
    Label76: TLabel;
    lblDisket: TLabel;
    mnuUser: TMenuItem;
    mnuTransaction: TMenuItem;
    tmrMemo2: TTimer;
    mnuHelp: TMenuItem;
    mnuHomepage: TMenuItem;
    mnuHelpContent: TMenuItem;
    mnuRegister: TMenuItem;
    mniControl: TMenuItem;
    Reboot1: TMenuItem;
    Shutdown1: TMenuItem;
    Broadcast1: TMenuItem;
    SetHome1: TMenuItem;
    dbX: TDatabase;
    tblX: TTable;
    DataSource2: TDataSource;
    N3: TMenuItem;
    N4: TMenuItem;
    gbClient13: TGroupBox;
    Label77: TLabel;
    shpLine13: TShape;
    Label78: TLabel;
    Label79: TLabel;
    shpAcc13: TShape;
    shpBill13: TShape;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    btnMsg13: TButton;
    btnReset13: TButton;
    btnTrans13: TButton;
    btnDisabl13: TButton;
    btnKill13: TButton;
    edMulai13: TEdit;
    edWaktu13: TEdit;
    edBiaya13: TEdit;
    btnSetup13: TButton;
    gbClient14: TGroupBox;
    Label83: TLabel;
    shpLine14: TShape;
    Label84: TLabel;
    Label85: TLabel;
    shpAcc14: TShape;
    shpBill14: TShape;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    btnMsg14: TButton;
    btnReset14: TButton;
    btnTrans14: TButton;
    btnDisabl14: TButton;
    btnKill14: TButton;
    edMulai14: TEdit;
    edWaktu14: TEdit;
    edBiaya14: TEdit;
    btnSetup14: TButton;
    gbClient15: TGroupBox;
    Label89: TLabel;
    shpLine15: TShape;
    Label90: TLabel;
    Label91: TLabel;
    shpAcc15: TShape;
    shpBill15: TShape;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    btnMsg15: TButton;
    btnReset15: TButton;
    btnTrans15: TButton;
    btnDisabl15: TButton;
    btnKill15: TButton;
    edMulai15: TEdit;
    edWaktu15: TEdit;
    edBiaya15: TEdit;
    btnSetup15: TButton;
    gbClient16: TGroupBox;
    Label95: TLabel;
    shpLine16: TShape;
    Label96: TLabel;
    Label97: TLabel;
    shpAcc16: TShape;
    shpBill16: TShape;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    btnMsg16: TButton;
    btnReset16: TButton;
    btnTrans16: TButton;
    btnDisabl16: TButton;
    btnKill16: TButton;
    edMulai16: TEdit;
    edWaktu16: TEdit;
    edBiaya16: TEdit;
    btnSetup16: TButton;
    gbClient17: TGroupBox;
    Label101: TLabel;
    shpLine17: TShape;
    Label102: TLabel;
    Label103: TLabel;
    shpAcc17: TShape;
    shpBill17: TShape;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    btnMsg17: TButton;
    btnReset17: TButton;
    btnTrans17: TButton;
    btnDisabl17: TButton;
    btnKill17: TButton;
    edMulai17: TEdit;
    edWaktu17: TEdit;
    edBiaya17: TEdit;
    btnSetup17: TButton;
    gbClient18: TGroupBox;
    Label107: TLabel;
    shpLine18: TShape;
    Label108: TLabel;
    Label109: TLabel;
    shpAcc18: TShape;
    shpBill18: TShape;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    btnMsg18: TButton;
    btnReset18: TButton;
    btnTrans18: TButton;
    btnDisabl18: TButton;
    btnKill18: TButton;
    edMulai18: TEdit;
    edWaktu18: TEdit;
    edBiaya18: TEdit;
    btnSetup18: TButton;
    gbClient19: TGroupBox;
    Label113: TLabel;
    shpLine19: TShape;
    Label114: TLabel;
    Label115: TLabel;
    shpAcc19: TShape;
    shpBill19: TShape;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    btnMsg19: TButton;
    btnReset19: TButton;
    btnTrans19: TButton;
    btnDisabl19: TButton;
    btnKill19: TButton;
    edMulai19: TEdit;
    edWaktu19: TEdit;
    edBiaya19: TEdit;
    btnSetup19: TButton;
    gbClient20: TGroupBox;
    Label119: TLabel;
    shpLine20: TShape;
    Label120: TLabel;
    Label121: TLabel;
    shpAcc20: TShape;
    shpBill20: TShape;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    btnMsg20: TButton;
    btnReset20: TButton;
    btnTrans20: TButton;
    btnDisabl20: TButton;
    btnKill20: TButton;
    edMulai20: TEdit;
    edWaktu20: TEdit;
    edBiaya20: TEdit;
    btnSetup20: TButton;
    procedure FileListenItemClick(Sender: TObject);
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
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FileBroadcastItemClick(Sender: TObject);
    procedure Process_SYNCACK(CStr : String);
    procedure Process_ACK(CStr : String);
    procedure Process_STATION(CStr, StaStr : String);
    procedure Process_LOGIN(CStr, LogStr : String);
    procedure Process_LOGOUT(CStr, LogStr : String);
    procedure Process_COST(CStr, CostStr : String);
    procedure Process_BILL(CStr, BillStr : String);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnBroadcastClick(Sender: TObject);
    procedure SafeSend(ClientConnNumber : Integer; St : String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnShutdownClick(Sender: TObject);
    procedure btnBillingClick(Sender: TObject);
    procedure LoadTXs;
    procedure LoadSettings;
    procedure CheckSerials;
    procedure ClientRedraw(ClientNumber : Integer);
    procedure ClientsRedraw;
    procedure btnKill01Click(Sender: TObject);
    procedure btnKill02Click(Sender: TObject);
    procedure btnKill03Click(Sender: TObject);
    procedure btnKill04Click(Sender: TObject);
    procedure btnKill05Click(Sender: TObject);
    procedure btnKill06Click(Sender: TObject);
    procedure btnKill07Click(Sender: TObject);
    procedure btnKill08Click(Sender: TObject);
    procedure btnKill09Click(Sender: TObject);
    procedure btnKill10Click(Sender: TObject);
    procedure btnKill11Click(Sender: TObject);
    procedure btnKill12Click(Sender: TObject);
    procedure btnDisabl01Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDisabl02Click(Sender: TObject);
    procedure btnDisabl03Click(Sender: TObject);
    procedure btnDisabl04Click(Sender: TObject);
    procedure btnDisabl05Click(Sender: TObject);
    procedure btnDisabl06Click(Sender: TObject);
    procedure btnDisabl07Click(Sender: TObject);
    procedure btnDisabl08Click(Sender: TObject);
    procedure btnDisabl09Click(Sender: TObject);
    procedure btnDisabl10Click(Sender: TObject);
    procedure btnDisabl11Click(Sender: TObject);
    procedure btnDisabl12Click(Sender: TObject);
    procedure mnuLoginClick(Sender: TObject);
    procedure btnSetup01Click(Sender: TObject);
    procedure btnSetup02Click(Sender: TObject);
    procedure btnSetup03Click(Sender: TObject);
    procedure btnSetup04Click(Sender: TObject);
    procedure btnSetup05Click(Sender: TObject);
    procedure btnSetup06Click(Sender: TObject);
    procedure btnSetup07Click(Sender: TObject);
    procedure btnSetup08Click(Sender: TObject);
    procedure btnSetup09Click(Sender: TObject);
    procedure btnSetup10Click(Sender: TObject);
    procedure btnSetup11Click(Sender: TObject);
    procedure btnSetup12Click(Sender: TObject);
    procedure mnuUserClick(Sender: TObject);
    procedure mnuCostClick(Sender: TObject);
    procedure mnuComputerClick(Sender: TObject);
    procedure mnuMemberClick(Sender: TObject);
    procedure mnuTransactionClick(Sender: TObject);
    procedure tmrMemo2Timer(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure mnuHomepageClick(Sender: TObject);
    procedure mnuRegisterClick(Sender: TObject);
    procedure SetHome1Click(Sender: TObject);
    procedure btnRebootClick(Sender: TObject);
    procedure mnuLogoutClick(Sender: TObject);
  protected
    IsServer: Boolean;
  end;

Const
  constStFormCaption = 'Warnet Billing Server v0.5.1 alpha (Juli 2001)';

var
  wServerForm: TwServerForm;
  vStrFlagFall, vStrGracePeriod,
  Server: String;
  CostsCtr,
  vGracePeriod,
  vFlagFall : Integer;
  vExpired,
  vExperimental,
  bwBroadCast : Boolean;
  vRunningTimes,
  vCompanyName, vSerialNumber, vHDDSerial,
  vSTATION, vUserName, vPassword, vMemberType, vTglExpire : String;
  vRevenue : Longint;

  // variable untuk login
  vLoginUserName, vLoginPassword,
  vqLoginUserName, vqLoginPassword,
  vqLoginType, vqLoginStatus         : String;

Type tClient = Record
              Name      : String;
              User      : String;
              IP        : String;
              MulaiStr  : String;
              MulaiTime : tDateTime;
              WaktuStr  : String;
              WaktuTime : tDateTime;
              Biaya     : Integer;
              BiayaStr  : String;
              Line      : TColor;
              Access    : TColor;
              Billing   : TColor;
            End;

Type tCost = Record
             MemberType : String;
             TransactionType : String;
             TransactionCost,
             MinimumCost,
             FreeCost        : Integer;
            End;

Const
  MaxClients = 20;
  MaxCosts   = 200;

Var
  Clients : Array [1..MaxClients] of tClient;
  Costs   : Array [1..MaxCosts] of tCost;

implementation

uses quitdlg, uuser, ucost, upc, umbr, about, regist, upwd;

{$R *.DFM}

procedure SwapChar(Var St1, St2 : Char);
var ST : Char;
begin
   ST  := St1; St1 := St2; St2 := ST;
end;

function StringSwap(St : String) : String;
var XiS : Integer; StZ : String;
begin
  StZ := '';
  If Length(St) > 0 then For XiS := 1 to Length(St) do
    StZ := StZ + St[Length(St)-XiS+1];
  XiS := 1;
  repeat
      SwapChar(StZ[XiS],StZ[Length(StZ)-XiS+1]);
      Inc(XiS,4);
  until XiS > Length(StZ);
  StringSwap := StZ;
end;

function SimpleEncrypt(St : String) : String;
var XiS, CRC : Integer; St2 : String; StA, StB, StC, StD : Char;
begin
  // normal encrypt proc

  St := StringSwap(St);
  If Length(St)> 0 then For XiS := 1 to Length(St) do begin
      St[XiS] := Chr(Ord(St[XiS]) + 20);
  end;

  // add 4 char as CRC

  CRC := 0;
  For XiS := 1 to Length(St) do
    CRC := CRC+Ord(St[XiS]);

  StA := Chr((CRC MOD 15)+53);
  StB := Chr((CRC MOD 17)+53);
  StC := Chr((CRC MOD 21)+53);
  StD := Chr((CRC MOD 23)+53);
  St2 := StA+StB+StC+StD;

  SimpleEncrypt := St+St2;
end;

function SimpleDecrypt(St : String) : String;
var XiS, CRC : integer; St2 : String; StA, StB, StC, StD : Char;
begin
  // check and remove 4 CRC char

  St2 := Copy(St,Length(St)-3,4);
  St  := Copy(St,1,Length(St)-4);

  CRC := 0;
  For XiS := 1 to Length(St) do
    CRC := CRC+Ord(St[XiS]);

  StA := Chr((CRC MOD 15)+53);
  StB := Chr((CRC MOD 17)+53);
  StC := Chr((CRC MOD 21)+53);
  StD := Chr((CRC MOD 23)+53);

  If St2 <> StA+StB+StC+StD then
    wServerForm.Memo2.Lines.Add('SEVERE: Invalid Serial Number')
  else
    begin
      // go on with the show
      St := StringSwap(St);
      If Length(St)> 0 then For XiS := 1 to Length(St) do begin
        St[XiS] := Chr(Ord(St[XiS]) - 20);
      end;
      SimpleDecrypt := St;
    end;
end;

function Limit(XiS, Barrier : Integer) : Integer;
begin
   If XiS <= Barrier then
     Limit := XiS
   else
     Limit := Barrier;
end;

function Encrypt(St : String) : String;
var XiS : Integer;
begin
  If Length(St)> 0 then For XiS := 1 to Length(St) do begin
      St[XiS] := Chr((Ord(St[XiS]) - 17) XOR $25);
  end;
  Encrypt := St;
end;

function Decrypt(St : String) : String;
var XiS : Integer;
begin
  If Length(St)> 0 then For XiS := 1 to Length(St) do begin
    St[XiS] := Chr((Ord(St[XiS]) XOR $25) + 17);
  end;
  Decrypt := St;
end;

procedure TwServerForm.ClientRedraw(ClientNumber : Integer);
begin
  if ClientNumber = 1 then begin
      gbClient01.Caption  := Clients[1].Name+'/'+Clients[1].User;
      edtMulai01.Text     := Clients[1].MulaiStr;
      edtWaktu01.Text     := Clients[1].WaktuStr;
      edtBiaya01.Text     := Clients[1].BiayaStr;
      shpLine01.Brush.Color := Clients[1].Line;
      shpAcc01.Brush.Color  := Clients[1].Access;
      shpBill01.Brush.Color := Clients[1].Billing;
    end
  else if ClientNumber = 2 then begin
      gbClient02.Caption := Clients[2].Name+'/'+Clients[2].User;
      edMulai02.Text    := Clients[2].MulaiStr;
      edWaktu02.Text    := Clients[2].WaktuStr;
      edBiaya02.Text    := Clients[2].BiayaStr;
      shpLine02.Brush.Color := Clients[2].Line;
      shpAcc02.Brush.Color  := Clients[2].Access;
      shpBill02.Brush.Color := Clients[2].Billing;
    end
  else if ClientNumber = 3 then begin
      gbClient03.Caption := Clients[3].Name+'/'+Clients[3].User;
      edMulai03.Text    := Clients[3].MulaiStr;
      edWaktu03.Text    := Clients[3].WaktuStr;
      edBiaya03.Text    := Clients[3].BiayaStr;
      shpLine03.Brush.Color := Clients[3].Line;
      shpAcc03.Brush.Color  := Clients[3].Access;
      shpBill03.Brush.Color := Clients[3].Billing;
    end
  else if ClientNumber = 4 then begin
      gbClient04.Caption  := Clients[4].Name+'/'+Clients[4].User;
      edMulai04.Text    := Clients[4].MulaiStr;
      edWaktu04.Text    := Clients[4].WaktuStr;
      edBiaya04.Text    := Clients[4].BiayaStr;
      shpLine04.Brush.Color := Clients[4].Line;
      shpAcc04.Brush.Color  := Clients[4].Access;
      shpBill04.Brush.Color := Clients[4].Billing;
    end
  else if ClientNumber = 5 then begin
      gbClient05.Caption  := Clients[5].Name+'/'+Clients[5].User;
      edMulai05.Text    := Clients[5].MulaiStr;
      edWaktu05.Text    := Clients[5].WaktuStr;
      edBiaya05.Text    := Clients[5].BiayaStr;
      shpLine05.Brush.Color := Clients[5].Line;
      shpAcc05.Brush.Color  := Clients[5].Access;
      shpBill05.Brush.Color := Clients[5].Billing;
    end
  else if ClientNumber = 6 then begin
      gbClient06.Caption  := Clients[6].Name+'/'+Clients[6].User;
      edMulai06.Text    := Clients[6].MulaiStr;
      edWaktu06.Text    := Clients[6].WaktuStr;
      edBiaya06.Text    := Clients[6].BiayaStr;
      shpLine06.Brush.Color := Clients[6].Line;
      shpAcc06.Brush.Color  := Clients[6].Access;
      shpBill06.Brush.Color := Clients[6].Billing;
    end
  else if ClientNumber = 7 then begin
      gbClient07.Caption  := Clients[7].Name+'/'+Clients[7].User;
      edMulai07.Text    := Clients[7].MulaiStr;
      edWaktu07.Text    := Clients[7].WaktuStr;
      edBiaya07.Text    := Clients[7].BiayaStr;
      shpLine07.Brush.Color := Clients[7].Line;
      shpAcc07.Brush.Color  := Clients[7].Access;
      shpBill07.Brush.Color := Clients[7].Billing;
    end
  else if ClientNumber = 8 then begin
      gbClient08.Caption  := Clients[8].Name+'/'+Clients[8].User;
      edMulai08.Text    := Clients[8].MulaiStr;
      edWaktu08.Text    := Clients[8].WaktuStr;
      edBiaya08.Text    := Clients[8].BiayaStr;
      shpLine08.Brush.Color := Clients[8].Line;
      shpAcc08.Brush.Color  := Clients[8].Access;
      shpBill08.Brush.Color := Clients[8].Billing;
    end
  else if ClientNumber = 9 then begin
      gbClient09.Caption  := Clients[9].Name+'/'+Clients[9].User;
      edMulai09.Text    := Clients[9].MulaiStr;
      edWaktu09.Text    := Clients[9].WaktuStr;
      edBiaya09.Text    := Clients[9].BiayaStr;
      shpLine09.Brush.Color := Clients[9].Line;
      shpAcc09.Brush.Color  := Clients[9].Access;
      shpBill09.Brush.Color := Clients[9].Billing;
    end
  else if ClientNumber = 10 then begin
      gbClient10.Caption  := Clients[10].Name+'/'+Clients[10].User;
      edMulai10.Text    := Clients[10].MulaiStr;
      edWaktu10.Text    := Clients[10].WaktuStr;
      edBiaya10.Text    := Clients[10].BiayaStr;
      shpLine10.Brush.Color := Clients[10].Line;
      shpAcc10.Brush.Color  := Clients[10].Access;
      shpBill10.Brush.Color := Clients[10].Billing;
    end
  else if ClientNumber = 11 then begin
      gbClient11.Caption  := Clients[11].Name+'/'+Clients[11].User;
      edMulai11.Text    := Clients[11].MulaiStr;
      edWaktu11.Text    := Clients[11].WaktuStr;
      edBiaya11.Text    := Clients[11].BiayaStr;
      shpLine11.Brush.Color := Clients[11].Line;
      shpAcc11.Brush.Color  := Clients[11].Access;
      shpBill11.Brush.Color := Clients[11].Billing;
    end
  else if ClientNumber = 12 then begin
      gbClient12.Caption  := Clients[12].Name+'/'+Clients[12].User;
      edMulai12.Text    := Clients[12].MulaiStr;
      edWaktu12.Text    := Clients[12].WaktuStr;
      edBiaya12.Text    := Clients[12].BiayaStr;
      shpLine12.Brush.Color := Clients[12].Line;
      shpAcc12.Brush.Color  := Clients[12].Access;
      shpBill12.Brush.Color := Clients[12].Billing;
    end
  else if ClientNumber = 13 then begin
      gbClient13.Caption  := Clients[13].Name+'/'+Clients[13].User;
      edMulai13.Text    := Clients[13].MulaiStr;
      edWaktu13.Text    := Clients[13].WaktuStr;
      edBiaya13.Text    := Clients[13].BiayaStr;
      shpLine13.Brush.Color := Clients[13].Line;
      shpAcc13.Brush.Color  := Clients[13].Access;
      shpBill13.Brush.Color := Clients[13].Billing;
    end
  else if ClientNumber = 14 then begin
      gbClient14.Caption  := Clients[14].Name+'/'+Clients[14].User;
      edMulai14.Text    := Clients[14].MulaiStr;
      edWaktu14.Text    := Clients[14].WaktuStr;
      edBiaya14.Text    := Clients[14].BiayaStr;
      shpLine14.Brush.Color := Clients[14].Line;
      shpAcc14.Brush.Color  := Clients[14].Access;
      shpBill14.Brush.Color := Clients[14].Billing;
    end
  else if ClientNumber = 15 then begin
      gbClient15.Caption  := Clients[15].Name+'/'+Clients[15].User;
      edMulai15.Text    := Clients[15].MulaiStr;
      edWaktu15.Text    := Clients[15].WaktuStr;
      edBiaya15.Text    := Clients[15].BiayaStr;
      shpLine15.Brush.Color := Clients[15].Line;
      shpAcc15.Brush.Color  := Clients[15].Access;
      shpBill15.Brush.Color := Clients[15].Billing;
    end
  else if ClientNumber = 16 then begin
      gbClient16.Caption  := Clients[16].Name+'/'+Clients[16].User;
      edMulai16.Text    := Clients[16].MulaiStr;
      edWaktu16.Text    := Clients[16].WaktuStr;
      edBiaya16.Text    := Clients[16].BiayaStr;
      shpLine16.Brush.Color := Clients[16].Line;
      shpAcc16.Brush.Color  := Clients[16].Access;
      shpBill16.Brush.Color := Clients[16].Billing;
    end
  else if ClientNumber = 17 then begin
      gbClient17.Caption  := Clients[17].Name+'/'+Clients[17].User;
      edMulai17.Text    := Clients[17].MulaiStr;
      edWaktu17.Text    := Clients[17].WaktuStr;
      edBiaya17.Text    := Clients[17].BiayaStr;
      shpLine17.Brush.Color := Clients[17].Line;
      shpAcc17.Brush.Color  := Clients[17].Access;
      shpBill17.Brush.Color := Clients[17].Billing;
    end
  else if ClientNumber = 18 then begin
      gbClient18.Caption  := Clients[18].Name+'/'+Clients[18].User;
      edMulai18.Text    := Clients[18].MulaiStr;
      edWaktu18.Text    := Clients[18].WaktuStr;
      edBiaya18.Text    := Clients[18].BiayaStr;
      shpLine18.Brush.Color := Clients[18].Line;
      shpAcc18.Brush.Color  := Clients[18].Access;
      shpBill18.Brush.Color := Clients[18].Billing;
    end
  else if ClientNumber = 19 then begin
      gbClient19.Caption  := Clients[19].Name+'/'+Clients[19].User;
      edMulai19.Text    := Clients[19].MulaiStr;
      edWaktu19.Text    := Clients[19].WaktuStr;
      edBiaya19.Text    := Clients[19].BiayaStr;
      shpLine19.Brush.Color := Clients[19].Line;
      shpAcc19.Brush.Color  := Clients[19].Access;
      shpBill19.Brush.Color := Clients[19].Billing;
    end
  else if ClientNumber = 20 then begin
      gbClient20.Caption  := Clients[20].Name+'/'+Clients[20].User;
      edMulai20.Text    := Clients[20].MulaiStr;
      edWaktu20.Text    := Clients[20].WaktuStr;
      edBiaya20.Text    := Clients[20].BiayaStr;
      shpLine20.Brush.Color := Clients[20].Line;
      shpAcc20.Brush.Color  := Clients[20].Access;
      shpBill20.Brush.Color := Clients[20].Billing;
    end;
end;

procedure OpenAllClientsButtons;
begin
  wServerForm.btnTrans01.Enabled := True;
  wServerForm.btnTrans02.Enabled := True;
  wServerForm.btnTrans03.Enabled := True;
  wServerForm.btnTrans04.Enabled := True;
  wServerForm.btnTrans05.Enabled := True;
  wServerForm.btnTrans06.Enabled := True;
  wServerForm.btnTrans07.Enabled := True;
  wServerForm.btnTrans08.Enabled := True;
  wServerForm.btnTrans09.Enabled := True;
  wServerForm.btnTrans10.Enabled := True;
  wServerForm.btnTrans11.Enabled := True;
  wServerForm.btnTrans12.Enabled := True;
  wServerForm.btnTrans13.Enabled := True;
  wServerForm.btnTrans14.Enabled := True;
  wServerForm.btnTrans15.Enabled := True;
  wServerForm.btnTrans16.Enabled := True;
  wServerForm.btnTrans17.Enabled := True;
  wServerForm.btnTrans18.Enabled := True;
  wServerForm.btnTrans19.Enabled := True;
  wServerForm.btnTrans20.Enabled := True;
  wServerForm.btnMsg01.Enabled := True;
  wServerForm.btnMsg02.Enabled := True;
  wServerForm.btnMsg03.Enabled := True;
  wServerForm.btnMsg04.Enabled := True;
  wServerForm.btnMsg05.Enabled := True;
  wServerForm.btnMsg06.Enabled := True;
  wServerForm.btnMsg07.Enabled := True;
  wServerForm.btnMsg08.Enabled := True;
  wServerForm.btnMsg09.Enabled := True;
  wServerForm.btnMsg10.Enabled := True;
  wServerForm.btnMsg11.Enabled := True;
  wServerForm.btnMsg12.Enabled := True;
  wServerForm.btnMsg13.Enabled := True;
  wServerForm.btnMsg14.Enabled := True;
  wServerForm.btnMsg15.Enabled := True;
  wServerForm.btnMsg16.Enabled := True;
  wServerForm.btnMsg17.Enabled := True;
  wServerForm.btnMsg18.Enabled := True;
  wServerForm.btnMsg19.Enabled := True;
  wServerForm.btnMsg20.Enabled := True;
  wServerForm.btnReset01.Enabled := True;
  wServerForm.btnReset02.Enabled := True;
  wServerForm.btnReset03.Enabled := True;
  wServerForm.btnReset04.Enabled := True;
  wServerForm.btnReset05.Enabled := True;
  wServerForm.btnReset06.Enabled := True;
  wServerForm.btnReset07.Enabled := True;
  wServerForm.btnReset08.Enabled := True;
  wServerForm.btnReset09.Enabled := True;
  wServerForm.btnReset10.Enabled := True;
  wServerForm.btnReset11.Enabled := True;
  wServerForm.btnReset12.Enabled := True;
  wServerForm.btnReset13.Enabled := True;
  wServerForm.btnReset14.Enabled := True;
  wServerForm.btnReset15.Enabled := True;
  wServerForm.btnReset16.Enabled := True;
  wServerForm.btnReset17.Enabled := True;
  wServerForm.btnReset18.Enabled := True;
  wServerForm.btnReset19.Enabled := True;
  wServerForm.btnReset20.Enabled := True;
  wServerForm.btnDisabl01.Enabled := True;
  wServerForm.btnDisabl02.Enabled := True;
  wServerForm.btnDisabl03.Enabled := True;
  wServerForm.btnDisabl04.Enabled := True;
  wServerForm.btnDisabl05.Enabled := True;
  wServerForm.btnDisabl06.Enabled := True;
  wServerForm.btnDisabl07.Enabled := True;
  wServerForm.btnDisabl08.Enabled := True;
  wServerForm.btnDisabl09.Enabled := True;
  wServerForm.btnDisabl10.Enabled := True;
  wServerForm.btnDisabl11.Enabled := True;
  wServerForm.btnDisabl12.Enabled := True;
  wServerForm.btnDisabl13.Enabled := True;
  wServerForm.btnDisabl14.Enabled := True;
  wServerForm.btnDisabl15.Enabled := True;
  wServerForm.btnDisabl16.Enabled := True;
  wServerForm.btnDisabl17.Enabled := True;
  wServerForm.btnDisabl18.Enabled := True;
  wServerForm.btnDisabl19.Enabled := True;
  wServerForm.btnDisabl20.Enabled := True;
  wServerForm.btnKill01.Enabled := True;
  wServerForm.btnKill02.Enabled := True;
  wServerForm.btnKill03.Enabled := True;
  wServerForm.btnKill04.Enabled := True;
  wServerForm.btnKill05.Enabled := True;
  wServerForm.btnKill06.Enabled := True;
  wServerForm.btnKill07.Enabled := True;
  wServerForm.btnKill08.Enabled := True;
  wServerForm.btnKill09.Enabled := True;
  wServerForm.btnKill10.Enabled := True;
  wServerForm.btnKill11.Enabled := True;
  wServerForm.btnKill12.Enabled := True;
  wServerForm.btnKill13.Enabled := True;
  wServerForm.btnKill14.Enabled := True;
  wServerForm.btnKill15.Enabled := True;
  wServerForm.btnKill16.Enabled := True;
  wServerForm.btnKill17.Enabled := True;
  wServerForm.btnKill18.Enabled := True;
  wServerForm.btnKill19.Enabled := True;
  wServerForm.btnKill20.Enabled := True;
end;

procedure CloseAllClientsButtons;
begin
  wServerForm.btnTrans01.Enabled := False;
  wServerForm.btnTrans02.Enabled := False;
  wServerForm.btnTrans03.Enabled := False;
  wServerForm.btnTrans04.Enabled := False;
  wServerForm.btnTrans05.Enabled := False;
  wServerForm.btnTrans06.Enabled := False;
  wServerForm.btnTrans07.Enabled := False;
  wServerForm.btnTrans08.Enabled := False;
  wServerForm.btnTrans09.Enabled := False;
  wServerForm.btnTrans10.Enabled := False;
  wServerForm.btnTrans11.Enabled := False;
  wServerForm.btnTrans12.Enabled := False;
  wServerForm.btnTrans13.Enabled := False;
  wServerForm.btnTrans14.Enabled := False;
  wServerForm.btnTrans15.Enabled := False;
  wServerForm.btnTrans16.Enabled := False;
  wServerForm.btnTrans17.Enabled := False;
  wServerForm.btnTrans18.Enabled := False;
  wServerForm.btnTrans19.Enabled := False;
  wServerForm.btnTrans20.Enabled := False;
  wServerForm.btnMsg01.Enabled := False;
  wServerForm.btnMsg02.Enabled := False;
  wServerForm.btnMsg03.Enabled := False;
  wServerForm.btnMsg04.Enabled := False;
  wServerForm.btnMsg05.Enabled := False;
  wServerForm.btnMsg06.Enabled := False;
  wServerForm.btnMsg07.Enabled := False;
  wServerForm.btnMsg08.Enabled := False;
  wServerForm.btnMsg09.Enabled := False;
  wServerForm.btnMsg10.Enabled := False;
  wServerForm.btnMsg11.Enabled := False;
  wServerForm.btnMsg12.Enabled := False;
  wServerForm.btnMsg13.Enabled := False;
  wServerForm.btnMsg14.Enabled := False;
  wServerForm.btnMsg15.Enabled := False;
  wServerForm.btnMsg16.Enabled := False;
  wServerForm.btnMsg17.Enabled := False;
  wServerForm.btnMsg18.Enabled := False;
  wServerForm.btnMsg19.Enabled := False;
  wServerForm.btnMsg20.Enabled := False;
  wServerForm.btnReset01.Enabled := False;
  wServerForm.btnReset02.Enabled := False;
  wServerForm.btnReset03.Enabled := False;
  wServerForm.btnReset04.Enabled := False;
  wServerForm.btnReset05.Enabled := False;
  wServerForm.btnReset06.Enabled := False;
  wServerForm.btnReset07.Enabled := False;
  wServerForm.btnReset08.Enabled := False;
  wServerForm.btnReset09.Enabled := False;
  wServerForm.btnReset10.Enabled := False;
  wServerForm.btnReset11.Enabled := False;
  wServerForm.btnReset12.Enabled := False;
  wServerForm.btnReset13.Enabled := False;
  wServerForm.btnReset14.Enabled := False;
  wServerForm.btnReset15.Enabled := False;
  wServerForm.btnReset16.Enabled := False;
  wServerForm.btnReset17.Enabled := False;
  wServerForm.btnReset18.Enabled := False;
  wServerForm.btnReset19.Enabled := False;
  wServerForm.btnReset20.Enabled := False;
  wServerForm.btnDisabl01.Enabled := False;
  wServerForm.btnDisabl02.Enabled := False;
  wServerForm.btnDisabl03.Enabled := False;
  wServerForm.btnDisabl04.Enabled := False;
  wServerForm.btnDisabl05.Enabled := False;
  wServerForm.btnDisabl06.Enabled := False;
  wServerForm.btnDisabl07.Enabled := False;
  wServerForm.btnDisabl08.Enabled := False;
  wServerForm.btnDisabl09.Enabled := False;
  wServerForm.btnDisabl10.Enabled := False;
  wServerForm.btnDisabl11.Enabled := False;
  wServerForm.btnDisabl12.Enabled := False;
  wServerForm.btnDisabl13.Enabled := False;
  wServerForm.btnDisabl14.Enabled := False;
  wServerForm.btnDisabl15.Enabled := False;
  wServerForm.btnDisabl16.Enabled := False;
  wServerForm.btnDisabl17.Enabled := False;
  wServerForm.btnDisabl18.Enabled := False;
  wServerForm.btnDisabl19.Enabled := False;
  wServerForm.btnDisabl20.Enabled := False;
  wServerForm.btnKill01.Enabled := False;
  wServerForm.btnKill02.Enabled := False;
  wServerForm.btnKill03.Enabled := False;
  wServerForm.btnKill04.Enabled := False;
  wServerForm.btnKill05.Enabled := False;
  wServerForm.btnKill06.Enabled := False;
  wServerForm.btnKill07.Enabled := False;
  wServerForm.btnKill08.Enabled := False;
  wServerForm.btnKill09.Enabled := False;
  wServerForm.btnKill10.Enabled := False;
  wServerForm.btnKill11.Enabled := False;
  wServerForm.btnKill12.Enabled := False;
  wServerForm.btnKill13.Enabled := False;
  wServerForm.btnKill14.Enabled := False;
  wServerForm.btnKill15.Enabled := False;
  wServerForm.btnKill16.Enabled := False;
  wServerForm.btnKill17.Enabled := False;
  wServerForm.btnKill18.Enabled := False;
  wServerForm.btnKill19.Enabled := False;
  wServerForm.btnKill20.Enabled := False;
end;

procedure TwServerForm.ClientsRedraw;
Var XiS : Integer;
begin
  for XiS := 1 to MaxClients do ClientRedraw(XiS);
end;

function MakeItAString(I: Longint): string;
var
  S: string[11];
begin
  Str(I, S);
  MakeItAString:= S;
end;

function MakeItAInt(St : String): Longint;
var I : Longint; Code: Integer;
begin
  Val(St,I,Code);
  If Code <> 0 then
    MakeItAInt := 0
  else
    MakeItAInt := I;
end;

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

function CostOf(TrxType, MemberType : String) : String;
var XiS : Integer; GotIt : Boolean;
begin
  If NOT vExpired then begin
    XiS := 1;
    GotIt := False;
    Repeat
      GotIt := (MemberType = Costs[XiS].MemberType) AND (TrxType = Costs[XIS].TransactionType);
      If NOT GotIt then Inc(XiS);
    Until GotIt OR (XiS > CostsCtr);
    CostOf := IntToStr(Costs[XiS].TransactionCost);
  end
  else {License is expired... All transaction assumed to be Free ;-) hehehehe }
    CostOf := '7';
end;

function MinCostOf(TrxType, MemberType : String) : String;
var XiS : Integer; GotIt : Boolean;
begin
  If NOT vExpired then begin
    XiS := 1;
    GotIt := False;
    Repeat
      GotIt := (MemberType = Costs[XiS].MemberType) AND (TrxType = Costs[XIS].TransactionType);
      If NOT GotIt then Inc(XiS);
    Until GotIt OR (XiS > CostsCtr);
    MinCostOf := IntToStr(Costs[XiS].MinimumCost);
  end
  else {License is expired... All transaction assumed to be Free ;-) hehehehe }
    MinCostOf := '8';
end;

function FreeCostOf(TrxType, MemberType : String) : String;
var XiS : Integer; GotIt : Boolean;
begin
  If NOT vExpired then begin
    XiS := 1;
    GotIt := False;
    Repeat
      GotIt := (MemberType = Costs[XiS].MemberType) AND (TrxType = Costs[XIS].TransactionType);
      If NOT GotIt then Inc(XiS);
    Until GotIt OR (XiS > CostsCtr);
    FreeCostOf := IntToStr(Costs[XiS].FreeCost);
  end
  else {License is expired... All transaction assumed to be Free ;-) hehehehe }
    FreeCostOf := '9';
end;

function IPLookup(IPAddress : String) : Integer;
var XiS : Integer; GotIt : Boolean;
begin
  XiS := 1;
  GotIt := False;
  Repeat
     GotIt := IPAddress = Clients[XiS].IP;
     If NOT GotIt then Inc(XiS);
  Until GotIt OR (XiS > MaxClients);
  IPLookup := XiS;
end;

procedure WriteRegistryInteger(Sectionz, Keyz : String; Valuez : Integer);
var
  Reg: TRegistry;
begin
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

function InsertComma(St : String) : String;
begin
  If Length(St) > 3 then Insert('.',St,Length(St)-2);
  If Length(St) > 7 then Insert('.',St,Length(St)-6);
  If Length(St) > 11 then Insert('.',St,Length(St)-10);
  If Length(St) > 15 then Insert('.',St,Length(St)-14);
  If Length(St) > 19 then Insert('.',St,Length(St)-18);
  InsertComma := St;
end;

function SerialCheck(vSN, vCN, vHDD, vDate : String) : Boolean;
var SZ1, SZ2 : String;
begin
  vSN := SimpleDecrypt(vSN);
  SZ1 := Copy(vSN,Length(vSN)-5,6); {Date}

  vTglExpire := SZ1;

  SZ2 := Copy(vSN,1,Length(vSN)-6);      {vCN+vHDD}

  // check CRC-sort-of please

  SerialCheck := (vDate <= SZ1) AND (SZ2 = vCN+vHDD);
end;

procedure TwServerForm.CheckSerials;
// cek serial apakah valid u/ hari ini
var
  a, b : dword;
  Buffer  : array [0..255] of char;
  W : Dword;
  vRunStr : String;
  RunLimit : Integer;
  StartShowNag : Integer;
begin
  if vExperimental then RunLimit := 1 else RunLimit := 49;
  if vExperimental then StartShowNag := 1 else StartShowNag := 7;

  try
    if GetVolumeInformation('c:\', Buffer, SizeOf(Buffer), @Tag , a, b, nil, 0) then
      begin
         W := Tag;
         vHDDSerial := IntToStr(W);
      end
  except
    on E: Exception do Memo2.Lines.Add('CHECKSERIAL_ERROR:'+E.Message);
  end;

//  MessageDlg('HDD : '+vHDDSerial+#13#10+'CPN : '+vCompanyName+#13#10+
//             'SN# : '+vSerialNumber+#13#10+'RT# : '+vRunningTimes+#13#10,
//             mtInformation,[mbOk],0);

  // compare serial with with today's date and app load times
  If (NOT SerialCheck(vSerialNumber, vCompanyName, vHDDSerial, FormatDateTime('yyyymmdd',Date))) then begin
    // if serial number do not match, let the user use this apps 49 times
    // after that.. vExpired will be True... and all of each transaction item will cost Rp. 7,-
     vRunStr := Trim(ReadRegistryString('Internet Settings','InquiryLevel'));
     if Length(vRunStr) = 0 then vRunStr := '0';
     vRunStr := MakeItAString(MakeItAInt(vRunStr)+1);
     WriteRegistryString('Internet Settings','InquiryLevel',vRunStr);

     If MakeItAInt(vRunStr) > RunLimit then vExpired := True;

     // unauthorize use beyond 7 times will show a nag window
     If MakeItAInt(vRunStr) > StartShowNag then begin
        MessageDlg('Your serial number is no longer valid. Please visit'+#13#10+
                   'http://dekatmu.tripod.com/ to acquire a new serial number.'+#13#10#13#10+
                   'Please use '''+vCompanyName+'/'+vHDDSerial+''' as your Customer Code.', mtWarning,[mbOk],0);
        mnuHomepageClick(Self);
        end;
  end
  else WriteRegistryString('Internet Settings','InquiryLevel','0');

end;

procedure TwServerForm.LoadTXs;
// look ke database... ambil Revenue hari ini
begin
   Query1.Close;
   Query1.SQL.Clear;
   Query1.SQL.Add('SELECT SUM(AMOUNT) AS SUMAMOUNT FROM TX_INTERNET WHERE TXDATE = #'+DateToStr(Date)+'#');

// to do : buat entry antara jam 00:00 dg 06:00 dimasukkan ke 'kemarin'

   Query1.Prepare;
   Query1.Open;
   vRevenue := Query1.FieldByName('SUMAMOUNT').AsInteger;
   lblRevenue.Caption := InsertComma(MakeItAString(vRevenue))+',00';
end;

procedure TwServerForm.LoadSettings;
var XiS : Integer;
begin

// look ke database .. load isi tabel MS_COMPUTER

   Query1.Close;
   Query1.SQL.Clear;
   Query1.SQL.Add('SELECT * FROM MS_COMPUTER ORDER BY COMPUTERNUMBER');
//   Query1.SQL.Add('SELECT * FROM MS_COMPUTER WHERE STATUS =''E'' ORDER BY COMPUTERNUMBER');
   Query1.Prepare;
   Query1.Open;

   if Query1.RecordCount > 0 then begin

     repeat

      XiS := Query1.FieldByName('COMPUTERNUMBER').AsInteger;

      If Trim(UpperCase(Query1.FieldByName('STATUS').AsString)) = 'D' then
        Clients[XiS].Name      := Trim(UpperCase(Query1.FieldByName('COMPUTERNAME').AsString))+'[*]'
      else
        Clients[XiS].Name      := Trim(UpperCase(Query1.FieldByName('COMPUTERNAME').AsString));

      Clients[XiS].IP        := Trim(Query1.FieldByName('IPADDRESS').AsString);

      Clients[XiS].MulaiStr  := '00:00';
      Clients[XiS].WaktuStr  := '0';
      Clients[XiS].BiayaStr  := '0';
      Clients[XiS].MulaiTime := 0;
      Clients[XiS].Biaya     := 0;
      Clients[XiS].Line      := clNavy;
      Clients[XiS].Access    := clNavy;
      Clients[XiS].Billing   := clNavy;

      try
        Query1.Next;
      except
        ;
      end;

     until Query1.Eof;

   end
     else MessageDlg('COMPUTER table is still empty or all disabled.'#13#10+
     'Please recheck by accessing Settings|Computer menu',mtWarning,[mbOk],1);

   if vExperimental then Clients[1].IP        := '127.0.0.1';

   ClientsRedraw;

   // look ke database .. load isi tabel MS_COST

   Query1.Close;
   Query1.SQL.Clear;
   Query1.SQL.Add('SELECT * FROM MS_COST');
   Query1.Prepare;
   Query1.Open;

   XiS := 0;
   repeat
      Inc(XiS);
      Costs[XiS].MemberType :=  Trim(UpperCase(Query1.FieldByName('MBRTYPE').AsString));
      Costs[XiS].TransactionType :=  Trim(UpperCase(Query1.FieldByName('TRXTYPE').AsString));
      Costs[XiS].TransactionCost := Query1.FieldByName('TRXCOST').AsInteger;
      Costs[XiS].MinimumCost     := Query1.FieldByName('TRXMINCOST').AsInteger;
      Costs[XiS].FreeCost        := Query1.FieldByName('TRXFREECOST').AsInteger;
      try
        Query1.Next;
      except
        ;
      end;
   until Query1.Eof;
   CostsCtr := XiS;

   // look ke database .. load isi tabel MS_SETUP

   Query1.Close;
   Query1.SQL.Clear;
   Query1.SQL.Add('SELECT * FROM MS_SETUP');
   Query1.Prepare;
   Query1.Open;

   vFlagFall     := Query1.FieldByName('FLAGFALL').AsInteger;
   vStrFlagFall  := IntToStr(vFlagFall);
   vGracePeriod  := Query1.FieldByName('GRACEPERIOD').AsInteger;
   vStrGracePeriod  := IntToStr(vGracePeriod);

   vCompanyName  := Trim(Query1.FieldByName('LICENSEDTOCOMP').AsString);
   vSerialNumber := Trim(Query1.FieldByName('SERIALNUMBER').AsString);

   Query1.Close;

   vRunningTimes := Trim(ReadRegistryString('Internet Settings','ProxyPortNumber'));
   if Length(vRunningTimes) = 0 then vRunningTimes := '0';
   vRunningTimes := MakeItAString(MakeItAInt(vRunningTimes)+1);
   WriteRegistryString('Internet Settings','ProxyPortNumber',vRunningTimes);

//   MessageDlg(vStrGracePeriod,mtInformation,[mbOk],0);

end;

procedure TwServerForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (OkRightDlg.ShowModal = mrOk);
end;

procedure TwServerForm.FileListenItemClick(Sender: TObject);
begin
//  FileListenItem.Checked := not FileListenItem.Checked;
//  if FileListenItem.Checked then
//  begin
    try
      ServerSocket.Active := True;
    except
      MessageDlg('Unable to open TCP/IP socket. Please open Control Panel and check Network settings',mtError,[mbOk],0);
    end;
//    Statusbar1.Panels[0].Text := 'Listening...';
//  end
//  else
//  begin
//    if ServerSocket.Active then
//      try
//        ServerSocket.Active := False;
//      except
//        ;
//      end;
//    Statusbar1.Panels[0].Text := '';
//  end;
end;

procedure TwServerForm.SafeSend(ClientConnNumber : Integer; St : String);
var XiS : Integer; SendOk : Boolean; St2 : String;
begin
   XiS := 0;
   St2 := Encrypt(St);
   Repeat
     SendOk := True;
     try
       ServerSocket.Socket.Connections[ClientConnNumber].SendText(St2);
     except
       SendOk := False;
       Inc(Xis);
     end;
   Until (SendOk) OR (XiS > 20);
   If NOT SendOk then begin
        Memo2.Lines.Add('SAFESEND_ERROR:'+ServerSocket.Socket.Connections[XiS].RemoteAddress+'/'+St);
  //      ShowLamps(ServerSocket.Socket.RemoteAddress,'L','F');
     end;
end;

procedure TwServerForm.Exit1Click(Sender: TObject);
begin
//  Memo2.Lines.Add('Log session ended at '+DateTimeToStr(Now));
//  tmrMemo2Timer(Self);
  Close;
end;

procedure TwServerForm.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var S : String; XiS : Integer;
begin
  if Key = VK_Return then
    if IsServer then
      begin
        Str(ServerSocket.Socket.ActiveConnections,S);
        Memo2.Lines.Add(S);
        for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
          SafeSend(XiS,Memo1.Lines[Memo1.Lines.Count - 1]);
      end;
end;

procedure TwServerForm.FormCreate(Sender: TObject);
var ScreenHeight : Integer; var DBExist : boolean;
begin

  vExpired := False;
  vExperimental := False;
  DBExist := True;

    try
      Database1.open;
      Database1.close;
    except
      on EDBEngineError do DBExist := False;
    end;

  If NOT DBExist then begin
       MessageDlg('ODBC-System DSN entry ''wServer'' can not be found or has been misconfigured.'#13' Please go to Control Panel, and continue with database setup first.', mtError,[mbOk], 0);
       Application.Terminate;
    end;

  DbX.Connected := True;
  TblX.Active := True;

  FileListenItemClick(nil);
  bwBroadCast := True;

  // Set MainWindow position on Screen
  wServerForm.Left := (Screen.Width - wServerForm.Width) DIV 2;
  ScreenHeight := ((Screen.Height - wServerForm.Height) DIV 2) - 20;
  If ScreenHeight > 0 then
    wServerForm.Top  := ScreenHeight
  else
    wServerForm.Top  := ScreenHeight + 20;

  wServerForm.Caption := constStFormCaption;

  vRevenue := 0;
  LoadTXs;
  LoadSettings;
  CheckSerials;

//  FileBroadCastItem.Checked := bwBroadCast;
  if vExpired then begin
    Caption := 'THIS COPY OF SOFTWARE HAS BEEN EXPIRED';
    Memo2.Lines.Add(Caption);
  end;

  Memo2.Lines.Add('Log session started at '+DateTimeToStr(Now));

  mnuLogin.Enabled := True;
  mnuLogout.Enabled := False;
  mniMaintenance.Enabled := False;
  mniReport.Enabled := False;
  mniSetting.Enabled := False;
  mniControl.Enabled := False;

  btnShutdown.Enabled := False;
  btnReboot.Enabled := False;
  btnBilling.Enabled := False;
  btnBroadcast.Enabled := False;

  CloseAllClientsButtons;

end;

procedure TwServerForm.ServerSocketError(Sender: TObject; Number: Smallint;
  var Description: string; Scode: Integer; const Source, HelpFile: string;
  HelpContext: Integer; var CancelDisplay: Wordbool);
begin
  CancelDisplay := True;
  ShowMessage(Description);
end;

procedure TwServerForm.Disconnect1Click(Sender: TObject);
begin
//  ServerSocket.Active := True;
//  Statusbar1.Panels[0].Text := 'Ready...';
end;

procedure TwServerForm.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
//  Statusbar1.Panels[0].Text := 'Connected to: ' + Socket.RemoteHost;
end;

procedure TwServerForm.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  try
    Memo2.Lines.Add('INPUT:'+Socket.ReceiveText);
  except
    ;
  end;
end;

procedure TwServerForm.Process_SYNCACK(CStr : String);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
    SafeSend(XiS,'REC[DEL]'+CStr);
end;

procedure TwServerForm.Process_ACK(CStr : String);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'-END-');
end;

procedure TwServerForm.Process_STATION(CStr, StaStr : String);
var XiS, P1, P2, P3 : Integer; vqUserName, vqPassword : String;
begin
  P1 := Pos('[1]',StaStr);
  P2 := Pos('[2]',StaStr);
  P3 := Pos('[3]',StaStr);

  vSTATION  := Copy(StaStr,1,P1-1);
  vUSERNAME := Trim(Copy(StaStr,P1+3,P2-(P1+3)));
  vPASSWORD := Trim(Copy(StaStr,P2+3,P3-(P2+3)));

  If vUserName = '' then vUserName := 'GUEST';
  If vPassword = '' then vPassword := 'GUEST';

  Memo2.Lines.Add(MakeItAString(P1)+' '+MakeItAString(P2)+' '+MakeItAString(P3));
  Memo2.Lines.Add('>PARSE:'+vSTATION+'/'+vUserName+'/***passwd**');

  // query Membership

  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT * FROM MS_MEMBER WHERE USERNAME = '''+vUserName+''' AND PASSWORD = '''+vPassword+'''');
//  Query1.SQL.Add('SELECT * FROM MS_MEMBER WHERE USERNAME = '''+vUserName+'''');
  Query1.Prepare;
  Query1.Open;

  if Query1.RecordCount > 0 then begin
     vqUserName   := Trim(UpperCase(Query1.FieldByName('USERNAME').AsString));
     vqPassword   := Trim(UpperCase(Query1.FieldByName('PASSWORD').AsString));
     vMemberType  := Trim(UpperCase(Query1.FieldByName('MEMBERTYPE').AsString));
  end;

  {jika username dan password kosong maka GUEST login}
  If (vUserName = 'GUEST') and (vPassword = 'GUEST') then
    begin

       for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
         SafeSend(XiS,'AUTHGST[DEL]'+CStr+'[1]'+CostOf('NET','G')+'[2]'+MinCostOf('NET','G')+'[3]-'+FreeCostOf('NET','G')+'[4]-');

       Clients[IPLookup(vSTATION)].User := vUserName;
       Clients[IPLookup(vSTATION)].Line := clLime;
       Clients[IPLookup(vSTATION)].Access := clLime;
       Clients[IPLookup(vSTATION)].Billing := clLime;
       Clients[IPLookup(vSTATION)].MulaiStr := TimeToStr(Time);

    end
  {jika username dan password ada maka MEMBER atau ADMIN login}
  else If (vUserName = vqUserName) and (vPassword = vqPassword) then
    begin

       If vMemberType = 'A' then
         for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
           SafeSend(XiS,'AUTHADM[DEL]'+CStr+'[1]'+CostOf('NET','A')+'[2]'+MinCostOf('NET','A')+'[3]-'+FreeCostOf('NET','A')+'[4]-')
       else If vMemberType = 'V' then
         for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
           SafeSend(XiS,'AUTHMBR[DEL]'+CStr+'[1]'+CostOf('NET','V')+'[2]'+MinCostOf('NET','V')+'[3]-'+FreeCostOf('NET','V')+'[4]-')
       else If vMemberType = 'M' then
         for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
           SafeSend(XiS,'AUTHMBR[DEL]'+CStr+'[1]'+CostOf('NET','M')+'[2]'+MinCostOf('NET','M')+'[3]-'+FreeCostOf('NET','M')+'[4]-')
       else If vMemberType = 'G' then
         for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
           SafeSend(XiS,'AUTHGST[DEL]'+CStr+'[1]'+CostOf('NET','G')+'[2]'+MinCostOf('NET','G')+'[3]-'+FreeCostOf('NET','G')+'[4]-');

       Clients[IPLookup(vSTATION)].User := vUserName;
       Clients[IPLookup(vSTATION)].Line := clLime;
       Clients[IPLookup(vSTATION)].Access := clLime;
       Clients[IPLookup(vSTATION)].Billing := clLime;
       Clients[IPLookup(vSTATION)].MulaiStr := TimeToStr(Time);

     end {begin}
  {jika salah password atau tidak ditemukan maka tolak}
  else If ((vUserName = vqUserName) and (vPassword <> vqPassword)) OR (Query1.RecordCount = 0) then
     begin

       for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
           SafeSend(XiS,'AUTHNON[DEL]'+CStr+'[1]'+CostOf('NET','G')+'[2]'+vStrFlagFall+'[3]-');

       Clients[IPLookup(vSTATION)].User := vUserName+'[*]';
       Clients[IPLookup(vSTATION)].Line := clLime;
       Clients[IPLookup(vSTATION)].Access := clRed;
       Clients[IPLookup(vSTATION)].Billing := clRed;

     end;

  Memo2.Lines.Add('LOGIN == vSTA -> '+vSTATION+', '+'IPL -> '+MakeItAString(IPLookUp(vSTATION))+', '+'vIPN -> '+Clients[IPLookup(vSTATION)].Name);

  ClientRedraw(IPLookup(vSTATION));

  // Lookup and Update Display Online Status

  Memo2.Lines.Add('>AUTH SENT');

end;

procedure TwServerForm.Process_COST(CStr, CostStr : String);
var P1, P2 : Integer;
  vOnlineTime, vOnlineCost : String;
begin
  P1 := Pos('[1]',CostStr);
  P2 := Pos('[2]',CostStr);

  vOnlineTime := Copy(CostStr,1,P1-1);
  vOnlineCost := Copy(CostStr,P1+3,P2-(P1+3));

  Memo2.Lines.Add(CStr+'... >PARSE:'+vOnlineTime+'/'+vOnlineCost);

  // Lookup and Update Display Cost

  If MakeItAInt(vOnlineCost) < Clients[IPLookup(CStr)].Biaya then begin
       Memo2.Lines.Add('Bill counter may be stopped on Client '+CStr);
    end;

  Clients[IPLookup(CStr)].BiayaStr := vOnlineCost;
  Clients[IPLookup(CStr)].Biaya    := MakeItAInt(vOnlineCost);
  Clients[IPLookup(CStr)].WaktuStr := vOnlineTime;
  ClientRedraw(IPLookup(CStr));

end;

procedure TwServerForm.Process_LOGIN(CStr, LogStr : String);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'WHO[DEL]'+CStr);
end;

procedure TwServerForm.Process_BILL(CStr, BillStr : String);
begin
  // MessageDlg(CStr+' - '+BillStr, mtInformation,[mbOk], 0);
  If BillStr = 'START' then
     Clients[IPLookup(cStr)].Billing   := clLime
  else If BillStr = 'STOP' then
     Clients[IPLookup(cStr)].Billing   := clRed
  else Clients[IPLookup(cStr)].Billing  := clNavy;
  ClientRedraw(IPLookup(cStr));
end;

procedure TwServerForm.Process_LOGOUT(CStr, LogStr : String);
var XiS, P1, P2 : Integer;
    vOnlineTime, vOnlineCost, vSQLStatement, vNow : String;
begin
  P1 := Pos('[1]',LogStr);
  P2 := Pos('[2]',LogStr);

  vOnlineCost := Copy(LogStr,1,P1-1);
  vOnlineTime := Copy(LogStr,P1+3,P2-(P1+3));

  // Lookup IP to Name

  vNow := TimeToStr(Time);

  // MsAccess workaround... Username NOT NULL .. 12/25/00 10.17am
  If Trim(Clients[IPLookup(CStr)].User) = '' then
     Clients[IPLookup(CStr)].User := 'PQRS';

  memoBilling.Lines.Add(Clients[IPLookup(CStr)].Name+', '+
      Clients[IPLookup(CStr)].User+', '+
      vNow+', '{+Clients[IPLookup(CStr)].MulaiStr+', '}+
         vOnlineTime+' menit, Rp. '+vOnlineCost);

  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'LOGOUTOK[DEL]'+CStr);

  // store into TRANSACTION table
  // here

  Query1.Close;
  Query1.SQL.Clear;

  // Next: update TXNO with Invoice number counter from MS_COUNTER

  vSQLStatement := 'INSERT INTO TX_INTERNET (TXNO, TXDATE, TXTIME, TXSTART, TXEND, '+
    'DURATION, USERNAME, COMPUTERNO, AMOUNT ) VALUES (1, #'+DateToStr(Date)+'#,#'+
    vNow+'#, #'+Clients[IPLookup(CStr)].MulaiStr+'#, #'+vNow+'#, '+
    vOnlineTime+', '''+Clients[IPLookup(CStr)].User+''', '+MakeItAString(IPLookup(CStr))+', '+
    vOnlineCost+')';

//  MessageDlg('geDEBUG! -> '+vSQLStatement,mtInformation,[mbOk],0);

  Query1.SQL.Add(vSQLStatement);
  Query1.Prepare;
  Query1.ExecSQL;

  vRevenue := vRevenue + MakeItAInt(vOnlineCost);
  lblRevenue.Caption := InsertComma(MakeItAString(vRevenue))+',00';

  Clients[IPLookup(CStr)].Biaya    := 0;
  Clients[IPLookup(CStr)].BiayaStr := '0';
  Clients[IPLookup(CStr)].WaktuStr := '0';
  Clients[IPLookup(CStr)].User     := '';
  Clients[IPLookup(cStr)].MulaiStr := '00:00';
  Clients[IPLookup(cStr)].Access    := clRed;
  Clients[IPLookup(cStr)].Billing   := clRed;
  ClientsRedraw;

end;

procedure TwServerForm.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
  var S : String;
  var SS, S1, S2 : String;
  var ClientID : String;
begin
  S  := '/S->NULL/';
  SS := '/SS->NULL/';
  S1 := '/S1->NULL/';
  S2 := '/S2->NULL/';
  ClientID := 'ClientID->NULL';

  try
    SS := Decrypt(Socket.ReceiveText);
    ClientID := Socket.RemoteAddress;
  except
    S2 := '/SocketTextReceiveError/';
  end;

  If (Pos('[DEL]',SS) > 1) then begin
    S1 := Copy(SS,1,Pos('[DEL]',SS)-1);
    S2 := Copy(SS,Pos('[DEL]',SS)+5,Length(SS));
    End
  Else
    S1 := SS;

  If (S1 = 'LOGIN') then
     Memo2.Lines.Add(TimeToStr(Time)+':'+Socket.RemoteAddress+' LOGIN ***')
  else
     Memo2.Lines.Add(TimeToStr(Time)+':'+Socket.RemoteAddress+'-SS:'+SS+'-S1:'+S1+'-S2:'+S2);

  Clients[IPLookup(Socket.RemoteAddress)].Line := clLime;

  If (S1 = 'SYNCACK') then Process_SYNCACK(ClientID);
  If (S1 = 'ACK') then Process_ACK(ClientID);
  If (S1 = 'STATION') then Process_STATION(ClientID,S2);
  If (S1 = 'LOGIN') then Process_LOGIN(ClientID,S2);
  If (S1 = 'LOGOUT') then Process_LOGOUT(ClientID,S2);
  If (S1 = 'COST') then Process_COST(ClientID,S2);
  If (S1 = 'BILL') then Process_BILL(ClientID,S2);

end;

procedure TwServerForm.ServerSocketAccept(Sender: TObject;
  Socket: TCustomWinSocket);
var XiS : Integer;
begin
  IsServer := True;
//  Statusbar1.Panels[0].Text := 'Connected to: ' + Socket.RemoteAddress;
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'CONNECT[DEL]'+Socket.RemoteAddress);
  Memo2.Lines.Add('Accepting '+Socket.RemoteAddress);
  Clients[IPLookup(Socket.RemoteAddress)].Line := clLime;
end;

procedure TwServerForm.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
  var S : String;
  XiS : Integer;
begin
  Memo2.Lines.Add('Connected '+Socket.RemoteAddress);
  Clients[IPLookup(Socket.RemoteAddress)].Line := clLime;
  Str(ServerSocket.Socket.ActiveConnections,S);
  Memo2.Lines.Add('Active Connections : '+S);
  Memo2.Lines.Add('/Syncronizing Client''s Time/');
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'TIME[DEL]'+DateTimeToStr(Now));
end;

procedure TwServerForm.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
  var S : String;
begin
  Memo2.Lines.Add('Disconnected '+Socket.RemoteAddress);
  Clients[IPLookup(Socket.RemoteAddress)].Line := clRed;
  Str(ServerSocket.Socket.ActiveConnections-1,S);
  Memo2.Lines.Add('Active Connections : '+S);
//  Statusbar1.Panels[0].Text := 'Ready...';
end;

procedure TwServerForm.FileBroadcastItemClick(Sender: TObject);
begin
//  FileBroadcastItem.Checked := not FileBroadCastItem.Checked;
  bwBroadCast := not bwBroadCast;
end;

procedure TwServerForm.Timer1Timer(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'SYNC[DEL]--');
  ClientsRedraw;   
end;

procedure TwServerForm.Timer2Timer(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'RATES[DEL]--');
  ClientsRedraw;
end;

procedure TwServerForm.btnBroadcastClick(Sender: TObject);
  var XiS : Integer; BroadcastMessage : String;
begin
  InputQuery('Message Broadcast (empty = cancel)', 'Message :', BroadcastMessage);
  if Length(BroadcastMessage) > 0 then begin
     for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'BROADCAST[DEL]'+BroadcastMessage);
     Memo2.Lines.Add(TimeToStr(Time)+': Broadcast Message: '+BroadcastMessage);
     end
  else ShowMessage('Message Broadcast cancelled');
end;

procedure TwServerForm.btnShutdownClick(Sender: TObject);
var XiS : Integer;
begin
  if MessageDlg('Do you really wish to SHUTDOWN all clients?',
    mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
     for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'SHUTDOWN[DEL]'+ServerSocket.Socket.Connections[XiS].RemoteAddress);
     Memo2.Lines.Add(TimeToStr(Time)+': Shutting Down All Clients');
    end;
end;

procedure TwServerForm.btnBillingClick(Sender: TObject);
var XiS, XiS2 : Integer;
begin
  If btnBilling.Caption = 'DISABLE BILL' then
    begin
      for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1) do
        SafeSend(XiS,'DISCOUNT');
      btnBilling.Caption := 'ENABLE BILL';
      btnBilling.Font.Color := clMaroon;
      for XiS2 := 1 to MaxClients do
        if Clients[XiS2].Access <> clNavy then
          Clients[XiS2].Billing := clRed;
      Memo2.Lines.Add(TimeToStr(Time)+': DISABLE BILL command sent');
    end
  else If btnBilling.Caption = 'ENABLE BILL' then
    begin
       for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1) do
         SafeSend(XiS,'COUNT');
       btnBilling.Caption := 'DISABLE BILL';
       btnBilling.Font.Color := clWindowText;
       for XiS2 := 1 to MaxClients do
         if Clients[XiS2].Access <> clNavy then
           Clients[XiS2].Billing := clLime;
      Memo2.Lines.Add(TimeToStr(Time)+': ENABLE BILL command sent');
     end;
end;

procedure TwServerForm.btnKill01Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[1].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[1].Name);
end;

procedure TwServerForm.btnKill02Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[2].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[2].Name);
end;

procedure TwServerForm.btnKill03Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[3].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[3].Name);
end;

procedure TwServerForm.btnKill04Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[4].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[4].Name);
end;

procedure TwServerForm.btnKill05Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[5].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[5].Name);
end;

procedure TwServerForm.btnKill06Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[6].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[6].Name);
end;

procedure TwServerForm.btnKill07Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[7].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[7].Name);
end;

procedure TwServerForm.btnKill08Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[8].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[8].Name);
end;

procedure TwServerForm.btnKill09Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[9].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[9].Name);
end;

procedure TwServerForm.btnKill10Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[10].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[10].Name);
end;

procedure TwServerForm.btnKill11Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[11].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[11].Name);
end;

procedure TwServerForm.btnKill12Click(Sender: TObject);
var XiS : Integer;
begin
  for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
     SafeSend(XiS,'KILL[DEL]'+Clients[12].IP);
  Memo2.Lines.Add(TimeToStr(Time)+': KILL command sent to '+Clients[12].Name);
end;

procedure TwServerForm.btnDisabl01Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl01.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[1].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[1].Name);
    btnDisabl01.Caption := 'UNL';
  end else if btnDisabl01.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[1].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[1].Name);
    btnDisabl01.Caption := 'LCK';
  end;
end;

procedure TwServerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Memo2.Lines.Add('Log session ended at '+DateTimeToStr(Now));
  tmrMemo2Timer(Self);
  try
    ServerSocket.Close;
  except
    ;
  end;
end;

procedure TwServerForm.btnDisabl02Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl02.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[2].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[2].Name);
    btnDisabl02.Caption := 'UNL';
  end else if btnDisabl02.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[2].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[2].Name);
    btnDisabl02.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl03Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl03.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[3].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[3].Name);
    btnDisabl03.Caption := 'UNL';
  end else if btnDisabl03.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[3].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[3].Name);
    btnDisabl03.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl04Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl04.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[4].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[4].Name);
    btnDisabl04.Caption := 'UNL';
  end else if btnDisabl04.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[4].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[4].Name);
    btnDisabl04.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl05Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl05.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[5].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[5].Name);
    btnDisabl05.Caption := 'UNL';
  end else if btnDisabl05.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[5].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[5].Name);
    btnDisabl05.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl06Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl06.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[6].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[6].Name);
    btnDisabl06.Caption := 'UNL';
  end else if btnDisabl06.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[6].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[6].Name);
    btnDisabl06.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl07Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl07.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[7].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[7].Name);
    btnDisabl07.Caption := 'UNL';
  end else if btnDisabl07.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[7].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[7].Name);
    btnDisabl07.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl08Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl08.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[8].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[8].Name);
    btnDisabl08.Caption := 'UNL';
  end else if btnDisabl08.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[8].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[8].Name);
    btnDisabl08.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl09Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl09.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[9].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[9].Name);
    btnDisabl09.Caption := 'UNL';
  end else if btnDisabl09.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[9].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[9].Name);
    btnDisabl09.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl10Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl10.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[10].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[10].Name);
    btnDisabl10.Caption := 'UNL';
  end else if btnDisabl10.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[10].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[10].Name);
    btnDisabl10.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl11Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl11.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[11].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[11].Name);
    btnDisabl11.Caption := 'UNL';
  end else if btnDisabl11.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[11].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[11].Name);
    btnDisabl11.Caption := 'LCK';
  end;
end;

procedure TwServerForm.btnDisabl12Click(Sender: TObject);
var XiS : Integer;
begin
  if btnDisabl12.Caption = 'LCK' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'LOCK[DEL]'+Clients[12].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': LOCK command sent to '+Clients[12].Name);
    btnDisabl12.Caption := 'UNL';
  end else if btnDisabl12.Caption = 'UNL' then begin
    for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'UNLOCK[DEL]'+Clients[12].IP);
    Memo2.Lines.Add(TimeToStr(Time)+': UNLOCK command sent to '+Clients[12].Name);
    btnDisabl12.Caption := 'LCK';
  end;
end;

procedure ShowSetup(ComputerIndex : Integer);
begin
  MessageDlg(
   'IP Addr:'+Clients[ComputerIndex].IP+#13#10+
   'PC Name:'+Clients[ComputerIndex].Name+#13#10+
   'User   :'+Clients[ComputerIndex].User+#13#10+
   'Elapsed:'+Clients[ComputerIndex].WaktuStr+#13#10+
   'Cost   :'+Clients[ComputerIndex].BiayaStr
         ,mtInformation,[mbOk],0);
end;

procedure TwServerForm.btnSetup01Click(Sender: TObject);
begin
  ShowSetup(1);
end;

procedure TwServerForm.btnSetup02Click(Sender: TObject);
begin
  ShowSetup(2);
end;

procedure TwServerForm.btnSetup03Click(Sender: TObject);
begin
  ShowSetup(3);
end;

procedure TwServerForm.btnSetup04Click(Sender: TObject);
begin
  ShowSetup(4);
end;

procedure TwServerForm.btnSetup05Click(Sender: TObject);
begin
  ShowSetup(5);
end;

procedure TwServerForm.btnSetup06Click(Sender: TObject);
begin
  ShowSetup(6);
end;

procedure TwServerForm.btnSetup07Click(Sender: TObject);
begin
  ShowSetup(7);
end;

procedure TwServerForm.btnSetup08Click(Sender: TObject);
begin
  ShowSetup(8);
end;

procedure TwServerForm.btnSetup09Click(Sender: TObject);
begin
  ShowSetup(9);
end;

procedure TwServerForm.btnSetup10Click(Sender: TObject);
begin
  ShowSetup(10);
end;

procedure TwServerForm.btnSetup11Click(Sender: TObject);
begin
  ShowSetup(11);
end;

procedure TwServerForm.btnSetup12Click(Sender: TObject);
begin
  ShowSetup(12);
end;

procedure TwServerForm.mnuUserClick(Sender: TObject);
begin
  frmUser.Show;
end;

procedure TwServerForm.mnuCostClick(Sender: TObject);
begin
  frmCost.Show;
end;

procedure TwServerForm.mnuComputerClick(Sender: TObject);
begin
  frmPC.Show;
end;

procedure TwServerForm.mnuMemberClick(Sender: TObject);
begin
  frmMember.Show;
end;

procedure TwServerForm.mnuTransactionClick(Sender: TObject);
begin
//   frmTransaction.Show;
   MessageDlg('Not implemented yet', mtInformation, [mbOk], 0);
end;

procedure TwServerForm.tmrMemo2Timer(Sender: TObject);
var S, Sdt : string;
begin
  if not DirectoryExists('Log') then
    if not CreateDir('Log') then
     Memo2.Lines.Add('Cannot create Log directory');
  Sdt := FormatDateTime('yymmddhhnnss',Now);
  Memo2.Lines.SaveToFile('Log\'+sdt+'.log');
  Memo2.Clear;
  Memo2.Lines.Add('Memo cleared at '+DateTimeToStr(Now));
  Str(ServerSocket.Socket.ActiveConnections,S);
  Memo2.Lines.Add('Active Connections : '+S);

  // Next: Send that note in Sdt variable to Administrator's mailbox...

end;

function BulanTahun(St : String) : String;
var Bln, Thn, Reslt : String;
begin
   Bln := Copy(St,5,2);
   Thn := Copy(St,1,4);
   If (CompareStr(Bln,'01') = 0) then Reslt := 'Januari' else
   If (CompareStr(Bln,'02') = 0) then Reslt := 'Februari' else
   If (CompareStr(Bln,'03') = 0) then Reslt := 'Maret' else
   If (CompareStr(Bln,'04') = 0) then Reslt := 'April' else
   If (CompareStr(Bln,'05') = 0) then Reslt := 'Mei' else
   If (CompareStr(Bln,'06') = 0) then Reslt := 'Juni' else
   If (CompareStr(Bln,'07') = 0) then Reslt := 'Juli' else
   If (CompareStr(Bln,'08') = 0) then Reslt := 'Agustus' else
   If (CompareStr(Bln,'09') = 0) then Reslt := 'September' else
   If (CompareStr(Bln,'10') = 0) then Reslt := 'Oktober' else
   If (CompareStr(Bln,'11') = 0) then Reslt := 'November' else
   If (CompareStr(Bln,'12') = 0) then Reslt := 'Desember' else;
     Reslt := Bln;

   BulanTahun := Reslt+'/'+Thn;
end;

procedure TwServerForm.mnuAboutClick(Sender: TObject);
begin
  AboutBox.lblSerial.Caption := 'Serial Number berlaku hingga : '+BulanTahun(vTglExpire);
  AboutBox.ShowModal;
end;

procedure TwServerForm.mnuHomepageClick(Sender: TObject);
begin
   ShellExecute(0, Nil, 'http://dekatmu.tripod.com/', Nil, Nil, SW_NORMAL)
end;

procedure TwServerForm.mnuRegisterClick(Sender: TObject);
begin
   frmRegister.ShowModal;
end;

procedure TwServerForm.SetHome1Click(Sender: TObject);
  var XiS : Integer; HomeStr : String;
begin
  InputQuery('IE Homepage (empty = cancel)', 'Message :', HomeStr);
  if Length(Trim(HomeStr)) > 0 then
    begin
     for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'HOME[DEL]'+Trim(HomeStr));
       Memo2.Lines.Add(TimeToStr(Time)+': Homepage Set to '+Trim(HomeStr));
    end
  else ShowMessage('Homepage set cancelled');
end;

procedure TwServerForm.btnRebootClick(Sender: TObject);
var XiS : Integer;
begin
  if MessageDlg('Do you really wish to REBOOT all clients?',
    mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
     for XiS := 0 to (ServerSocket.Socket.ActiveConnections -1)  do
       SafeSend(XiS,'REBOOT[DEL]'+ServerSocket.Socket.Connections[XiS].RemoteAddress);
     Memo2.Lines.Add(TimeToStr(Time)+': Rebooting All Clients');
    end;
end;

procedure TwServerForm.mnuLoginClick(Sender: TObject);
var UserNotFound, LoginCancelled : Boolean;
begin

   UserNotFound := True;
   LoginCancelled := PasswordDlg.ShowModal <> MrOk;
   If NOT LoginCancelled then begin
     Memo2.Lines.Add(TimeToStr(Time)+': Login Proceed, Username : '+Trim(PasswordDlg.edtUsername.Text))
   end else
     Memo2.Lines.Add(TimeToStr(Time)+': Login Cancelled');

 If NOT LoginCancelled then begin

   vLoginUserName := Trim(PasswordDlg.edtUsername.Text);
   vLoginPassword := Trim(PasswordDlg.edtPassword.Text);

   If vLoginUserName = '' then vLoginUserName := 'NONE';
   If vLoginPassword = '' then vLoginPassword := 'NONE';

  // Query Login

   Query1.Close;
   Query1.SQL.Clear;

   Query1.SQL.Add('SELECT * FROM MS_USER WHERE USERNAME = '''+vLoginUserName+''' AND PASSWORD = '''+vLoginPassword+'''');

   Query1.Prepare;
   Query1.Open;

   if Query1.RecordCount > 0 then begin
     vqLoginUserName := Trim(UpperCase(Query1.FieldByName('USERNAME').AsString));
     vqLoginPassword := Trim(UpperCase(Query1.FieldByName('PASSWORD').AsString));
     vqLoginType     := Trim(UpperCase(Query1.FieldByName('GRANT').AsString));
     vqLoginStatus   := Trim(UpperCase(Query1.FieldByName('STATUS').AsString));
     UserNotFound    := False;
   end;

   If UserNotFound then
      MessageDlg('Username tidak ditemukan, atau password anda salah. Silahkan dicoba lagi.',mtInformation, [mbOk], 0)
   else If (vqLoginStatus <> 'E') then
      MessageDlg('Login anda sedang dimatikan. Hubungi administrator anda.',mtInformation, [mbOk], 0)
   else
     begin

     If vqLoginType = 'OPR' then begin
       // Operator
       mnuLogin.Enabled       := False;
       mnuLogout.Enabled      := True;
       mniMaintenance.Enabled := True;
       mniReport.Enabled      := True;
       mniControl.Enabled     := True;
       mniSetting.Enabled     := False;

       btnShutdown.Enabled    := True;
       btnReboot.Enabled      := True;
       btnBilling.Enabled     := True;
       btnBroadcast.Enabled   := True;

       OpenAllClientsButtons;

     end;

     If vqLoginType = 'ADM' then begin
       // Administratur
       mnuLogin.Enabled       := False;
       mnuLogout.Enabled      := True;
       mniMaintenance.Enabled := False;
       mniReport.Enabled      := False;
       mniControl.Enabled     := False;
       mniSetting.Enabled     := True;

       btnShutdown.Enabled    := False;
       btnReboot.Enabled      := False;
       btnBilling.Enabled     := False;
       btnBroadcast.Enabled   := False;
     end;

     Memo2.Lines.Add(TimeToStr(Time)+': Login Succeed, Username : '+vLoginUsername);

     Caption := constStFormCaption+' ['+vLoginUsername+']';

     end;

 end;

end;

procedure TwServerForm.mnuLogoutClick(Sender: TObject);
begin
  mnuLogin.Enabled       := True;
  mnuLogout.Enabled      := False;
  mniMaintenance.Enabled := False;
  mniReport.Enabled      := False;
  mniSetting.Enabled     := False;
  mniControl.Enabled     := False;

  btnShutdown.Enabled    := False;
  btnReboot.Enabled      := False;
  btnBilling.Enabled     := False;
  btnBroadcast.Enabled   := False;

  CloseAllClientsButtons;

  Memo2.Lines.Add(TimeToStr(Time)+': Logout, '+vLoginUserName);

  Caption := constStFormCaption;

end;

end.
