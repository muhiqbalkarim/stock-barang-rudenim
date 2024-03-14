object FBarangmasuk: TFBarangmasuk
  Left = 0
  Top = 0
  Caption = 'Stock Barang Masuk'
  ClientHeight = 671
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  DesignSize = (
    832
    671)
  TextHeight = 15
  object Label1: TLabel
    Left = 242
    Top = 31
    Width = 325
    Height = 54
    Anchors = []
    Caption = 'Stock ATK Umum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 273
    ExplicitTop = 33
  end
  object Label2: TLabel
    Left = 258
    Top = 82
    Width = 291
    Height = 28
    Anchors = []
    Caption = 'Rumah Detensi Imigrasi Makassar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 289
    ExplicitTop = 85
  end
  object Label6: TLabel
    Left = 42
    Top = 640
    Width = 34
    Height = 25
    Anchors = []
    Caption = 'Jam'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 45
  end
  object Label7: TLabel
    Left = 674
    Top = 640
    Width = 67
    Height = 25
    Anchors = []
    Caption = 'Tanggal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 686
  end
  object GroupBox1: TGroupBox
    Left = 19
    Top = 188
    Width = 777
    Height = 446
    Anchors = []
    Caption = 'Barang Masuk'
    TabOrder = 0
    ExplicitLeft = 17
    ExplicitTop = 187
    object Label3: TLabel
      Left = 20
      Top = 40
      Width = 67
      Height = 15
      Caption = 'Kode Barang'
    end
    object Label4: TLabel
      Left = 125
      Top = 40
      Width = 72
      Height = 15
      Caption = 'Nama Barang'
    end
    object Label5: TLabel
      Left = 393
      Top = 40
      Width = 38
      Height = 15
      Caption = 'Jumlah'
    end
    object Button1: TButton
      Left = 472
      Top = 60
      Width = 275
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 20
      Top = 61
      Width = 81
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 393
      Top = 61
      Width = 56
      Height = 23
      TabOrder = 2
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 104
      Width = 745
      Height = 303
      DataSource = DataSource1
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object Button2: TButton
      Left = 690
      Top = 413
      Width = 57
      Height = 25
      Caption = 'Simpan'
      TabOrder = 4
    end
    object Edit2: TEdit
      Left = 125
      Top = 61
      Width = 244
      Height = 23
      TabOrder = 5
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 704
    Top = 40
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=stock-barang-rudenim'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 32
    Top = 32
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from tbbarangmsk')
    Left = 112
    Top = 40
    object FDQuery1kd_brg: TStringField
      FieldName = 'kd_brg'
      Origin = 'kd_brg'
      Required = True
      Size = 10
    end
    object FDQuery1jumlah_stok: TIntegerField
      FieldName = 'jumlah_stok'
      Origin = 'jumlah_stok'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 48
    Top = 104
  end
end
