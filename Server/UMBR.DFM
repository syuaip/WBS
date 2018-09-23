object frmMember: TfrmMember
  Left = 175
  Top = 208
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Member Maintenance'
  ClientHeight = 433
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgMember: TDBGrid
    Left = 8
    Top = 8
    Width = 617
    Height = 417
    Cursor = crHandPoint
    DataSource = dsMember
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgMemberDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'System UID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USERNAME'
        Title.Caption = 'User Name'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEMBERTYPE'
        Title.Caption = 'Member Type'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALUTATION'
        Title.Caption = 'Salutation'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = 'Full Name'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEMBERSINCE'
        Title.Caption = 'Mbr. Since'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARDID'
        Title.Caption = 'Card ID'
        Width = 80
        Visible = True
      end>
  end
  object btnEdit: TButton
    Left = 640
    Top = 48
    Width = 75
    Height = 25
    Caption = '&Edit'
    TabOrder = 1
    OnClick = btnEditClick
  end
  object btnAdd: TButton
    Left = 640
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 640
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Delete'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnExit: TButton
    Left = 640
    Top = 392
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'E&xit'
    TabOrder = 4
    OnClick = btnExitClick
  end
  object btnRefresh: TButton
    Left = 640
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Refresh'
    TabOrder = 5
    OnClick = btnRefreshClick
  end
  object tblMember: TTable
    AutoRefresh = True
    DatabaseName = 'wdb_s_mbr'
    IndexFieldNames = 'ID'
    TableName = 'MS_MEMBER'
    Left = 368
    Top = 144
  end
  object dsMember: TDataSource
    DataSet = tblMember
    Left = 384
    Top = 128
  end
  object dbMember: TDatabase
    AliasName = 'wServer'
    DatabaseName = 'wdb_s_mbr'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 392
    Top = 152
  end
end
