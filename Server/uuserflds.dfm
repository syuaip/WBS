object frmUserFields: TfrmUserFields
  Left = 343
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'User Fields'
  ClientHeight = 186
  ClientWidth = 380
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
    Top = 16
    Width = 63
    Height = 13
    Caption = 'User Name'
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
    Top = 48
    Width = 55
    Height = 13
    Caption = 'Password'
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
    Top = 80
    Width = 32
    Height = 13
    Caption = 'Grant'
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
    Top = 112
    Width = 37
    Height = 13
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btnSubmit: TButton
    Left = 120
    Top = 152
    Width = 75
    Height = 25
    Caption = '&Submit'
    Default = True
    TabOrder = 0
    OnClick = btnSubmitClick
  end
  object btnCancel: TButton
    Left = 208
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edtUsername: TEdit
    Left = 80
    Top = 16
    Width = 289
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    Text = 'EDTUSERNAME'
  end
  object edtPassword: TEdit
    Left = 80
    Top = 48
    Width = 289
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    Text = 'EDTPASSWORD'
  end
  object edtGrant: TEdit
    Left = 288
    Top = 80
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 4
    Text = 'EDTGRANT'
    Visible = False
  end
  object edtStatus: TEdit
    Left = 288
    Top = 112
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 5
    Text = 'EDTSTATUS'
    Visible = False
  end
  object cboxGrant: TComboBox
    Left = 80
    Top = 80
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'cboxGrant'
    OnChange = cboxGrantChange
    Items.Strings = (
      'Operator'
      'Administrator')
  end
  object cboxStatus: TComboBox
    Left = 80
    Top = 112
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cboxStatus'
    OnChange = cboxStatusChange
    Items.Strings = (
      'Enabled'
      'Disabled')
  end
end
