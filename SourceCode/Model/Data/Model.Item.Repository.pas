unit Model.Item.Repository;

interface

uses
  Model.Interfaces.Data,
  Model.Interfaces.Entity,
  Base.Entity,
  Item.Entity,
  Controller.Factory.Query,
  Controller.Factory.Entity,
  Rtti,
  Data.DB,
  System.SysUtils;

Type
  TModelItemRepository = class(TInterfacedObject, iEntityRepository)
    private
      FQuery : iQuery;
      FEntity: TItem;
    public
      constructor Create(Entity:TItem);
      destructor Destroy; override;
      class function New(Entity:TItem): iEntityRepository;
      function List(Value : TDataSource) : iEntityRepository;
      function ListFields(const Fields : String; DataSource : TDataSource) : iEntityRepository;
      procedure LinkQuery(MasterDataSource: TDataSource);
      function  QueryCommand(const SQLText:string; DataSource:TDataSource): iEntityRepository;
      procedure QueryOpen;
      procedure QueryClose;
      function  QueryActive:Boolean;
  end;

implementation


{ TModelItemRepository }

constructor TModelItemRepository.Create(Entity:TItem);
begin
  if Assigned(Entity)  then
    FEntity := Entity
  else
    FEntity := TItem(TControllerFactoryEntity.New.Entity(TBaseEntity(Entity)));

  if Assigned(Entity)  then
    FQuery  := TControllerFactoryQuery.New.Query(nil);
end;

destructor TModelItemRepository.Destroy;
begin

  inherited;
end;

function TModelItemRepository.ListFields(const Fields: String; DataSource: TDataSource): iEntityRepository;
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

procedure TModelItemRepository.LinkQuery(MasterDataSource: TDataSource);
begin
  FQuery.DataSrc(MasterDataSource);
end;

function TModelItemRepository.List(Value: TDataSource): iEntityRepository;
var
  Tabela : string;
begin
  Result := Self;
  Tabela := FEntity.GetTableName;

  FQuery.SQL(Format('SELECT * FROM %s',[Tabela]));
  FQuery.Active(1);
  Value.DataSet := FQuery.DataSet;
end;

class function TModelItemRepository.New(Entity:TItem): iEntityRepository;
begin
  Result := Self.Create(Entity);
end;

procedure TModelItemRepository.QueryOpen;
begin
  if Assigned(FQuery) then
    FQuery.Active(1);
end;

procedure TModelItemRepository.QueryClose;
begin
  if Assigned(FQuery) then
    FQuery.Active(0);
end;

function TModelItemRepository.QueryCommand(const SQLText: string;
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


function TModelItemRepository.QueryActive: Boolean;
begin
  Result := False;
  if Assigned(FQuery) then
    Result := FQuery.Active();
end;

end.