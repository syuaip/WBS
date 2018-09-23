unit upcflds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmPCFields = class(TForm)
    btnSubmit: TButton;
    btnCancel: TButton;
    edtComputerNumber: TEdit;
    edtComputerName: TEdit;
    edtIPAddress: TEdit;
    edtStatus: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cboxStatus: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure cboxStatusChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure edtComputerNumberExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPCFields: TfrmPCFields;

implementation

uses upc;

{$R *.DFM}

procedure TfrmPCFields.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPCFields.cboxStatusChange(Sender: TObject);
begin
   If cboxStatus.ItemIndex = 0 then edtStatus.Text := 'E'
   else If cboxStatus.ItemIndex = 1 then edtStatus.Text := 'D'
   else If cboxStatus.ItemIndex = 2 then edtStatus.Text := 'L';
end;

procedure TfrmPCFields.FormShow(Sender: TObject);
begin
   If (Tag = 2) or (Tag = 3) then begin
     edtComputerNumber.Text := frmPC.tblPC.Fields.FieldByName('COMPUTERNUMBER').AsString;
     edtComputerName.Text   := frmPC.tblPC.Fields.FieldByName('COMPUTERNAME').AsString;
     edtIPAddress.Text      := frmPC.tblPC.Fields.FieldByName('IPADDRESS').AsString;
     edtStatus.Text         := frmPC.tblPC.Fields.FieldByName('STATUS').AsString;
     If edtStatus.Text = 'E' then cboxStatus.ItemIndex := 0
     else If edtStatus.Text = 'D' then cBoxStatus.ItemIndex := 1
     else If edtStatus.Text = 'L' then cBoxStatus.ItemIndex := 2;
     If Tag = 2 then edtComputerNumber.SetFocus;
   end else if (Tag = 1) then begin
     edtComputerNumber.Text := '';
     edtComputerName.Text   := '';
     edtIPAddress.Text      := '192.168.';
     edtStatus.Text         := 'E';
     cboxStatus.ItemIndex := 0;
     edtComputerNumber.SetFocus;
   end else MessageDlg('Improper definition for TAG variable on PCFields Form. Please contact the author',mtError,[mbOk],1);
end;

procedure TfrmPCFields.btnSubmitClick(Sender: TObject);
begin
  If Tag = 1 then begin
     frmPC.tblPC.Insert;
     try
       frmPC.tblPC.FieldByName('COMPUTERNUMBER').AsInteger := StrToInt(Trim(edtComputerNumber.Text));
     except
       on EConvertError do frmPC.tblPC.FieldByName('COMPUTERNUMBER').AsInteger := 0;
     end;
     frmPC.tblPC.FieldByName('COMPUTERNAME').AsString := Trim(edtComputerName.Text);
     frmPC.tblPC.FieldByName('IPADDRESS').AsString := Trim(edtIPAddress.Text);
     frmPC.tblPC.FieldByName('STATUS').AsString := Trim(edtStatus.Text);
     frmPC.tblPC.Post;
     Close;
  end else If Tag = 2 then begin
     frmPC.tblPC.Edit;
     try
       frmPC.tblPC.FieldByName('COMPUTERNUMBER').AsInteger := StrToInt(Trim(edtComputerNumber.Text));
     except
       on EConvertError do frmPC.tblPC.FieldByName('COMPUTERNUMBER').AsInteger := 0;
     end;
     frmPC.tblPC.FieldByName('COMPUTERNAME').AsString := Trim(edtComputerName.Text);
     frmPC.tblPC.FieldByName('IPADDRESS').AsString := Trim(edtIPAddress.Text);
     frmPC.tblPC.FieldByName('STATUS').AsString := Trim(edtStatus.Text);
     frmPC.tblPC.Post;
     Close;
  end else If Tag = 3 then begin
     If MessageDlg('Are you sure to delete this record ?',mtConfirmation,[mbYes, mbNo],1) = mrYes then begin
        frmPC.tblPC.Delete;
        Close;
     end;
  end;
end;

procedure TfrmPCFields.edtComputerNumberExit(Sender: TObject);
Var XiS : Integer;
begin
 If Trim(edtComputerNumber.Text) = '' then edtComputerNumber.Text := '0';
 try
   XiS := StrToInt(Trim(edtComputerNumber.Text));
 except
   on EConvertError do begin
        MessageDlg('Computer Number must have an integer value',mtError,[mbok],0);
        edtComputerNumber.SetFocus;
      end;
 end;
end;

end.
