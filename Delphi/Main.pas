unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, uConnect, uCidade;

type
  TfrmMain = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
var
  Cidades: TCidadesFactory;
  Cidade: TCidade;
begin
  Cidade := TCidade.Create;
  Cidade.Nome := 'Itapejara D Oeste';
  Cidade.Estado := 'PR';
  Cidade := TCidadesFactory.Create.Upsert(Cidade);


  ShowMessage(IntToStr(Cidade.ID));
  Cidades := TCidadesFactory.Create;
  ShowMessage(Cidades.Get[3].Nome);
end;

end.
