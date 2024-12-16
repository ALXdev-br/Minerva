unit Model.Entity.Repository;

interface

uses
  Model.Interfaces.Data,
  Model.Interfaces.Entity,
  Base.Entity,
  Client.Entity,
  Controller.Factory.Query,
  Controller.Factory.Entity,
  System.SysUtils,
  Data.DB;

Type
  TModelEntityRepository = class(TInterfacedObject, iEntityRepository)
    private
      FQuery : iQuery;
      FEntity: TBaseEntity;
    public
      constructor Create(Entity:TBaseEntity);
      destructor Destroy; override;
      class function New(Entity:TBaseEntity): iEntityRepository; overload;
      class function New(Entity:TClient): iEntityRepository; overload;
      function List(Value : TDataSource) : iEntityRepository;
      function ListFields(const Fields : String; DataSource : TDataSource) : iEntityRepository;
      procedure LinkQuery(MasterDataSource: TDataSource);
      function  QueryCommand(const SQLText:string; DataSource:TDataSource): iEntityRepository;
      procedure QueryOpen;
      procedure QueryClose;
      function  QueryActive:Boolean;
  end;

implementation


{ TModelEntityRepository }

constructor TModelEntityRepository.Create(Entity:TBaseEntity);
begin
  if Assigned(Entity)  then
    FEntity := Entity
  else
    FEntity := TControllerFactoryEntity.New.Entity(Entity);

  if Assigned(Entity)  then
    FQuery  := TControllerFactoryQuery.New.Query(nil);
end;

destructor TModelEntityRepository.Destroy;
begin

  inherited;
end;

function TModelEntityRepository.ListFields(const Fields: String; DataSource: TDataSource): iEntityRepository;
var
  Tabela : string;
  AuxFields: string;
begin
  Result := Self;
  Tabela := FEntity.TableName;

  if Trim(Fields) <> '' then
    AuxFields :=  Fields
  else
    AuxFields :=  ' * ';

  FQuery.SQL(Format('SELECT %s FROM %s ', [AuxFields, Tabela]));
  FQuery.Active(1);
  DataSource.DataSet := FQuery.DataSet;
end;

procedure TModelEntityRepository.LinkQuery(MasterDataSource: TDataSource);
begin
  FQuery.DataSrc(MasterDataSource);
end;

function TModelEntityRepository.List(Value: TDataSource): iEntityRepository;
var
  Tabela : string;
begin
  Result := Self;
  Tabela := FEntity.TableName;

  FQuery.SQL(Format('SELECT * FROM %s',[Tabela]));
  FQuery.Active(1);

  Value.DataSet := FQuery.DataSet;
end;

class function TModelEntityRepository.New(Entity:TBaseEntity): iEntityRepository;
begin
  Result := Self.Create(Entity);
end;

class function TModelEntityRepository.New(Entity:TClient): iEntityRepository;
begin
  Result := Self.Create(Entity);
end;

procedure TModelEntityRepository.QueryOpen;
begin
  if Assigned(FQuery) then
    FQuery.Active(1);
end;

procedure TModelEntityRepository.QueryClose;
begin
  if Assigned(FQuery) then
    FQuery.Active(0);
end;

function TModelEntityRepository.QueryCommand(const SQLText: string; DataSource: TDataSource): iEntityRepository;
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

function TModelEntityRepository.QueryActive: Boolean;
begin
  Result := False;
  if Assigned(FQuery) then
    Result := FQuery.Active();
end;

end.
