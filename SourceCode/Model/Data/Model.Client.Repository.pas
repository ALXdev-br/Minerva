unit Model.Client.Repository;

interface

uses
  Model.Interfaces.Data,
  Model.Interfaces.Entity,
  Base.Entity,
  Client.Entity,
  Controller.Factory.Query,
  Controller.Factory.Entity,
  Rtti,
  Data.DB,
  System.SysUtils;

Type
  TModelClientRepository = class(TInterfacedObject, iEntityRepository)
    private
      FQuery : iQuery;
      FEntity: TClient;
    public
      constructor Create(Entity:TClient);
      destructor Destroy; override;
      class function New(Entity:TClient): iEntityRepository;
      function List(Value : TDataSource) : iEntityRepository;
      function ListFields(const Fields : String; DataSource : TDataSource) : iEntityRepository;
      procedure LinkQuery(MasterDataSource: TDataSource);
      function  QueryCommand(const SQLText:string; DataSource:TDataSource): iEntityRepository;
      procedure QueryOpen;
      procedure QueryClose;
      function  QueryActive:Boolean;
  end;

implementation


{ TModelClientRepository }

constructor TModelClientRepository.Create(Entity:TClient);
begin
  if Assigned(Entity)  then
    FEntity := Entity
  else
    FEntity := TClient(TControllerFactoryEntity.New.Entity(TBaseEntity(Entity)));

  if Assigned(Entity)  then
    FQuery  := TControllerFactoryQuery.New.Query(nil);
end;

destructor TModelClientRepository.Destroy;
begin

  inherited;
end;

function TModelClientRepository.ListFields(const Fields: String; DataSource: TDataSource): iEntityRepository;
var
  Tabela : string;
  AuxFields:string;
begin
  Result := Self;
  Tabela := FEntity.GetTableName;

  if Trim(Fields) <> '' then
    AuxFields :=  Fields
  else
    AuxFields :=  ' * ';

  FQuery.SQL(Format('SELECT %s FROM %s ', [AuxFields, Tabela]));
  FQuery.Active(1);
  DataSource.DataSet := FQuery.DataSet;
end;


procedure TModelClientRepository.LinkQuery(MasterDataSource: TDataSource);
begin
  FQuery.DataSrc(MasterDataSource);
end;

function TModelClientRepository.List(Value: TDataSource): iEntityRepository;
var
  Tabela : string;
  AuxText: TStringBuilder;
begin
  Result := Self;
  Tabela := FEntity.GetTableName;

  AuxText:= TStringBuilder.Create;
  try
    AuxText.Append('       SELECT CLI.[cod_client] ').
            Append('            , CLI.[name]       ').
            Append('            , CLI.[address]    ').
            Append('            , CLI.[phone]      ').
            Append('            , FORMAT(cli.[phone], ''(##) ## #####-####'') AS [phone] ').
            Append('            , CLI.[email]      ').
      AppendFormat('         FROM %s CLI',[Tabela]  );
    FQuery.SQL(AuxText.ToString);

    FQuery.Active(1);
    Value.DataSet := FQuery.DataSet;
  finally
    AuxText.Free;
  end;
end;

class function TModelClientRepository.New(Entity:TClient): iEntityRepository;
begin
  Result := Self.Create(Entity);
end;

procedure TModelClientRepository.QueryOpen;
begin
  if Assigned(FQuery) then
    FQuery.Active(1);
end;

procedure TModelClientRepository.QueryClose;
begin
  if Assigned(FQuery) then
    FQuery.Active(0);
end;

function TModelClientRepository.QueryCommand(const SQLText: string;
  DataSource: TDataSource): iEntityRepository;
var
  Tabela : string;
  AuxText: string;
begin
  Result := Self;
  Tabela := FEntity.TableName;

  if Trim(SQLText) <> '' then
    AuxText :=  SQLText
  else
    AuxText :=  Format(' SELECT * FROM %s ', [Tabela]);

  FQuery.SQL(Format(' %s ', [AuxText]));
  FQuery.Active(1);
  DataSource.DataSet := FQuery.DataSet;
end;


function TModelClientRepository.QueryActive: Boolean;
begin
  Result := False;
  if Assigned(FQuery) then
    Result := FQuery.Active();
end;

end.

