unit barangmsk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFBarangmasuk = class(TForm)
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
    Timer1: TTimer;
    Edit2: TEdit;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1kd_brg: TStringField;
    FDQuery1jumlah_stok: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBarangmasuk: TFBarangmasuk;

implementation

{$R *.dfm}

uses stockbarang;

procedure TFBarangmasuk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Clear all input fields
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';

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

procedure TFBarangmasuk.Timer1Timer(Sender: TObject);
begin
  Label6.Caption:= TimeToStr(now);
  Label7.Caption:= DateToStr(now);
end;

end.
