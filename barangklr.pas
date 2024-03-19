unit barangklr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFBarangkeluar = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Timer1: TTimer;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    FDQuery1kd_brg: TStringField;
    FDQuery1nama_barang: TStringField;
    FDQuery1jumlah_keluar: TIntegerField;
    FDQuery1penerima: TStringField;
    FDQuery1tanggal_transaksi: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure PopulateComboBox;
    function JumlahStockFromDatabase(const KodeBarang: string): Integer;
  public
    { Public declarations }
  end;

var
  FBarangkeluar: TFBarangkeluar;

implementation

{$R *.dfm}

uses stockbarang;

procedure TFBarangkeluar.Button1Click(Sender: TObject);
var
  NamaBarang, KodeBarang, Penerima: string;
  JumlahKeluar, StockTersedia: Integer;
begin
  // Validate input
  if (ComboBox1.ItemIndex = -1) or (Edit3.Text = '') or (Edit4.Text = '') then
  begin
    MessageDlg('Silahkan mengisi data yang diperlukan terlebih dahulu.', mtWarning, [mbOK], 0);
    Exit;
  end;

  // Get selected stock information
  NamaBarang := ComboBox1.Text; // Get the selected item's name
  KodeBarang := Edit1.Text;
  Penerima := Edit4.Text; // Assuming Edit4 contains the name of the recipient
  JumlahKeluar := StrToInt(Edit3.Text);

  // Check if the requested quantity exceeds the available stock
  StockTersedia := FStockbarang.JumlahStock(KodeBarang);
  if JumlahKeluar > StockTersedia then
  begin
    MessageDlg('Jumlah yang diminta melebihi stok yang tersedia.', mtWarning, [mbOK], 0);
    Exit;
  end;

  // Insert data into the database table
  try
    FDConnection1.ExecSQL('INSERT INTO tbbarangklr (nama_barang, kd_brg, penerima, jumlah_keluar, tanggal_transaksi) ' +
                          'VALUES (:nama_barang, :kd_brg, :penerima, :jumlah_keluar, :tanggal_transaksi)',
    [NamaBarang, KodeBarang, Penerima, JumlahKeluar, Now]);


    // Decrease stock in the tbbarang table
    //TStockUtils.DecreaseStock(FDQuery1, FDConnection1, KodeBarang, JumlahKeluar);

    // Commit the transaction
    FDConnection1.Commit;

    // Show a message indicating success
    MessageDlg('Data berhasil dimasukkan.', mtInformation, [mbOK], 0);

     // Refresh the dataset bound to DBGrid1
    FDQuery1.Close;
    FDQuery1.Open;

    // Clear input fields
    Edit1.Text := '';
    ComboBox1.ItemIndex := -1;
    Edit3.Text := '';
    Edit4.Text := '';

    // Refresh the DBGrid in FStockbarang
    FStockbarang.FDQuery1.Close;
    FStockbarang.FDQuery1.Open;

    // Populate the ComboBox again
    PopulateComboBox;

    // Set focus back to ComboBox1
    ComboBox1.SetFocus;
  except
    // Handle exceptions, if any
    on E: Exception do
      MessageDlg('Error: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFBarangkeluar.ComboBox1Change(Sender: TObject);
var
  NameToCodeMapping: TStringList;
begin
  NameToCodeMapping := FStockbarang.BuildNameToCodeMapping;
  try
    // Retrieve the item code based on the selected item name
    Edit1.Text := NameToCodeMapping.Values[ComboBox1.Text];
  finally
    NameToCodeMapping.Free;
  end;
end;

procedure TFBarangkeluar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Clear all input fields
  Edit1.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  ComboBox1.ItemIndex := -1; // Reset the ComboBox selection to no item selected

  // Set focus to Button1
  Button1.SetFocus;

  // Hide the form
  SendToBack;
  Hide;

  // Show the main form (FBarangmasuk)
begin
  SendToBack;
  Hide;
  if Assigned(FStockbarang) then
    begin
      FStockbarang.Show;
      FStockbarang.BringToFront;
    end;
end;
end;

procedure TFBarangkeluar.FormShow(Sender: TObject);
begin
 PopulateComboBox;
end;

procedure TFBarangkeluar.PopulateComboBox;
var
  AvailableStock: TStringList;
  i: Integer;
begin
  ComboBox1.Items.Clear;
  AvailableStock := FStockbarang.GetAvailableStock;
  try
    for i := 0 to AvailableStock.Count - 1 do
      ComboBox1.Items.Add(AvailableStock[i]);
  finally
    AvailableStock.Free;
  end;
end;

procedure TFBarangkeluar.Timer1Timer(Sender: TObject);
begin
  Label6.Caption:= TimeToStr(now);
  Label7.Caption:= DateToStr(now);
end;

function TFBarangkeluar.JumlahStockFromDatabase(const KodeBarang: string): Integer;
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

end.
