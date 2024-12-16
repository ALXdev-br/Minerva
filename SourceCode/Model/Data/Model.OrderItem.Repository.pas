unit Model.OrderItem.Repository;

interface

uses
  Model.Interfaces.Data,
  Model.Interfaces.Entity,
  Base.Entity,
  OrderItems.Entity,
  Controller.Factory.Query,
  Controller.Factory.Entity,
  Rtti,
  Data.DB,
  System.SysUtils;

Type
  TModelOrderItemRepository = class(TInterfacedObject, iEntityRepository)
    private
      FQuery : iQuery;
      FEntity: TOrderItems;
    public
      constructor Create(Entity:TOrderItems);
      destructor Destroy; override;
      class function New(Entity:TOrderItems): iEntityRepository;
      function List(Value : TDataSource) : iEntityRepository;
      function ListFields(const Fields : String; DataSource : TDataSource) : iEntityRepository;
      procedure LinkQuery(MasterDataSource: TDataSource);
      function  QueryCommand(const SQLText:string; DataSource:TDataSource): iEntityRepository;
      procedure QueryOpen;
      procedure QueryClose;
      function  QueryActive:Boolean;
  end;

implementation

{ TModelOrderItemRepository }

constructor TModelOrderItemRepository.Create(Entity:TOrderItems);
begin
  if Assigned(Entity)  then
    FEntity := Entity
  else
    FEntity := TOrderItems(TControllerFactoryEntity.New.Entity(TBaseEntity(Entity)));

  if Assigned(Entity)  then
    FQuery  := TControllerFactoryQuery.New.Query(nil);
end;

destructor TModelOrderItemRepository.Destroy;
begin

  inherited;
end;

function TModelOrderItemRepository.ListFields(const Fields: String; DataSource: TDataSource): iEntityRepository;
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

  AuxText := TStringBuilder.Create;
  try
    AuxText.Append(';WITH CTE_OIT AS               ').
	          Append('      SELECT TOI.cod_item_order').
            Append('           , TOI.cod_order     ').
            Append('           , TOI.cod_product   ').
            Append('           , TIT.[name]        ').
            Append('           , TOI.quantity      ').
            Append('           , TOI.unit_price    ').
            Append('           , TOI.total_item    ').
            AppendFormat(' FROM %s TOI',    [Tabela]).
            Append('       INNER JOIN tab_item AS TIT').
            Append('               ON TIT.cod_product = TOI.cod_product').
            AppendFormat(') SELECT %s FROM CTE_OIT WHERE cod_order = :cod_order ',[AuxFields]);
    FQuery.SQL(AuxText.ToString);

    FQuery.Active(1);
    DataSource.DataSet := FQuery.DataSet;
  finally
    AuxText.Free;
  end;
end;

procedure TModelOrderItemRepository.LinkQuery(MasterDataSource: TDataSource);
begin
  FQuery.DataSrc(MasterDataSource);
end;

function TModelOrderItemRepository.List(Value: TDataSource): iEntityRepository;
var
  Tabela : string;
  AuxText: TStringBuilder;
begin
  Result := Self;
  Tabela := FEntity.GetTableName;

  AuxText:= TStringBuilder.Create;
  try
    AuxText.Append('      SELECT TOI.cod_item_order').
            Append('           , TOI.cod_order     ').
            Append('           , TOI.cod_product   ').
            Append('           , TIT.[name]        ').
            Append('           , TOI.quantity      ').
            Append('           , TOI.unit_price    ').
            Append('           , TOI.total_item    ').
            AppendFormat(' FROM %s TOI',    [Tabela]).
            Append('       INNER JOIN tab_item AS TIT').
            Append('               ON TIT.cod_product = TOI.cod_product').
            Append('       WHERE cod_order = :cod_order ');
    FQuery.SQL(AuxText.ToString);

    FQuery.Active(1);
    Value.DataSet := FQuery.DataSet;
  finally
    AuxText.Free;
  end;
end;
{
class function TModelItemRepository.New: iEntityRepository;
begin
  Result := Self.Create;
end;
}

class function TModelOrderItemRepository.New(Entity:TOrderItems): iEntityRepository;
begin
//Result := Self.Create(Entity);
  Result := Self.Create(Entity);
end;

procedure TModelOrderItemRepository.QueryOpen;
begin
  if Assigned(FQuery) then
    FQuery.Active(1);
end;

procedure TModelOrderItemRepository.QueryClose;
begin
  if Assigned(FQuery) then
    FQuery.Active(0);
end;

function TModelOrderItemRepository.QueryCommand(const SQLText: string;
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

function TModelOrderItemRepository.QueryActive: Boolean;
begin
  Result := False;
  if Assigned(FQuery) then
    Result := FQuery.Active();
end;

end.
