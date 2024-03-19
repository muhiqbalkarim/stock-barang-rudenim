unit stockbarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TFStockbarang = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1nama_barang: TStringField;
    FDQuery1jmlh_stock: TIntegerField;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    Label6: TLabel;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    BarangMasuk1: TMenuItem;
    BarangMasuk2: TMenuItem;
    Laporan1: TMenuItem;
    Laporan2: TMenuItem;
    BarangKeluar1: TMenuItem;
    FDQuery1kd_brg: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Laporan2Click(Sender: TObject);
    procedure BarangKeluar1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure BarangMasuk2Click(Sender: TObject);
    procedure BarangMasuk1Click(Sender: TObject);
  private
    { Private declarations }
    AddAttemptCounter: Integer;
  public
    { Public declarations }
    function GetAvailableStock: TStringList;
    function JumlahStock(const KodeBarang: string): Integer;
    function BuildNameToCodeMapping: TStringList;
  end;

var
  FStockbarang: TFStockbarang;

implementation

{$R *.dfm}

uses barangmsk, barangklr, lpbarangklr, lpbarangmsk;

procedure TFStockbarang.BarangKeluar1Click(Sender: TObject);
begin
  FLaporankeluar.Show;
end;

procedure TFStockbarang.BarangMasuk1Click(Sender: TObject);
begin
  FBarangmasuk.Show;
  Hide;
end;

procedure TFStockbarang.BarangMasuk2Click(Sender: TObject);
begin
  FBarangkeluar.Show;
  Hide;
end;

procedure TFStockbarang.Button1Click(Sender: TObject);
var
JumlahStock : Integer;
begin
  if Edit1.Text = '' then
begin
  MessageDlg('Kode Barang tidak boleh kosong', mtInformation, [mbOK], 0);
  Edit1.SetFocus;
end else
if Edit2.Text = '' then
begin
  MessageDlg('Nama Barang tidak boleh kosong', mtInformation, [mbOK], 0);
  Edit2.SetFocus;
end else
if Edit3.Text = '' then
begin
  MessageDlg('Jumlah Barang tidak boleh kosong', mtInformation, [mbOK], 0);
  Edit3.SetFocus;
end else
begin
  if not TryStrToInt(Edit3.Text, JumlahStock) then
  begin
    MessageDlg('Jumlah barang harus dalam bentuk angka saja', mtWarning, [mbOK], 0);
    Edit3.SetFocus;
  end else
begin
try
if FDQuery1.Locate('kd_brg', Edit1.Text, []) then
begin
  Inc(AddAttemptCounter);
  if AddAttemptCounter >=3 then
  begin
    MessageDlg('Jika ingin memperbarui data, Silahkan klik tombol perbarui', mtWarning, [mbOK], 0);
    AddAttemptCounter:=0;
    Button2.SetFocus;
    Exit;
  end else
  begin
    MessageDlg('Kode Barang sudah ada!', mtError, [mbOK], 0);
    FDQuery1.Cancel;
    Edit1.SetFocus;
    Exit;
  end;
  end;
    FDQuery1.Append;
    FDQuery1.FieldByName('kd_brg') .AsString:=Edit1.Text;
    FDQuery1.FieldByName('nama_barang') .AsString:= Edit2.Text;
    FDQuery1.FieldByName('jmlh_stock') .AsInteger := JumlahStock;
    FDQuery1.Post;

    MessageDlg('Data berhasil disimpan', mtInformation, [mbOK], 0);
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    Edit1.SetFocus;

    AddAttemptCounter := 0;
  Except
  on E: EDatabaseError do
  begin
    MessageDlg('Kode Barang sudah ada!', mtError, [mbOK], 0);
    FDQuery1.Cancel;
    Edit1.SetFocus;
    end;
  end;
end;
end;
end;

procedure TFStockbarang.Button2Click(Sender: TObject);
var
JumlahStock : Integer;
begin
  if Edit1.Text = '' then
begin
  MessageDlg('Kode Barang tidak boleh kosong', mtInformation, [mbOK], 0);
  Edit1.SetFocus;
end else
if Edit2.Text = '' then
begin
  MessageDlg('Nama Barang tidak boleh kosong', mtInformation, [mbOK], 0);
  Edit2.SetFocus;
end else
if Edit3.Text = '' then
begin
  MessageDlg('Jumlah Barang tidak boleh kosong', mtInformation, [mbOK], 0);
  Edit3.SetFocus;
end else
if not TryStrToInt(Edit3.Text, JumlahStock) then
begin
  MessageDlg('Silahkan memasukkan angka yang benar!', mtWarning, [mbOK], 0);
  Edit3.SetFocus;
end else
begin
    FDQuery1.Edit;
    FDQuery1.FieldByName('kd_brg') .AsString:=Edit1.Text;
    FDQuery1.FieldByName('nama_barang') .AsString:= Edit2.Text;
    FDQuery1.FieldByName('jmlh_stock') .AsInteger := StrToInt(Edit3.Text);
    FDQuery1.Post;
    MessageDlg('Data berhasil diperbarui', mtInformation, [mbOK], 0);
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    Edit1.SetFocus;
  end;
end;

procedure TFStockbarang.Button3Click(Sender: TObject);
var
  Confirmation : Boolean;
begin
  if FDQuery1.RecordCount <=0 then
  MessageDlg('Pilih data terlebih dahulu!', mtWarning, [mbOK], 0) else
begin
  Confirmation := MessageDlg('Apakah anda yakin ingin menghapus data?', mtConfirmation, mbYesNo, 0) = mrYes;
  if Confirmation then
begin
  FDQuery1.Delete;
  MessageDlg('Data berhasil dihapus', mtInformation, [mbOK], 0);
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit1.SetFocus;
end;
end;
end;

procedure TFStockbarang.DBGrid1CellClick(Column: TColumn);
begin
if not FDQuery1.IsEmpty then
begin
  Edit1.Text := FDQuery1.FieldByName('kd_brg').AsString;
  Edit2.Text := FDQuery1.FieldByName('nama_barang').AsString;
  Edit3.Text := IntToStr(FDQuery1.FieldByName('jmlh_stock').AsInteger);
end;
end;

procedure TFStockbarang.FormClose(Sender: TObject; var Action: TCloseAction);
var
  myYes, myNo: TMsgDlgBtn;
  myButs: TMsgDlgButtons;
begin
  myYes:= mbOK;
  myNo:= mbCancel;
  myButs:= [myYes, myNo];
  if MessageDlg('Anda yakin ingin keluar ?', mtWarning, myButs, 0) = mrOk then
begin
  if Assigned(FBarangkeluar) then
    FBarangkeluar.Hide;
    Action := caFree;
    Application.Terminate;
  end else
    Action := caNone;
end;

procedure TFStockbarang.FormCreate(Sender: TObject);
begin
AddAttemptCounter := 0;
end;

procedure TFStockbarang.Laporan2Click(Sender: TObject);
begin
  FLaporanmasuk.Show;
end;

procedure TFStockbarang.Timer1Timer(Sender: TObject);
begin
  Label6.Caption:= TimeToStr(now);
  Label7.Caption:= DateToStr(now);
end;

function TFStockbarang.JumlahStock(const KodeBarang: string): Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FDConnection1;
    Query.SQL.Text := 'SELECT jmlh_stock FROM stock_barang WHERE kd_brg = :KodeBarang';
    Query.ParamByName('KodeBarang').AsString := KodeBarang;
    Query.Open;
    if not Query.IsEmpty then
      Result := Query.FieldByName('jmlh_stock').AsInteger
    else
      Result := 0; // or any default value indicating stock not found
  finally
    Query.Free;
  end;
end;

function TFStockbarang.GetAvailableStock: TStringList;
var
  StockList: TStringList;
  i: Integer;
begin
  StockList := TStringList.Create;
  try
    // Loop through the dataset to get available stocks
    FDQuery1.First;
    while not FDQuery1.EOF do
    begin
      if FDQuery1.FieldByName('jmlh_stock').AsInteger > 0 then
        StockList.Add(FDQuery1.FieldByName('nama_barang').AsString);
      FDQuery1.Next;
    end;
  except
    StockList.Free;
    raise;
  end;
  Result := StockList;
end;

function TFStockbarang.BuildNameToCodeMapping: TStringList;
var
  MappingList: TStringList;
begin
  MappingList := TStringList.Create;
  try
    // Loop through the dataset to build the mapping
    FDQuery1.First;
    while not FDQuery1.EOF do
    begin
      MappingList.Values[FDQuery1.FieldByName('nama_barang').AsString] := FDQuery1.FieldByName('kd_brg').AsString;
      FDQuery1.Next;
    end;
  except
    MappingList.Free;
    raise;
  end;
  Result := MappingList;
end;

end.
