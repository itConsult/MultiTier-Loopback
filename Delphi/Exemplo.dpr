program Exemplo;

uses
  Vcl.Forms,
  SysUtils,
  Controls,
  Main in 'Main.pas' {frmMain},
  uConnect in 'Units\uConnect.pas',
  Configuracao in 'Configuracao.pas' {frmConfiguracao},
  uCidade in 'Units\uCidade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  if Trim(Cfg.Endereco) = '' then
  begin
    with TfrmConfiguracao.Create(nil) do
    try
      if ShowModal = mrOK then
      begin
        Application.CreateForm(TfrmMain, frmMain);
  Close;
      end
      else
        Application.Terminate;
    finally
      Free;
    end;
  end
  else
    Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
