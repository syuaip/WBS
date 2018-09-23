unit ucost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls;

type
  TfrmCost = class(TForm)
    dbgCost: TDBGrid;
    tblCost: TTable;
    dsCost: TDataSource;
    dbCost: TDatabase;
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
    procedure dbgCostDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCost: TfrmCost;

implementation

uses ucostflds;

{$R *.DFM}

procedure TfrmCost.btnExitClick(Sender: TObject);
begin
  dbCost.Connected := False;
  tblCost.Active := False;
  Close;
end;

procedure TfrmCost.FormShow(Sender: TObject);
begin
  dbCost.Connected := True;
  tblCost.Active := True;
end;

procedure TfrmCost.btnRefreshClick(Sender: TObject);
begin
  tblCost.Refresh;
end;

procedure TfrmCost.btnEditClick(Sender: TObject);
begin
  frmCostFields.Tag := 2;
  frmCostFields.Caption := 'Edit Cost Type';
  frmCostFields.btnSubmit.Caption := '&Submit';
  frmCostFields.ShowModal;
end;

procedure TfrmCost.btnAddClick(Sender: TObject);
begin
  frmCostFields.Tag := 1;
  frmCostFields.Caption := 'Add Cost Type';
  frmCostFields.btnSubmit.Caption := '&Add';
  frmCostFields.ShowModal;
end;

procedure TfrmCost.btnDeleteClick(Sender: TObject);
begin
  frmCostFields.Tag := 3;
  frmCostFields.Caption := 'Delete Cost Type';
  frmCostFields.btnSubmit.Caption := '&Delete';
  frmCostFields.ShowModal;
end;

procedure TfrmCost.dbgCostDblClick(Sender: TObject);
begin
  btnEditClick(Self);
end;

end.
