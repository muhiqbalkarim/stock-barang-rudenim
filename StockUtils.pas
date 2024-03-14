unit StockUtils;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

type
  TStockUtils = class
  public
    class procedure DecreaseStock(FDQuery: TFDQuery; FDConnection: TFDConnection;
      const AKodeBarang: string; AJumlahKeluar: Integer);
  end;

implementation

class procedure TStockUtils.DecreaseStock(FDQuery: TFDQuery; FDConnection: TFDConnection;
  const AKodeBarang: string; AJumlahKeluar: Integer);
begin
  try
    FDQuery.SQL.Text := 'UPDATE stock_barang SET jmlh_stock = jmlh_stock - :jumlah_keluar WHERE kd_brg = :kode_barang';
    FDQuery.ParamByName('jumlah_keluar').AsInteger := AJumlahKeluar;
    FDQuery.ParamByName('kode_barang').AsString := AKodeBarang;
    FDQuery.ExecSQL;
    FDConnection.Commit;
  except
    // Handle exceptions, if any
    on E: Exception do
      raise Exception.Create('Error decreasing stock: ' + E.Message);
  end;
end;

end.

