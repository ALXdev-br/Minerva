unit Model.Order.Repository;

interface

uses
  Model.Interfaces.Data,
  Model.Interfaces.Entity,
  Base.Entity,
  Order.Entity,
  Controller.Factory.Query,
  Controller.Factory.Entity,
  Rtti,
  Data.DB,
  System.SysUtils;

Type
  TModelOrderRepository = class(TInterfacedObject, iEntityRepository)
    private
      FQuery : iQuery;
      FEntity: TOrder;
    public
      constructor Create(Entity:TOrder);
      destructor Destroy; override;
      class function New(Entity:TOrder): iEntityRepository;
      function List(Value : TDataSource) : iEntityRepository;
      function ListFields(const Fields : String; DataSource : TDataSource) : iEntityRepository;
      procedure LinkQuery(MasterDataSource: TDataSource);
      function  QueryCommand(const SQLText:string; DataSource:TDataSource): iEntityRepository;
      procedure QueryOpen;
      procedure QueryClose;
      function  QueryActive:Boolean;
  end;

implementation


{ TModelOrderRepository }

constructor TModelOrderRepository.Create(Entity:TOrder);
begin
  if Assigned(Entity)  then
    FEntity := Entity
  else
    FEntity := TOrder(TControllerFactoryEntity.New.Entity(TBaseEntity(Entity)));

  if Assigned(Entity)  then
    FQuery  := TControllerFactoryQuery.New.Query(nil);
end;

destructor TModelOrderRepository.Destroy;
begin

  inherited;
end;

function TModelOrderRepository.ListFields(const Fields: String; DataSource: TDataSource): iEntityRepository;
var
  Tabela : string;
  AuxFields:string;
  AuxText: TStringBuilder;
begin
  Result := Self;
  Tabela := FEntity.GetTableName;

  if Trim(Fields) <> '' then
    AuxFields :=  Fields
  else
    AuxFields :=  ' * ';

  AuxText:= TStringBuilder.Create;
  try
    AuxText.AppendFormat('SELECT %s'    ,[AuxFields]).
            AppendFormat('  FROM %s ORD',[Tabela]).
            Append('       INNER JOIN tab_clients CLI').
            Append('               ON CLI.cod_client = ORD.cod_client');
    FQuery.SQL(AuxText.ToString);

    FQuery.Active(1);
    DataSource.DataSet := FQuery.DataSet;
  finally
    AuxText.Free;
  end;
end;

procedure TModelOrderRepository.LinkQuery(MasterDataSource: TDataSource);
begin
  FQuery.DataSrc(MasterDataSource);
end;

function TModelOrderRepository.List(Value: TDataSource): iEntityRepository;
var
  Tabela : string;
  AuxText: TStringBuilder;
begin
  Result := Self;
  Tabela := FEntity.GetTableName;

  AuxText:= TStringBuilder.Create;
  try
    AuxText.Append('     SELECT ORD.cod_order').
            Append('          , ORD.order_date').
            Append('          , ORD.cod_client').
            Append('          , CLI.[name]').
            Append('          , ORD.total_order').
            AppendFormat(' FROM %s ORD',[Tabela]).
            Append('            INNER JOIN tab_clients CLI').
            Append('                    ON CLI.cod_client = ORD.cod_client');
    FQuery.SQL(AuxText.ToString);

    FQuery.Active(1);
    Value.DataSet := FQuery.DataSet;
  finally
    AuxText.Free;
  end;
end;

class function TModelOrderRepository.New(Entity:TOrder): iEntityRepository;
begin
  Result := Self.Create(Entity);
end;

procedure TModelOrderRepository.QueryOpen;
begin
  if Assigned(FQuery) then
    FQuery.Active(1);
end;

procedure TModelOrderRepository.QueryClose;
begin
  if Assigned(FQuery) then
    FQuery.Active(0);
end;

function TModelOrderRepository.QueryCommand(const SQLText: string;
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

function TModelOrderRepository.QueryActive: Boolean;
begin
  Result := False;
  if Assigned(FQuery) then
    Result := FQuery.Active();
end;

end.