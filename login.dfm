object FLogin: TFLogin
  Left = 0
  Top = 0
  ActiveControl = Button1
  Anchors = []
  BorderStyle = bsNone
  Caption = 'Login'
  ClientHeight = 369
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    337
    369)
  TextHeight = 15
  object Label1: TLabel
    Left = 13
    Top = 94
    Width = 311
    Height = 19
    Anchors = []
    Caption = 'Silahkan LOGIN terlebih dahulu untuk melanjutkan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 38
    Top = 147
    Width = 257
    Height = 36
    Alignment = taCenter
    Anchors = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Username'
  end
  object Button1: TButton
    Left = 38
    Top = 273
    Width = 257
    Height = 41
    Anchors = []
    Caption = 'LOGIN'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 38
    Top = 320
    Width = 257
    Height = 41
    Anchors = []
    Caption = 'KELUAR'
    TabOrder = 2
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 48
    Top = 239
    Width = 151
    Height = 17
    Caption = 'Tampilkan Password ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object Edit2: TEdit
    Left = 38
    Top = 189
    Width = 257
    Height = 36
    Alignment = taCenter
    Anchors = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TextHint = 'Password'
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Database=stock-barang-rudenim'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 32
    Top = 8
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from login')
    Left = 112
    Top = 8
  end
end
