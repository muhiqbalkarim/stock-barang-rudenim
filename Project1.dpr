program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FBarangmasuk},
  Unit2 in 'Unit2.pas' {FLogin},
  Unit3 in 'Unit3.pas' {FLaporanmasuk},
  Unit4 in 'Unit4.pas' {FLaporankeluar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFBarangmasuk, FBarangmasuk);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFLaporanmasuk, FLaporanmasuk);
  Application.CreateForm(TFLaporankeluar, FLaporankeluar);
  Application.Run;
end.
