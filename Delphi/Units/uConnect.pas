unit uConnect;

interface
uses IniFiles,Forms,SysUtils,JSON,REST.Client,REST.Types;

type
  TCfgConnect = class(TIniFile)
  private
    function GetEndereco: String;
    function GetPorta: Integer;
    procedure SetEndereco(const Value: String);
    procedure SetPorta(const Value: Integer);
  public
    property Endereco: String read GetEndereco write SetEndereco;
    property Porta: Integer read GetPorta write SetPorta;
    constructor Create; reintroduce;
  end;

  TConnect = class
  private
    FModel: String;
    FRestRequest: TRESTRequest;
    FRestClient: TRESTClient;
    FRestResponse: TRESTResponse;
  public
    property Model: String read FModel write FModel;
    function Get(const AFilter: String = ''): TJSONArray; virtual;
    function Upsert(const AParam: String = ''): TJSONObject; virtual;
    function GetByID(const AID: Integer): TJSONObject;
    function Count(const AFilter: String = ''): TJSONObject;
    function FindOne(const AFilter: String = ''): TJSONObject;
    constructor Create; virtual;
    destructor Destroy; override;
  end;

var
  Cfg: TCfgConnect;

implementation



{ TCfgConnect }

constructor TCfgConnect.Create;
begin
  inherited Create(ExtractFilePath(Application.ExeName) + Application.Title + '.ini');
end;

function TCfgConnect.GetEndereco: String;
begin
  Result := ReadString('CFG','ENDERECO','');
end;

function TCfgConnect.GetPorta: Integer;
begin
  Result := ReadInteger('CFG','PORTA',80);
end;

procedure TCfgConnect.SetEndereco(const Value: String);
begin
  WriteString('CFG','ENDERECO',Value);
end;

procedure TCfgConnect.SetPorta(const Value: Integer);
begin
  WriteInteger('CFG','PORTA',Value);
end;

{ TConnect }

function TConnect.Count(const AFilter: String): TJSONObject;
begin

end;

constructor TConnect.Create;
begin
  FRestClient := TRESTClient.Create(nil);
  FRestRequest := TRESTRequest.Create(nil);
  FRestResponse := TRESTResponse.Create(nil);

  FRestRequest.Resource := FModel;
  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;
  FRestClient.BaseURL := Cfg.Endereco + ':' + IntToStr(Cfg.Porta) + '/api';
end;

destructor TConnect.Destroy;
begin
  if Assigned(FRestClient) then
    FreeAndNil(FRestClient);
  if Assigned(FRestRequest) then
    FreeAndNil(FRestRequest);
  if Assigned(FRestResponse) then
    FreeAndNil(FRestResponse);
  inherited;
end;

function TConnect.FindOne(const AFilter: String): TJSONObject;
begin

end;

function TConnect.Get(const AFilter: String): TJSONArray;
begin
  FRestRequest.Method := rmGET;
  FRestRequest.Execute;
  Result := FRestResponse.JSONValue as TJSONArray;
end;

function TConnect.GetByID(const AID: Integer): TJSONObject;
begin

end;

function TConnect.Upsert(const AParam: String = ''): TJSONObject;
var
  Parameter: TRESTRequestParameter;
begin
  FRestRequest.Params.Clear;
  if AParam <> '' then
  begin
    with FRestRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      ContentType := ctAPPLICATION_JSON;
      Value := AParam;
    end;
  end;
  FRestRequest.Method := rmPOST;
  FRestRequest.Execute;
  Result := FRestResponse.JSONValue as TJSONObject;
end;

initialization
  Cfg := TCfgConnect.Create;

finalization
  if Assigned(Cfg) then
    FreeAndNil(Cfg);

end.
