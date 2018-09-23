object frmRegister: TfrmRegister
  Left = 346
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Register'
  ClientHeight = 177
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    00008000800080800000C0C0C000808080000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00666666666666666666666666666666666666
    6666666666666666666666666666666666666666666666666666666666666666
    6BBBBBBBBBBBBBBBBBBBBBB666666666BBBBBBBBBBBBBBBBBBBBBBBB6666666B
    BBBBBBBBBBBBBBBBBBBBBBBBB666666BBBBBBBBBBBBBBBBBBBBBBBBBB666666B
    BBBBBBBBBBBBBBBBBBBBBBBBB666666BBBBBBBBBBBBBBBBBBBBBBBBBB666666B
    BBBBBBBBBBBBBCCBBBBBBBBBB666666BBBBBBBBBBBBBBCCBBBBBBBBBB666666B
    BBBBBBBBBBBBBCCBBBBBBBBBB666666BBBBBCCBBBBCCBCCCCCCBBBBBB666666B
    BBBBCCBBBCCBBCCBBBCCBBBBB666666BBBBBCCBBCCBBBCCBBBCCBBBBB666666B
    BBBBCCBCCBBBBCCBBBCCBBBBB666666BBBBBCCCCCCBBBCCBBBCCBBBBB666666B
    BBBBCCBBBCCBBCCCBBCCBBBBB666666BBBBBCCBBBCCBBCCBCCCBBBBBB666666B
    BBBBCCBBBCCBBBBBBBBBBBBBB666666BBBBBCCCCCCBBBBBBBBBBBBBBB666666B
    BBBBBBBBBBBBBBBBBBBBBBBBB666666BBBBBBBBBBBBBBBBBBBBBBBBBB666666B
    BBBBBBBBBBBBBBBBBBBBBBBBB666666BBBBBBBBBBBBBBBBBBBBBBBBBB666666B
    BBBBBBBBBBBBBBBBBBBBBBBBB666666BBBBBBBBBBBBBBBBBBBBBBBBBB6666666
    BBBBBBBBBBBBBBBBBBBBBBBB666666666BBBBBBBBBBBBBBBBBBBBBB666666666
    6666666666666666666666666666666666666666666666666666666666666666
    6666666666666666666666666666000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    000000808000800000008000800080800000C0C0C000808080000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0066666666666666666666
    666666666666666BBBBBBBBBB66666BBBBBBBCBBBB6666BBBBBBBCBBBB6666BC
    BBBCBCCCBB6666BCBBCBBCBBCB6666BCBCBBBCBBCB6666BCCCCBBCBBCB6666BC
    BBBCBCCCBB6666BCBBBCBBBBBB6666BCCCCBBBBBBB6666BBBBBBBBBBBB66666B
    BBBBBBBBB6666666666666666666666666666666666600000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 292
    Height = 26
    Caption = 
      'To use wServer legally, please register by entering the followin' +
      'g fields below :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 96
    Height = 13
    Caption = 'Company Name :'
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
    Width = 78
    Height = 13
    Caption = 'Customer ID :'
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
    Width = 88
    Height = 13
    Caption = 'Serial Number :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object edtCN: TEdit
    Left = 112
    Top = 48
    Width = 201
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'YOUR COMPANY NAME'
  end
  object edtCID: TEdit
    Left = 112
    Top = 80
    Width = 201
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'Customer ID'
  end
  object edtSN: TEdit
    Left = 112
    Top = 112
    Width = 201
    Height = 21
    TabOrder = 2
  end
  object btnRegister: TButton
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    Caption = '&Register'
    Default = True
    TabOrder = 3
    OnClick = btnRegisterClick
  end
  object btnClose: TButton
    Left = 192
    Top = 144
    Width = 121
    Height = 25
    Cancel = True
    Caption = 'Continue &Unregistered'
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object btnGetSN: TButton
    Left = 88
    Top = 144
    Width = 97
    Height = 25
    Caption = 'Get Serial Number'
    TabOrder = 5
    OnClick = btnGetSNClick
  end
  object dbSetup: TDatabase
    AliasName = 'wServer'
    DatabaseName = 'wserver_db_setup'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 280
  end
  object tblSetup: TTable
    DatabaseName = 'wserver_db_setup'
    TableName = 'MS_SETUP'
    Left = 256
    Top = 16
  end
  object dsSetup: TDataSource
    DataSet = tblSetup
    Left = 280
    Top = 24
  end
end
