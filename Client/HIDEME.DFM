object frmHideMe: TfrmHideMe
  Left = 146
  Top = 232
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Screen are Locked'
  ClientHeight = 313
  ClientWidth = 744
  Color = clBlack
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Courier New'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 688
    Height = 16
    Caption = 
      'Untuk dapat menggunakan PC ini, mintalah kepada Operator untuk m' +
      'embuka LOCK di server.'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 24
    Width = 128
    Height = 16
    Caption = 'Terima Kasih ...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
end
