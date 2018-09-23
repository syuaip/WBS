object frmCostFields: TfrmCostFields
  Left = 232
  Top = 99
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cost Type Fields'
  ClientHeight = 244
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 80
    Width = 109
    Height = 13
    Caption = 'Transaction Desc. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 8
    Top = 112
    Width = 97
    Height = 13
    Caption = 'Transaction Cost'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 8
    Top = 16
    Width = 77
    Height = 13
    Caption = 'Member Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 8
    Top = 48
    Width = 100
    Height = 13
    Caption = 'Transaction Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 8
    Top = 144
    Width = 78
    Height = 13
    Caption = 'Minimum Cost'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 8
    Top = 176
    Width = 81
    Height = 13
    Caption = 'Write Off Cost'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btnSubmit: TButton
    Left = 128
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Submit'
    Default = True
    TabOrder = 0
    OnClick = btnSubmitClick
  end
  object btnCancel: TButton
    Left = 216
    Top = 208
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edtTrxDesc: TEdit
    Left = 128
    Top = 80
    Width = 233
    Height = 21
    TabOrder = 2
    Text = 'EDTTRXDESC'
  end
  object edtTrxCost: TEdit
    Left = 128
    Top = 112
    Width = 177
    Height = 21
    Hint = 
      'Biaya transaksi per unit (Internet per Jam, Scan per Lembar, Cet' +
      'ak per Lembar)'
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = 'EDTTRXCOST'
    OnExit = edtTrxCostExit
  end
  object edtMbrType: TEdit
    Left = 256
    Top = 16
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    Text = 'EDTMBRTYPE'
    Visible = False
  end
  object edtTrxType: TEdit
    Left = 256
    Top = 48
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    Text = 'EDTTRXTYPE'
    Visible = False
  end
  object cboxMbrType: TComboBox
    Left = 128
    Top = 16
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'cboxMbrType'
    OnChange = cboxMbrTypeChange
    Items.Strings = (
      'Member (M)'
      'VIP (V)'
      'Guest (G)'
      'Admin (A)')
  end
  object cboxTrxType: TComboBox
    Left = 128
    Top = 48
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cboxTrxType'
    OnChange = cboxTrxTypeChange
    Items.Strings = (
      'Internet (NET)'
      'Scan (SCN)'
      'Disket (DSK)'
      'Print Text B/W (PTB)'
      'Print Text Color (PTC)'
      'Print Graphic B/W (PPB)'
      'Print Graphic Color (PPC)')
  end
  object edtTRXMINCOST: TEdit
    Left = 128
    Top = 144
    Width = 177
    Height = 21
    Hint = 
      'Jika nilai transaksi berada di bawah nilai ini, maka customer ak' +
      'an ditagih senilai ini'
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = 'EDTTRXMINCOST'
    OnExit = edtTRXMINCOSTExit
  end
  object edtTRXFREECOST: TEdit
    Left = 128
    Top = 176
    Width = 177
    Height = 21
    Hint = 
      'Jika biaya transaksi di bawah nilai ini, maka transaksi akan di-' +
      'write-off/dianggap gratis'
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Text = 'EDTTRXFREECOST'
    OnExit = edtTRXFREECOSTExit
  end
end
