unit ssng1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TfrmSSNG = class(TForm)
    edtCN: TEdit;
    edtHDD: TEdit;
    edtDate: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnGenerate: TButton;
    btnGetHDD: TButton;
    btnTest: TButton;
    edtSN: TEdit;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label6: TLabel;
    edtPassword: TEdit;
    procedure btnGetHDDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSSNG: TfrmSSNG;

implementation

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
    SimpleDecrypt := 'Wrong CRC'
  else
    begin
      St := StringSwap(St);
      If Length(St)> 0 then For XiS := 1 to Length(St) do begin
        St[XiS] := Chr(Ord(St[XiS]) - 20);
      end;
      SimpleDecrypt := St;
    end;
end;

function SerialCheck(vSN, vCN, vHDD, vDate : String) : Boolean;
var SZ1, SZ2 : String;
begin
    frmSSNG.Memo1.Lines.Add('vDate : '+vDate);
    frmSSNG.Memo1.Lines.Add('Plain vSN : '+vSN);

  vSN := SimpleDecrypt(vSN);
    frmSSNG.Memo1.Lines.Add('Decrypted vSN : '+vSN);

  SZ1 := Copy(vSN,Length(vSN)-5,6); {Date}
    frmSSNG.Memo1.Lines.Add('Decrypted SZ1 : '+SZ1);

  SZ2 := Copy(vSN,1,Length(vSN)-6);      {vCN+vHDD}
    frmSSNG.Memo1.Lines.Add('Decrypted SZ2 : '+SZ2);

  SerialCheck := (vDate <= SZ1) AND (SZ2 = vCN+vHDD);
end;

procedure TfrmSSNG.btnGetHDDClick(Sender: TObject);
var
  a, b : dword;
  Buffer  : array [0..255] of char;
  W : Dword;
begin
  try
    if GetVolumeInformation('c:\', Buffer, SizeOf(Buffer), @Tag , a, b, nil, 0) then
      begin
         W := Tag;
         edtHDD.Text := IntToStr(W);
      end
  except
    on E: Exception do MessageDlg(E.Message,mtError,[mbOk],0);
  end;
end;

procedure TfrmSSNG.FormCreate(Sender: TObject);
begin
   Memo1.Clear;
   btnGetHDDClick(Self);
   edtDate.Text := FormatDateTime('yyyymm',Date);
end;

function ShiftString(St : String; ShiftCount : Integer) : String;
var XiS : Integer;
begin
   If Length(St) > 0 then
     For XiS := 1 to Length(St) do
       St[XiS] := Chr(Ord(St[XiS])-ShiftCount);
   ShiftString := St;
end;

procedure TfrmSSNG.btnGenerateClick(Sender: TObject);
begin
  If edtPassword.Text = ShiftString('43573',3) then
    edtSN.Text := SimpleEncrypt(Trim(edtCN.Text)+Trim(edtHDD.Text)+Trim(edtDate.Text))
  else
    edtSN.Text := 'Wrong Password';

  // the password is '10240'

end;

procedure TfrmSSNG.btnTestClick(Sender: TObject);
begin
  If SerialCheck(Trim(edtSN.Text), Trim(edtCN.Text), Trim(edtHDD.Text), FormatDateTime('yyyymm',DateTimePicker1.Date)) then
    Memo1.Lines.Add('Test Victoriously Succeed :)')
  else
    Memo1.Lines.Add('Test Failed Miserably! :(')
end;

procedure TfrmSSNG.DateTimePicker2Change(Sender: TObject);
begin
  edtDate.Text := FormatDateTime('yyyymm',DateTimePicker2.Date)
end;

end.
