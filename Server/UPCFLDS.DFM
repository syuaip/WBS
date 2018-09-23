object frmPCFields: TfrmPCFields
  Left = 371
  Top = 367
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PC Fields'
  ClientHeight = 170
  ClientWidth = 302
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
    Top = 8
    Width = 101
    Height = 13
    Caption = 'Computer Number'
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
    Top = 40
    Width = 90
    Height = 13
    Caption = 'Computer Name'
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
    Top = 72
    Width = 62
    Height = 13
    Caption = 'IP Address'
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
    Top = 104
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
    Left = 80
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Submit'
    Default = True
    TabOrder = 0
    OnClick = btnSubmitClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 136
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edtComputerNumber: TEdit
    Left = 112
    Top = 8
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    Text = 'EDTCOMPUTERNUMBER'
    OnExit = edtComputerNumberExit
  end
  object edtComputerName: TEdit
    Left = 112
    Top = 40
    Width = 169
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    Text = 'EDTCOMPUTERNAME'
  end
  object edtIPAddress: TEdit
    Left = 112
    Top = 72
    Width = 129
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    Text = 'IPADDRESS'
  end
  object edtStatus: TEdit
    Left = 216
    Top = 104
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 5
    Text = 'EDTSTATUS'
    Visible = False
  end
  object cboxStatus: TComboBox
    Left = 112
    Top = 104
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'cboxStatus'
    OnChange = cboxStatusChange
    Items.Strings = (
      'Enabled'
      'Disabled'
      'Locked')
  end
end
