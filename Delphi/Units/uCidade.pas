unit uCidade;

interface

uses uConnect,Generics.Collections, JSON;

type
  TCidade = class
  private
    FNome: String;
    FEstado: String;
    FID: Integer;
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write FNome;
    property Estado: String read FEstado write FEstado;
  end;

  TCidades = TList<TCidade>;

  TCidadesFactory = class(TConnect)
  private
  public
    function Upsert(const ACidade: TCidade): TCidade; overload;
    function Get(const AFilter: String = ''): TCidades; overload;
    constructor Create; override;
  end;

implementation

{ TCidadesFactory }

constructor TCidadesFactory.Create;
begin
  Model := 'cidades';
  inherited;
end;

function TCidadesFactory.Get(const AFilter: String): TCidades;
var
  Json: TJSONArray;
  Cidade: TCidade;
  I: Integer;
begin
  Json := inherited Get(AFilter);
  Result := TCidades.Create;
  for I := 0 to Json.Count - 1 do
  begin
    Cidade := TCidade.Create;
    Cidade.Nome := Json.Items[I].GetValue<String>('nome');
    Cidade.Estado := Json.Items[I].GetValue<String>('estado');
    Cidade.ID := Json.Items[I].GetValue<Integer>('id');
    Result.Add(Cidade);
  end;
end;

function TCidadesFactory.Upsert(const ACidade: TCidade): TCidade;
var
  Json: TJsonObject;
begin
  Json := TJSONObject.Create;
  Json.AddPair('nome',ACidade.Nome);
  Json.AddPair('estado',ACidade.Estado);
  Json.AddPair('id',TJSONNumber.Create(ACidade.ID));

  Result := TCidade.Create;
  Json := inherited Upsert(Json.ToString);
  Result.Nome := Json.GetValue<String>('nome');
  Result.Estado := Json.GetValue<String>('estado');
  Result.ID := Json.GetValue<Integer>('id');
end;

end.
