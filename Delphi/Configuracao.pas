unit Configuracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uConnect;

type
  TfrmConfiguracao = class(TForm)
    Label1: TLabel;
    edtEndereco: TEdit;
    edtPorta: TEdit;
    Label2: TLabel;
    btnOK: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

{$R *.dfm}

procedure TfrmConfiguracao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmConfiguracao.btnOKClick(Sender: TObject);
begin
  Cfg.Endereco := edtEndereco.Text;
  Cfg.Porta := StrToIntDef(edtPorta.Text,80);
  ModalResult := mrOK;
end;

procedure TfrmConfiguracao.FormCreate(Sender: TObject);
begin
  edtEndereco.Text := Cfg.Endereco;
  edtPorta.Text := IntToStr(Cfg.Porta);
end;

end.
