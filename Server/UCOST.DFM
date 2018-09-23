object frmCost: TfrmCost
  Left = 136
  Top = 127
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cost Table Maintenance'
  ClientHeight = 264
  ClientWidth = 570
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
  object dbgCost: TDBGrid
    Left = 8
    Top = 8
    Width = 457
    Height = 249
    Cursor = crHandPoint
    DataSource = dsCost
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgCostDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'System UID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MBRTYPE'
        Title.Caption = 'Member Type'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRXTYPE'
        Title.Caption = 'Trans. Type'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRXCOST'
        Title.Caption = 'Cost'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRXDESC'
        Title.Caption = 'Description'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRXMINCOST'
        Title.Caption = 'Minimum Cost'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRXFREECOST'
        Title.Caption = 'Write Off'
        Visible = True
      end>
  end
  object btnEdit: TButton
    Left = 480
    Top = 48
    Width = 75
    Height = 25
    Caption = '&Edit'
    TabOrder = 1
    OnClick = btnEditClick
  end
  object btnAdd: TButton
    Left = 480
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 480
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Delete'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnExit: TButton
    Left = 480
    Top = 224
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'E&xit'
    TabOrder = 4
    OnClick = btnExitClick
  end
  object btnRefresh: TButton
    Left = 480
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Refresh'
    TabOrder = 5
    OnClick = btnRefreshClick
  end
  object tblCost: TTable
    AutoRefresh = True
    DatabaseName = 'wdb_s_cost'
    IndexFieldNames = 'ID'
    TableName = 'MS_COST'
    Left = 368
    Top = 144
  end
  object dsCost: TDataSource
    DataSet = tblCost
    Left = 384
    Top = 128
  end
  object dbCost: TDatabase
    AliasName = 'wServer'
    Connected = True
    DatabaseName = 'wdb_s_cost'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 392
    Top = 152
  end
end
