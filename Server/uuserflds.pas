unit uuserflds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmUserFields = class(TForm)
    btnSubmit: TButton;
    btnCancel: TButton;
    edtUsername: TEdit;
    edtPassword: TEdit;
    edtGrant: TEdit;
    edtStatus: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cboxGrant: TComboBox;
    cboxStatus: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure cboxGrantChange(Sender: TObject);
    procedure cboxStatusChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserFields: TfrmUserFields;

implementation

uses uuser;

{$R *.DFM}

procedure TfrmUserFields.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmUserFields.cboxGrantChange(Sender: TObject);
begin
   If cboxGrant.ItemIndex = 0 then edtGrant.Text := 'OPR'
   else If cboxGrant.ItemIndex = 1 then edtGrant.Text := 'ADM';
end;

procedure TfrmUserFields.cboxStatusChange(Sender: TObject);
begin
   If cboxStatus.ItemIndex = 0 then edtStatus.Text := 'E'
   else If cboxStatus.ItemIndex = 1 then edtStatus.Text := 'D';
end;

procedure TfrmUserFields.FormShow(Sender: TObject);
begin
   If (Tag = 2) or (Tag = 3) then begin
     edtUserName.Text := frmUser.tblUser.Fields.FieldByName('USERNAME').AsString;
     edtPassword.Text := frmUser.tblUser.Fields.FieldByName('PASSWORD').AsString;
     edtGrant.Text    := frmUser.tblUser.Fields.FieldByName('GRANT').AsString;
     If edtGrant.Text = 'OPR' then cboxGrant.ItemIndex := 0
     else If edtGrant.Text = 'ADM' then cBoxGrant.ItemIndex := 1;
     edtStatus.Text   := frmUser.tblUser.Fields.FieldByName('STATUS').AsString;
     If edtStatus.Text = 'E' then cboxStatus.ItemIndex := 0
     else If edtStatus.Text = 'D' then cBoxStatus.ItemIndex := 1;
     If Tag = 2 then edtUserName.SetFocus;
   end else if (Tag = 1) then begin
     edtUserName.Text := '';
     edtPassword.Text := '';
     edtGrant.Text    := 'OPR';
     cboxGrant.ItemIndex := 0;
     edtStatus.Text   := 'E';
     cboxStatus.ItemIndex := 0;
     edtUserName.SetFocus;
   end else MessageDlg('Improper definition for TAG variable on UserFields Form. Please contact the author',mtError,[mbOk],1);
end;

procedure TfrmUserFields.btnSubmitClick(Sender: TObject);
begin
  If Tag = 1 then begin
     frmUser.tblUser.Insert;
     frmUser.tblUser.FieldByName('USERNAME').AsString := Trim(edtUserName.Text);
     frmUser.tblUser.FieldByName('PASSWORD').AsString := Trim(edtPassword.Text);
     frmUser.tblUser.FieldByName('GRANT').AsString    := Trim(edtGrant.Text);
     frmUser.tblUser.FieldByName('STATUS').AsString   := Trim(edtStatus.Text);
     frmUser.tblUser.Post;
     Close;
  end else If Tag = 2 then begin
     frmUser.tblUser.Edit;
     frmUser.tblUser.FieldByName('USERNAME').AsString := Trim(edtUserName.Text);
     frmUser.tblUser.FieldByName('PASSWORD').AsString := Trim(edtPassword.Text);
     frmUser.tblUser.FieldByName('GRANT').AsString    := Trim(edtGrant.Text);
     frmUser.tblUser.FieldByName('STATUS').AsString   := Trim(edtStatus.Text);
     frmUser.tblUser.Post;
     Close;
  end else If Tag = 3 then begin
     If MessageDlg('Are you sure to delete this record ?',mtConfirmation,[mbYes, mbNo],1) = mrYes then begin
        frmUser.tblUser.Delete;
        Close;
     end;
  end;
end;

end.
