unit umbrflds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TfrmMemberFields = class(TForm)
    btnSubmit: TButton;
    btnCancel: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    edtMbrType: TEdit;
    edtStatus: TEdit;
    cboxMbrType: TComboBox;
    cboxStatus: TComboBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    edtName: TEdit;
    edtSalutation: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtBirthPlace: TEdit;
    Label8: TLabel;
    edtBirthDate: TEdit;
    Label9: TLabel;
    edtCardID: TEdit;
    Label10: TLabel;
    edtAddress: TEdit;
    edtAddress2: TEdit;
    Label12: TLabel;
    edtCity: TEdit;
    Label13: TLabel;
    edtZip: TEdit;
    Label14: TLabel;
    edtHomePhone: TEdit;
    Label11: TLabel;
    edtMobilePhone: TEdit;
    Label15: TLabel;
    edtWorkPhone: TEdit;
    Label16: TLabel;
    edtMemberSince: TEdit;
    Label17: TLabel;
    edtTrxAccu: TEdit;
    Label18: TLabel;
    edtInitialMemberType: TEdit;
    btnMemberSince: TButton;
    btnBirthDate: TButton;
    dtpBirthDate: TDateTimePicker;
    procedure btnCancelClick(Sender: TObject);
    procedure cboxMbrTypeChange(Sender: TObject);
    procedure cboxStatusChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure dtpBirthDateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMemberFields: TfrmMemberFields;

implementation

uses umbr;

{$R *.DFM}

procedure TfrmMemberFields.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmMemberFields.cboxMbrTypeChange(Sender: TObject);
begin
   If cboxMbrType.ItemIndex = 0 then edtMbrType.Text := 'M'
   else If cboxMbrType.ItemIndex = 1 then edtMbrType.Text := 'V'
   else If cboxMbrType.ItemIndex = 2 then edtMbrType.Text := 'G'
   else If cboxMbrType.ItemIndex = 3 then edtMbrType.Text := 'A'
   else MessageDlg('Improper definition for Member Type value on MemberFields form. Please contact the author',mtError,[mbOk],1);
end;

procedure TfrmMemberFields.cboxStatusChange(Sender: TObject);
begin
   If cboxStatus.ItemIndex = 0 then edtStatus.Text := 'E'
   else If cboxStatus.ItemIndex = 1 then edtStatus.Text := 'D';
end;

procedure TfrmMemberFields.FormShow(Sender: TObject);
begin
   If (Tag = 2) or (Tag = 3) then begin
     edtUserName.Text := frmMember.tblMember.Fields.FieldByName('USERNAME').AsString;
     edtPassword.Text := frmMember.tblMember.Fields.FieldByName('PASSWORD').AsString;
     edtMbrType.Text  := frmMember.tblMember.Fields.FieldByName('MEMBERTYPE').AsString;

     If edtMbrType.Text = 'M' then cboxMbrType.ItemIndex := 0
     else If edtMbrType.Text = 'V' then cboxMbrType.ItemIndex := 1
     else If edtMbrType.Text = 'G' then cboxMbrType.ItemIndex := 2
     else If edtMbrType.Text = 'A' then cboxMbrType.ItemIndex := 3
     else MessageDlg('Improper definition for Member Type on COST table. Please contact the author',mtError,[mbOk],1);

     edtStatus.Text   := frmMember.tblMember.Fields.FieldByName('STATUS').AsString;
     If edtStatus.Text = 'E' then cboxStatus.ItemIndex := 0
     else If edtStatus.Text = 'D' then cBoxStatus.ItemIndex := 1;

     edtMemberSince.Text  := frmMember.tblMember.Fields.FieldByName('MEMBERSINCE').AsString;
     edtInitialMemberType.Text  := frmMember.tblMember.Fields.FieldByName('INITIALMEMBERTYPE').AsString;
     edtTrxAccu.Text  := frmMember.tblMember.Fields.FieldByName('TXACCU').AsString;

     edtName.Text        := frmMember.tblMember.Fields.FieldByName('NAME').AsString;
     edtSalutation.Text  := frmMember.tblMember.Fields.FieldByName('SALUTATION').AsString;
     edtBirthPlace.Text  := frmMember.tblMember.Fields.FieldByName('BIRTHPLACE').AsString;
     edtBirthDate.Text   := frmMember.tblMember.Fields.FieldByName('BIRTHDATE').AsString;
     If Trim(edtBirthDate.Text) = '' then edtBirthDate.Text := '01/01/1900';
     dtpBirthDate.Date   := StrToDate(edtBirthDate.Text);

     edtCardID.Text      := frmMember.tblMember.Fields.FieldByName('CARDID').AsString;
     edtAddress.Text     := frmMember.tblMember.Fields.FieldByName('ADDRESS').AsString;
     edtAddress2.Text    := frmMember.tblMember.Fields.FieldByName('ADDRESS2').AsString;
     edtCity.Text        := frmMember.tblMember.Fields.FieldByName('CITY').AsString;
     edtZIP.Text         := frmMember.tblMember.Fields.FieldByName('ZIP').AsString;
     edtHomePhone.Text   := frmMember.tblMember.Fields.FieldByName('HOMEPHONE').AsString;
     edtMobilePhone.Text := frmMember.tblMember.Fields.FieldByName('MOBILEPHONE').AsString;
     edtWorkPhone.Text   := frmMember.tblMember.Fields.FieldByName('WORKPHONE').AsString;

     If Tag = 2 then edtUserName.SetFocus;

   end else if (Tag = 1) then begin
     edtUserName.Text := '';
     edtPassword.Text := '';
     edtMbrType.Text    := 'M';
     cboxMbrType.ItemIndex := 0;
     edtStatus.Text   := 'E';
     cboxStatus.ItemIndex := 0;
     edtUserName.SetFocus;
   end else MessageDlg('Improper definition for TAG variable on MemberFields form. Please contact the author',mtError,[mbOk],1);
//  Caption := Caption + ', '+ InttoStr(Tag);
end;

procedure TfrmMemberFields.btnSubmitClick(Sender: TObject);
begin
  If Tag = 1 then begin

     try
     
     frmMember.tblMember.Insert;
     frmMember.tblMember.FieldByName('USERNAME').AsString := Trim(edtUserName.Text);
     frmMember.tblMember.FieldByName('PASSWORD').AsString := Trim(edtPassword.Text);
     frmMember.tblMember.FieldByName('MEMBERTYPE').AsString   := Trim(edtMbrType.Text);
     frmMember.tblMember.FieldByName('STATUS').AsString   := Trim(edtStatus.Text);

     frmMember.tblMember.Fields.FieldByName('NAME').AsString := edtName.Text;
     frmMember.tblMember.Fields.FieldByName('SALUTATION').AsString := edtSalutation.Text;
     frmMember.tblMember.Fields.FieldByName('BIRTHPLACE').AsString := edtBirthPlace.Text;

     edtBirthDate.Text := DateToStr(dtpBirthDate.Date);
     frmMember.tblMember.Fields.FieldByName('BIRTHDATE').AsString := edtBirthDate.Text;

     frmMember.tblMember.Fields.FieldByName('CARDID').AsString := edtCardID.Text;
     frmMember.tblMember.Fields.FieldByName('ADDRESS').AsString := edtAddress.Text;
     frmMember.tblMember.Fields.FieldByName('ADDRESS2').AsString := edtAddress2.Text;
     frmMember.tblMember.Fields.FieldByName('CITY').AsString := edtCity.Text;
     frmMember.tblMember.Fields.FieldByName('ZIP').AsString := edtZIP.Text;
     frmMember.tblMember.Fields.FieldByName('HOMEPHONE').AsString := edtHomePhone.Text;
     frmMember.tblMember.Fields.FieldByName('MOBILEPHONE').AsString := edtMobilePhone.Text;
     frmMember.tblMember.Fields.FieldByName('WORKPHONE').AsString := edtWorkPhone.Text;

     frmMember.tblMember.Post;

     except
       on E: Exception do ; //MessageDlg(E.Message,mtWarning,[mbOk],0);
     end;

     Close;
  end else If Tag = 2 then begin

     try

     frmMember.tblMember.Edit;
     frmMember.tblMember.FieldByName('USERNAME').AsString := Trim(edtUserName.Text);
     frmMember.tblMember.FieldByName('PASSWORD').AsString := Trim(edtPassword.Text);
     frmMember.tblMember.FieldByName('MEMBERTYPE').AsString   := Trim(edtMbrType.Text);
     frmMember.tblMember.FieldByName('STATUS').AsString   := Trim(edtStatus.Text);

     frmMember.tblMember.Fields.FieldByName('NAME').AsString := edtName.Text;
     frmMember.tblMember.Fields.FieldByName('SALUTATION').AsString := edtSalutation.Text;
     frmMember.tblMember.Fields.FieldByName('BIRTHPLACE').AsString := edtBirthPlace.Text;

     edtBirthDate.Text := DateToStr(dtpBirthDate.Date);
     frmMember.tblMember.Fields.FieldByName('BIRTHDATE').AsString := edtBirthDate.Text;

     frmMember.tblMember.Fields.FieldByName('CARDID').AsString := edtCardID.Text;
     frmMember.tblMember.Fields.FieldByName('ADDRESS').AsString := edtAddress.Text;
     frmMember.tblMember.Fields.FieldByName('ADDRESS2').AsString := edtAddress2.Text;
     frmMember.tblMember.Fields.FieldByName('CITY').AsString := edtCity.Text;
     frmMember.tblMember.Fields.FieldByName('ZIP').AsString := edtZIP.Text;
     frmMember.tblMember.Fields.FieldByName('HOMEPHONE').AsString := edtHomePhone.Text;
     frmMember.tblMember.Fields.FieldByName('MOBILEPHONE').AsString := edtMobilePhone.Text;
     frmMember.tblMember.Fields.FieldByName('WORKPHONE').AsString := edtWorkPhone.Text;

     frmMember.tblMember.Post;

     except
       on E: Exception do MessageDlg(E.Message,mtWarning,[mbOk],0);
     end;

     Close;
  end else If Tag = 3 then begin
     If MessageDlg('Are you sure to delete this record ?',mtConfirmation,[mbYes, mbNo],1) = mrYes then begin

       try

        frmMember.tblMember.Delete;

       except
        on E: Exception do MessageDlg(E.Message,mtWarning,[mbOk],0);
       end;

       Close;

     end;
  end;
end;

procedure TfrmMemberFields.dtpBirthDateChange(Sender: TObject);
begin
//   edtBirthDate.Text := DateToStr(dtpBirthDate.Date);
end;

end.
