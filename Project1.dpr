program Project1;

uses
  Vcl.Forms,
  stockbarang in 'stockbarang.pas' {FStockbarang},
  login in 'login.pas' {FLogin},
  lpbarangmsk in 'lpbarangmsk.pas' {FLaporanmasuk},
  lpbarangklr in 'lpbarangklr.pas' {FLaporankeluar},
  barangklr in 'barangklr.pas' {FBarangkeluar},
  StockUtils in 'StockUtils.pas',
  barangmsk in 'barangmsk.pas' {FBarangmasuk};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFStockbarang, FStockbarang);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFBarangkeluar, FBarangkeluar);
  Application.CreateForm(TFLaporanmasuk, FLaporanmasuk);
  Application.CreateForm(TFLaporankeluar, FLaporankeluar);
  Application.CreateForm(TFBarangmasuk, FBarangmasuk);
  Application.Run;
end.
