object frmSSNG: TfrmSSNG
  Left = 392
  Top = 239
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'wServer Serial Number Generator 2.00 alpha'
  ClientHeight = 307
  ClientWidth = 408
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Company Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 103
    Height = 13
    Caption = 'Customer ID (CID)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 66
    Height = 13
    Caption = 'Expiry Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 80
    Height = 13
    Caption = 'Serial Number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 280
    Width = 72
    Height = 13
    Caption = 'Date to Test'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 104
    Width = 55
    Height = 13
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCN: TEdit
    Left = 120
    Top = 8
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'DEMO VERSION'
  end
  object edtHDD: TEdit
    Left = 120
    Top = 32
    Width = 281
    Height = 21
    TabOrder = 1
  end
  object edtDate: TEdit
    Left = 120
    Top = 56
    Width = 177
    Height = 21
    TabOrder = 2
    Text = 'edtDate'
  end
  object btnGenerate: TButton
    Left = 320
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Generate'
    Default = True
    TabOrder = 3
    OnClick = btnGenerateClick
  end
  object btnGetHDD: TButton
    Left = 240
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Get CID'
    TabOrder = 4
    OnClick = btnGetHDDClick
  end
  object btnTest: TButton
    Left = 320
    Top = 272
    Width = 75
    Height = 25
    Caption = '&Test'
    TabOrder = 5
    OnClick = btnTestClick
  end
  object edtSN: TEdit
    Left = 120
    Top = 80
    Width = 281
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = 'edtSN'
  end
  object Memo1: TMemo
    Left = 8
    Top = 144
    Width = 385
    Height = 121
    Lines.Strings = (
      'Memo1')
    TabOrder = 7
  end
  object DateTimePicker1: TDateTimePicker
    Left = 128
    Top = 272
    Width = 186
    Height = 21
    CalAlignment = dtaLeft
    Date = 36886.6275300926
    Time = 36886.6275300926
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
  end
  object DateTimePicker2: TDateTimePicker
    Left = 304
    Top = 56
    Width = 98
    Height = 21
    CalAlignment = dtaLeft
    Date = 36886.6275300926
    Time = 36886.6275300926
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 9
    OnChange = DateTimePicker2Change
  end
  object edtPassword: TEdit
    Left = 120
    Top = 104
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 10
  end
end
