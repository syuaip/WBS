unit upc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls;

type
  TfrmPC = class(TForm)
    dbgPC: TDBGrid;
    tblPC: TTable;
    dsPC: TDataSource;
    dbPC: TDatabase;
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
    procedure dbgPCDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPC: TfrmPC;

implementation

uses upcflds;

{$R *.DFM}

procedure TfrmPC.btnExitClick(Sender: TObject);
begin
  dbPC.Connected := False;
  tblPC.Active := False;
  Close;
end;

procedure TfrmPC.FormShow(Sender: TObject);
begin
  dbPC.Connected := True;
  tblPC.Active := True;
end;

procedure TfrmPC.btnRefreshClick(Sender: TObject);
begin
  tblPC.Refresh;
end;

procedure TfrmPC.btnEditClick(Sender: TObject);
begin
  frmPCFields.Tag := 2;
  frmPCFields.Caption := 'Edit PC';
  frmPCFields.btnSubmit.Caption := '&Submit';
  frmPCFields.ShowModal;
end;

procedure TfrmPC.btnAddClick(Sender: TObject);
begin
  frmPCFields.Tag := 1;
  frmPCFields.Caption := 'Add PC';
  frmPCFields.btnSubmit.Caption := '&Add';
  frmPCFields.ShowModal;
end;

procedure TfrmPC.btnDeleteClick(Sender: TObject);
begin
  frmPCFields.Tag := 3;
  frmPCFields.Caption := 'Delete PC';
  frmPCFields.btnSubmit.Caption := '&Delete';
  frmPCFields.ShowModal;
end;

procedure TfrmPC.dbgPCDblClick(Sender: TObject);
begin
   btnEditClick(Self);
end;

end.
