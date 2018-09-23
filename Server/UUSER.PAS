unit uuser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls;

type
  TfrmUser = class(TForm)
    dbgUser: TDBGrid;
    tblUser: TTable;
    dsUser: TDataSource;
    dbUser: TDatabase;
    btnEdit: TButton;
    btnAdd: TButton;
    btnDelete: TButton;
    btnExit: TButton;
    btnRefresh: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgUserDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUser: TfrmUser;

implementation

uses uuserflds;

{$R *.DFM}

procedure TfrmUser.btnExitClick(Sender: TObject);
begin
  dbUser.Connected := False;
  tblUser.Active := False;
  Close;
end;

procedure TfrmUser.FormShow(Sender: TObject);
begin
  dbUser.Connected := True;
  tblUser.Active := True;
end;

procedure TfrmUser.btnRefreshClick(Sender: TObject);
begin
  tblUser.Refresh;
end;

procedure TfrmUser.btnEditClick(Sender: TObject);
begin
  frmUserFields.Tag := 2;
  frmUserFields.Caption := 'Edit User';
  frmUserFields.btnSubmit.Caption := '&Submit';
  frmUserFields.ShowModal;
end;

procedure TfrmUser.btnAddClick(Sender: TObject);
begin
  frmUserFields.Tag := 1;
  frmUserFields.Caption := 'Add User';
  frmUserFields.btnSubmit.Caption := '&Add';
  frmUserFields.ShowModal;
end;

procedure TfrmUser.btnDeleteClick(Sender: TObject);
begin
  frmUserFields.Tag := 3;
  frmUserFields.Caption := 'Delete User';
  frmUserFields.btnSubmit.Caption := '&Delete';
  frmUserFields.ShowModal;
end;

procedure TfrmUser.dbgUserDblClick(Sender: TObject);
begin
   btnEditClick(Self);
end;

end.
