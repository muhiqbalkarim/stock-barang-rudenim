object Form1: TForm1
  Left = 270
  Top = 27
  Caption = 'Stock Barang'
  ClientHeight = 624
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  DesignSize = (
    847
    624)
  TextHeight = 15
  object Label1: TLabel
    Left = 263
    Top = 29
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
    Left = 279
    Top = 79
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
    Left = 64
    Top = 592
    Width = 5
    Height = 25
    Anchors = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 702
    Top = 589
    Width = 5
    Height = 25
    Anchors = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 40
    Top = 172
    Width = 777
    Height = 423
    Anchors = []
    Caption = 'Barang Masuk'
    TabOrder = 0
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
      Left = 530
      Top = 60
      Width = 57
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 20
      Top = 61
      Width = 81
      Height = 23
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 125
      Top = 61
      Width = 244
      Height = 23
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 393
      Top = 61
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 104
      Width = 745
      Height = 303
      DataSource = DataSource1
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object Button2: TButton
      Left = 602
      Top = 60
      Width = 57
      Height = 25
      Caption = 'Perbarui'
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 672
      Top = 60
      Width = 57
      Height = 25
      Caption = 'Hapus'
      TabOrder = 6
      OnClick = Button3Click
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=stock-barang-rudenim'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvParamCreate, rvMacroCreate, rvMacroExpand]
    ResourceOptions.MacroCreate = False
    ResourceOptions.MacroExpand = False
    SQL.Strings = (
      'select * from tbbarang')
    Left = 128
    Top = 32
    object FDQuery1kode_barang: TStringField
      DisplayWidth = 11
      FieldName = 'kode_barang'
      Origin = 'kode_barang'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object FDQuery1nama_barang: TStringField
      DisplayWidth = 85
      FieldName = 'nama_barang'
      Origin = 'nama_barang'
      Required = True
      Size = 50
    end
    object FDQuery1jmlh_stock: TIntegerField
      DisplayWidth = 9
      FieldName = 'jmlh_stock'
      Origin = 'jmlh_stock'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 200
    Top = 32
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 656
    Top = 24
  end
end
