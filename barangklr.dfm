object FBarangkeluar: TFBarangkeluar
  Left = 0
  Top = 0
  Caption = 'Stock Barang Keluar'
  ClientHeight = 653
  ClientWidth = 822
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
    822
    653)
  TextHeight = 15
  object Label1: TLabel
    Left = 228
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
    Left = 244
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
    Left = 41
    Top = 623
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
    ExplicitTop = 640
  end
  object Label7: TLabel
    Left = 648
    Top = 623
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
    ExplicitTop = 640
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 177
    Width = 777
    Height = 446
    Anchors = []
    Caption = 'Barang Keluar'
    TabOrder = 0
    ExplicitLeft = 9
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
    object Edit4: TEdit
      Left = 473
      Top = 61
      Width = 136
      Height = 23
      TabOrder = 5
    end
    object ComboBox1: TComboBox
      Left = 125
      Top = 61
      Width = 244
      Height = 23
      TabOrder = 6
      TextHint = 'Silahkan Pilih Barang'
      OnChange = ComboBox1Change
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
      'select * from tbbarangklr')
    Left = 104
    Top = 32
    object FDQuery1kd_brg: TStringField
      FieldName = 'kd_brg'
      Origin = 'kd_brg'
      Required = True
      Size = 10
    end
    object FDQuery1nama_barang: TStringField
      FieldName = 'nama_barang'
      Origin = 'nama_barang'
      Required = True
      Size = 50
    end
    object FDQuery1jumlah_keluar: TIntegerField
      FieldName = 'jumlah_keluar'
      Origin = 'jumlah_keluar'
      Required = True
    end
    object FDQuery1penerima: TStringField
      FieldName = 'penerima'
      Origin = 'penerima'
      Required = True
      Size = 15
    end
    object FDQuery1tanggal_transaksi: TDateTimeField
      FieldName = 'tanggal_transaksi'
      Origin = 'tanggal_transaksi'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 176
    Top = 32
  end
end
