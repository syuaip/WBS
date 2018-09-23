unit ucostflds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmCostFields = class(TForm)
    btnSubmit: TButton;
    btnCancel: TButton;
    edtTrxDesc: TEdit;
    edtTrxCost: TEdit;
    edtMbrType: TEdit;
    edtTrxType: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cboxMbrType: TComboBox;
    cboxTrxType: TComboBox;
    edtTRXMINCOST: TEdit;
    edtTRXFREECOST: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure cboxMbrTypeChange(Sender: TObject);
    procedure cboxTrxTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure edtTrxCostExit(Sender: TObject);
    procedure edtTRXMINCOSTExit(Sender: TObject);
    procedure edtTRXFREECOSTExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const vAuthor : String = 'ariefwn@yahoo.com';

var
  frmCostFields: TfrmCostFields;

implementation

uses ucost;

{$R *.DFM}

procedure TfrmCostFields.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCostFields.cboxMbrTypeChange(Sender: TObject);
begin
   If cboxMbrType.ItemIndex = 0 then edtMbrType.Text := 'M'
   else If cboxMbrType.ItemIndex = 1 then edtMbrType.Text := 'V'
   else If cboxMbrType.ItemIndex = 2 then edtMbrType.Text := 'G'
   else If cboxMbrType.ItemIndex = 3 then edtMbrType.Text := 'A'
   else MessageDlg('Improper definition for MEMBER TYPE value on CosyFields form. Please contact the author <'+vAuthor+'>',mtError,[mbOk],1);
end;

procedure TfrmCostFields.cboxTrxTypeChange(Sender: TObject);
begin
   If cboxTrxType.ItemIndex = 0 then edtTrxType.Text := 'NET'
   else If cboxTrxType.ItemIndex = 1 then edtTrxType.Text := 'SCN'
   else If cboxTrxType.ItemIndex = 2 then edtTrxType.Text := 'DSK'
   else If cboxTrxType.ItemIndex = 3 then edtTrxType.Text := 'PTB'
   else If cboxTrxType.ItemIndex = 4 then edtTrxType.Text := 'PTC'
   else If cboxTrxType.ItemIndex = 5 then edtTrxType.Text := 'PPB'
   else If cboxTrxType.ItemIndex = 6 then edtTrxType.Text := 'PPC'
   else MessageDlg('Improper definition for TRANSACTION TYPE value on CosyFields form. Please contact the author <'+vAuthor+'>',mtError,[mbOk],1);

{
NET - Internet
SCN - Scan
DSK - Disket
PTB - Print Text B/W
PTC - Print Text Color
PPB - Print Graphic B/W
PPC - Print Graphic Color
}

end;

procedure TfrmCostFields.FormShow(Sender: TObject);
begin
   If (Tag = 2) or (Tag = 3) then begin
     edtMbrType.Text := frmCost.tblCost.Fields.FieldByName('MBRTYPE').AsString;
     edtTrxType.Text := frmCost.tblCost.Fields.FieldByName('TRXTYPE').AsString;
     edtTrxDesc.Text := frmCost.tblCost.Fields.FieldByName('TRXDESC').AsString;
     edtTrxCost.Text := frmCost.tblCost.Fields.FieldByName('TRXCOST').AsString;
     edtTrxMinCost.Text := frmCost.tblCost.Fields.FieldByName('TRXMINCOST').AsString;
     edtTrxFreeCost.Text := frmCost.tblCost.Fields.FieldByName('TRXFREECOST').AsString;

     If edtMbrType.Text = 'M' then cboxMbrType.ItemIndex := 0
     else If edtMbrType.Text = 'V' then cboxMbrType.ItemIndex := 1
     else If edtMbrType.Text = 'G' then cboxMbrType.ItemIndex := 2
     else If edtMbrType.Text = 'A' then cboxMbrType.ItemIndex := 3
     else MessageDlg('Improper definition for MEMBER TYPE table content on COST table. Please contact the author <'+vAuthor+'>',mtError,[mbOk],1);

     If edtTrxType.Text = 'NET' then cboxTrxType.ItemIndex := 0
     else If edtTrxType.Text = 'SCN' then cboxTrxType.ItemIndex := 1
     else If edtTrxType.Text = 'DSK' then cboxTrxType.ItemIndex := 2
     else If edtTrxType.Text = 'PTB' then cboxTrxType.ItemIndex := 3
     else If edtTrxType.Text = 'PTC' then cboxTrxType.ItemIndex := 4
     else If edtTrxType.Text = 'PPB' then cboxTrxType.ItemIndex := 5
     else If edtTrxType.Text = 'PPC' then cboxTrxType.ItemIndex := 6
     else MessageDlg('Improper definition for TRANCACTION TYPE table content on COST table. Please contact the author <'+vAuthor+'>',mtError,[mbOk],1);

     If Tag = 2 then cboxMbrType.SetFocus;

   end else if (Tag = 1) then begin

     edtMbrType.Text := 'M';
     cboxMbrType.ItemIndex := 0;
     edtTrxType.Text := 'NET';
     cboxTrxType.ItemIndex := 0;

     edtTrxDesc.Text := '';
     edtTrxCost.Text := '0';
     edtTrxMinCost.Text := '0';
     edtTrxFreeCost.Text := '0';

     cboxMbrType.SetFocus;

   end else MessageDlg('Improper definition for TAG variable on CostFields form. Please contact the author <'+vAuthor+'>',mtError,[mbOk],1);
end;

procedure TfrmCostFields.btnSubmitClick(Sender: TObject);
begin
  If Tag = 1 then begin
     frmCost.tblCost.Insert;
     frmCost.tblCost.FieldByName('MBRTYPE').AsString  := Trim(edtMbrType.Text);
     frmCost.tblCost.FieldByName('TRXTYPE').AsString  := Trim(edtTrxType.Text);
     frmCost.tblCost.FieldByName('TRXDESC').AsString  := Trim(edtTrxDesc.Text);
     try
     frmCost.tblCost.FieldByName('TRXCOST').AsInteger := StrToInt(Trim(edtTrxCost.Text));
     except
       on EConvertError do frmCost.tblCost.FieldByName('TRXCOST').AsInteger := 0; 
     end;
     try
     frmCost.tblCost.FieldByName('TRXMINCOST').AsInteger := StrToInt(Trim(edtTrxMinCost.Text));
     except
       on EConvertError do frmCost.tblCost.FieldByName('TRXMINCOST').AsInteger := 0;
     end;
     try
     frmCost.tblCost.FieldByName('TRXFREECOST').AsInteger := StrToInt(Trim(edtTrxFreeCost.Text));
     except
       on EConvertError do frmCost.tblCost.FieldByName('TRXFREECOST').AsInteger := 0;
     end;
     frmCost.tblCost.Post;
     Close;
  end else If Tag = 2 then begin
     frmCost.tblCost.Edit;
     frmCost.tblCost.FieldByName('MBRTYPE').AsString  := Trim(edtMbrType.Text);
     frmCost.tblCost.FieldByName('TRXTYPE').AsString  := Trim(edtTrxType.Text);
     frmCost.tblCost.FieldByName('TRXDESC').AsString  := Trim(edtTrxDesc.Text);
     try
     frmCost.tblCost.FieldByName('TRXCOST').AsInteger := StrToInt(Trim(edtTrxCost.Text));
     except
       on EConvertError do frmCost.tblCost.FieldByName('TRXCOST').AsInteger := 0; 
     end;
     try
     frmCost.tblCost.FieldByName('TRXMINCOST').AsInteger := StrToInt(Trim(edtTrxMinCost.Text));
     except
       on EConvertError do frmCost.tblCost.FieldByName('TRXMINCOST').AsInteger := 0;
     end;
     try
     frmCost.tblCost.FieldByName('TRXFREECOST').AsInteger := StrToInt(Trim(edtTrxFreeCost.Text));
     except
       on EConvertError do frmCost.tblCost.FieldByName('TRXFREECOST').AsInteger := 0;
     end;
     frmCost.tblCost.Post;
     Close;
  end else If Tag = 3 then begin
     If MessageDlg('Are you sure to delete this record ?',mtConfirmation,[mbYes, mbNo],1) = mrYes then begin
        frmCost.tblCost.Delete;
        Close;
     end;
  end;
end;

procedure TfrmCostFields.edtTrxCostExit(Sender: TObject);
Var XiS : Integer;
begin
 If Trim(edtTrxCost.Text) = '' then edtTrxCost.Text := '0';
 try
   XiS := StrToInt(Trim(edtTrxCost.Text));
 except
   on EConvertError do begin
        MessageDlg('Transaction Cost must have an integer value',mtError,[mbok],0);
        edtTrxCost.SetFocus;
      end;
 end;
end;

procedure TfrmCostFields.edtTRXMINCOSTExit(Sender: TObject);
Var XiS : Integer;
begin
 If Trim(edtTrxMinCost.Text) = '' then edtTrxMinCost.Text := '0';
 try
   XiS := StrToInt(Trim(edtTrxMinCost.Text));
 except
   on EConvertError do begin
        MessageDlg('Minimum Cost must have an integer value',mtError,[mbok],0);
        edtTrxMinCost.SetFocus;
      end;
 end;
end;
procedure TfrmCostFields.edtTRXFREECOSTExit(Sender: TObject);
Var XiS : Integer;
begin
 If Trim(edtTrxFreeCost.Text) = '' then edtTrxFreeCost.Text := '0';
 try
   XiS := StrToInt(Trim(edtTrxFreeCost.Text));
 except
   on EConvertError do begin
        MessageDlg('Write-Off Cost must have an integer value',mtError,[mbok],0);
        edtTrxFreeCost.SetFocus;
      end;
 end;
end;
end.
