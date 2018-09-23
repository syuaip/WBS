unit umbr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls;

type
  TfrmMember = class(TForm)
    dbgMember: TDBGrid;
    tblMember: TTable;
    dsMember: TDataSource;
    dbMember: TDatabase;
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
    procedure dbgMemberDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMember: TfrmMember;

implementation

uses umbrflds;

{$R *.DFM}

procedure TfrmMember.btnExitClick(Sender: TObject);
begin
  dbMember.Connected := False;
  tblMember.Active := False;
  Close;
end;

procedure TfrmMember.FormShow(Sender: TObject);
begin
  dbMember.Connected := True;
  tblMember.Active := True;
end;

procedure TfrmMember.btnRefreshClick(Sender: TObject);
begin
  tblMember.Refresh;
end;

procedure TfrmMember.btnEditClick(Sender: TObject);
begin
  frmMemberFields.Tag := 2;
  frmMemberFields.Caption := 'Edit Member';
  frmMemberFields.btnSubmit.Caption := '&Submit';
  frmMemberFields.ShowModal;
  dbMember.Connected := False;
  tblMember.Active := False;
  dbMember.Connected := True;
  tblMember.Active := True;
end;

procedure TfrmMember.btnAddClick(Sender: TObject);
begin
  frmMemberFields.Tag := 1;
  frmMemberFields.Caption := 'Add Member';
  frmMemberFields.btnSubmit.Caption := '&Add';
  frmMemberFields.ShowModal;
  dbMember.Connected := False;
  tblMember.Active := False;
  dbMember.Connected := True;
  tblMember.Active := True;
end;

procedure TfrmMember.btnDeleteClick(Sender: TObject);
begin
  frmMemberFields.Tag := 3;
  frmMemberFields.Caption := 'Delete Member';
  frmMemberFields.btnSubmit.Caption := '&Delete';
  frmMemberFields.ShowModal;
  dbMember.Connected := False;
  tblMember.Active := False;
  dbMember.Connected := True;
  tblMember.Active := True;
end;

procedure TfrmMember.dbgMemberDblClick(Sender: TObject);
begin
   btnEditClick(Self);
end;

end.
