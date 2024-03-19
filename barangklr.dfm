object FBarangkeluar: TFBarangkeluar
  Left = 0
  Top = 0
  Caption = 'Barang Keluar'
  ClientHeight = 687
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    818
    687)
  TextHeight = 15
  object Label1: TLabel
    Left = 241
    Top = 32
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
    ExplicitLeft = 246
    ExplicitTop = 29
  end
  object Label2: TLabel
    Left = 257
    Top = 84
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
    ExplicitLeft = 262
    ExplicitTop = 79
  end
  object Label6: TLabel
    Left = 48
    Top = 654
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
    ExplicitLeft = 49
  end
  object Label7: TLabel
    Left = 660
    Top = 654
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
    ExplicitLeft = 669
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 197
    Width = 777
    Height = 451
    Anchors = []
    Caption = 'Barang Keluar'
    TabOrder = 0
    ExplicitLeft = 12
    ExplicitTop = 186
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
    object Label8: TLabel
      Left = 473
      Top = 40
      Width = 50
      Height = 15
      Caption = 'Penerima'
    end
    object Button1: TButton
      Left = 632
      Top = 60
      Width = 115
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
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
      Height = 337
      DataSource = DataSource1
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object Edit4: TEdit
      Left = 473
      Top = 61
      Width = 136
      Height = 23
      TabOrder = 4
    end
    object ComboBox1: TComboBox
      Left = 125
      Top = 61
      Width = 244
      Height = 23
      TabOrder = 5
      TextHint = 'Silahkan Pilih Barang'
      OnChange = ComboBox1Change
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 728
    Top = 40
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=stock-barang-rudenim'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 56
    Top = 32
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from tbbarangklr')
    Left = 136
    Top = 64
    object FDQuery1kd_brg: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Kode Barang'
      FieldName = 'kd_brg'
      Origin = 'kd_brg'
      Required = True
      Size = 10
    end
    object FDQuery1nama_barang: TStringField
      DisplayLabel = 'Nama Barang'
      FieldName = 'nama_barang'
      Origin = 'nama_barang'
      Required = True
      Size = 50
    end
    object FDQuery1jumlah_keluar: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Jumlah Keluar'
      FieldName = 'jumlah_keluar'
      Origin = 'jumlah_keluar'
      Required = True
    end
    object FDQuery1penerima: TStringField
      Alignment = taCenter
      DisplayLabel = 'Penerima'
      FieldName = 'penerima'
      Origin = 'penerima'
      Required = True
      Size = 15
    end
    object FDQuery1tanggal_transaksi: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Tanggal Transaksi'
      FieldName = 'tanggal_transaksi'
      Origin = 'tanggal_transaksi'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 56
    Top = 96
  end
end
