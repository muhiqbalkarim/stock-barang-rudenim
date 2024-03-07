unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TFLogin = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses Unit1;

procedure TFLogin.Button1Click(Sender: TObject);
var
  MainForm: TFBarangmasuk;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') then
begin
  MessageDlg('Username dan Password Tidak Boleh Kosong', mtWarning, [mbOK], 0);
  Edit1.SetFocus;
  Exit;
end;

  FDQuery1.SQL.Text := 'SELECT * FROM login WHERE username =:username AND pass =:password';
  FDQuery1.ParamByName('username').AsString := Edit1.Text;
  FDQuery1.ParamByName('password').AsString := Edit2.Text;
try
    FDQuery1.Open;
    if not FDQuery1.IsEmpty then
    begin
      MessageDlg('Login Berhasil!', mtInformation, [mbOK], 0);

      MainForm := TFBarangmasuk.Create(Application);
      try
        MainForm.ShowModal;
      finally
        MainForm.Free;
      end;

      // Add further actions for a successful login if needed.
    end
    else
    begin
      MessageDlg('Username dan Password Salah!', mtError, [mbOK], 0);
      Edit1.SetFocus;
    end;
  finally
    FDQuery1.Close;
  end;
end;

procedure TFLogin.Button2Click(Sender: TObject);
begin
close;
end;

procedure TFLogin.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
begin
  Edit2.PasswordChar:=#0
  end else
  Edit2.PasswordChar:=#149
end;


procedure TFLogin.FormCreate(Sender: TObject);
begin
  Edit1.TabOrder :=0;
  Edit2.TabOrder :=1;
  Button1.TabOrder := 3;
  Button2.TabOrder := 4;
  CheckBox1.TabOrder := 2;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
  Edit2.PasswordChar:=#149;
end;

end.
