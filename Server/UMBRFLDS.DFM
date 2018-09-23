object frmMemberFields: TfrmMemberFields
  Left = 273
  Top = 191
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Member Fields'
  ClientHeight = 367
  ClientWidth = 653
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
  object btnSubmit: TButton
    Left = 264
    Top = 336
    Width = 75
    Height = 25
    Caption = '&Submit'
    Default = True
    TabOrder = 0
    OnClick = btnSubmitClick
  end
  object btnCancel: TButton
    Left = 352
    Top = 336
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 137
    Caption = ' Access '
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 24
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
      Top = 72
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
      Top = 96
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
    object edtUsername: TEdit
      Left = 88
      Top = 24
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      Text = 'EDTUSERNAME'
    end
    object edtPassword: TEdit
      Left = 88
      Top = 48
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 1
      Text = 'EDTPASSWORD'
    end
    object edtMbrType: TEdit
      Left = 48
      Top = 72
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 2
      Text = 'EDTMBRTYPE'
      Visible = False
    end
    object edtStatus: TEdit
      Left = 64
      Top = 96
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 3
      Text = 'EDTSTATUS'
      Visible = False
    end
    object cboxMbrType: TComboBox
      Left = 88
      Top = 72
      Width = 129
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = 'cboxMbrType'
      OnChange = cboxMbrTypeChange
      Items.Strings = (
        'Member (M)'
        'VIP (V)'
        'Guest (G)'
        'Admin (A)')
    end
    object cboxStatus: TComboBox
      Left = 88
      Top = 96
      Width = 129
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = 'cboxStatus'
      OnChange = cboxStatusChange
      Items.Strings = (
        'Enabled'
        'Disabled')
    end
  end
  object GroupBox2: TGroupBox
    Left = 248
    Top = 8
    Width = 393
    Height = 321
    Caption = ' Personal Data '
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 24
      Width = 57
      Height = 13
      Caption = 'Full Name'
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
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Salutation'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 8
      Top = 72
      Width = 63
      Height = 13
      Caption = 'Birth Place'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 8
      Top = 96
      Width = 58
      Height = 13
      Caption = 'Birth Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 8
      Top = 120
      Width = 44
      Height = 13
      Caption = 'Card ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 8
      Top = 144
      Width = 46
      Height = 13
      Caption = 'Address'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 8
      Top = 192
      Width = 22
      Height = 13
      Caption = 'City'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 8
      Top = 216
      Width = 54
      Height = 13
      Caption = 'ZIP Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 8
      Top = 240
      Width = 73
      Height = 13
      Caption = 'Home Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label11: TLabel
      Left = 8
      Top = 264
      Width = 78
      Height = 13
      Caption = 'Mobile Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 8
      Top = 288
      Width = 71
      Height = 13
      Caption = 'Work Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtName: TEdit
      Left = 120
      Top = 24
      Width = 257
      Height = 21
      TabOrder = 0
    end
    object edtSalutation: TEdit
      Left = 120
      Top = 48
      Width = 113
      Height = 21
      TabOrder = 1
    end
    object edtBirthPlace: TEdit
      Left = 120
      Top = 72
      Width = 161
      Height = 21
      TabOrder = 2
    end
    object edtBirthDate: TEdit
      Left = 304
      Top = 96
      Width = 57
      Height = 21
      TabOrder = 3
    end
    object edtCardID: TEdit
      Left = 120
      Top = 120
      Width = 209
      Height = 21
      TabOrder = 4
    end
    object edtAddress: TEdit
      Left = 120
      Top = 144
      Width = 257
      Height = 21
      TabOrder = 5
    end
    object edtAddress2: TEdit
      Left = 120
      Top = 168
      Width = 257
      Height = 21
      TabOrder = 6
    end
    object edtCity: TEdit
      Left = 120
      Top = 192
      Width = 161
      Height = 21
      TabOrder = 7
    end
    object edtZip: TEdit
      Left = 120
      Top = 216
      Width = 113
      Height = 21
      TabOrder = 8
    end
    object edtHomePhone: TEdit
      Left = 120
      Top = 240
      Width = 161
      Height = 21
      TabOrder = 9
    end
    object edtMobilePhone: TEdit
      Left = 120
      Top = 264
      Width = 161
      Height = 21
      TabOrder = 10
    end
    object edtWorkPhone: TEdit
      Left = 120
      Top = 288
      Width = 161
      Height = 21
      TabOrder = 11
    end
    object btnBirthDate: TButton
      Left = 360
      Top = 96
      Width = 11
      Height = 17
      Caption = '!'
      TabOrder = 12
    end
    object dtpBirthDate: TDateTimePicker
      Left = 120
      Top = 96
      Width = 113
      Height = 21
      CalAlignment = dtaLeft
      Date = 36884.4501251157
      Time = 36884.4501251157
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 13
      OnChange = dtpBirthDateChange
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 152
    Width = 233
    Height = 177
    Caption = ' Historical '
    TabOrder = 4
    object Label16: TLabel
      Left = 8
      Top = 20
      Width = 81
      Height = 13
      Caption = 'Member Since'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label17: TLabel
      Left = 8
      Top = 68
      Width = 70
      Height = 13
      Caption = 'Trans Accu.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 8
      Top = 44
      Width = 85
      Height = 13
      Caption = 'Init Mem. Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtMemberSince: TEdit
      Left = 104
      Top = 20
      Width = 97
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtTrxAccu: TEdit
      Left = 104
      Top = 68
      Width = 113
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object edtInitialMemberType: TEdit
      Left = 104
      Top = 44
      Width = 97
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object btnMemberSince: TButton
      Left = 200
      Top = 24
      Width = 11
      Height = 17
      Caption = '!'
      Enabled = False
      TabOrder = 3
    end
  end
end
