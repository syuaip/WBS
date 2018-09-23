unit regist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ShellAPI, Db, DBTables;

type
  TfrmRegister = class(TForm)
    Label1: TLabel;
    edtCN: TEdit;
    edtCID: TEdit;
    edtSN: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnRegister: TButton;
    btnClose: TButton;
    btnGetSN: TButton;
    dbSetup: TDatabase;
    tblSetup: TTable;
    dsSetup: TDataSource;
    procedure btnCloseClick(Sender: TObject);
    procedure btnGetSNClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;

implementation

uses main;

{$R *.DFM}

procedure TfrmRegister.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRegister.btnGetSNClick(Sender: TObject);
begin
   ShellExecute(0, Nil, 'http://dekatmu.tripod.com', Nil, Nil, SW_NORMAL)
end;

procedure TfrmRegister.btnRegisterClick(Sender: TObject);
begin
   // write to MS_SETUP
  tblSetup.Edit;
  tblSetup.FieldByName('LICENSEDTOCOMP').AsString := Trim(edtCN.Text);
  tblSetup.FieldByName('HDDSERIAL').AsString := Trim(edtCID.Text);
  tblSetup.FieldByName('SERIALNUMBER').AsString := Trim(edtSN.Text);
  tblSetup.Post;
  // inform User to Restart Apps
  MessageDlg('To check whether the serial number is valid or not,'+#13#10+
    'please quit and restart this application',mtInformation,[mbOk],0);

  Close;
end;

procedure TfrmRegister.FormShow(Sender: TObject);
begin
  // activate DB connection
  dbSetup.Connected := True;
  tblSetup.Active := True;

  // read dari MS_SETUP
  edtCN.Text  := tblSetup.FieldByName('LICENSEDTOCOMP').AsString;
  edtCID.Text := vHDDSerial;
  edtSN.Text  := tblSetup.FieldByName('SERIALNUMBER').AsString;
end;

procedure TfrmRegister.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dbSetup.Connected := False;
  tblSetup.Active := False;
end;

end.
