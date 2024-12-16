unit Controller.Factory.Entity;

interface

uses
  Controller.Factory.Interfaces,
  Model.Interfaces.Entity,
  Base.Entity,
  Client.Entity,
  Item.Entity,
  Order.Entity,
  OrderItems.Entity,
  TypInfo,
  System.Variants,
  System.Classes,
  System.SysUtils;

Type
  TControllerFactoryEntity = class(TInterfacedObject, iFactoryEntity)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFactoryEntity;
    function Entity(Entity:TBaseEntity): TBaseEntity;
  end;

implementation


{ TControllerFactoryEntity }

constructor TControllerFactoryEntity.Create;
begin

end;

destructor TControllerFactoryEntity.Destroy;
begin

  inherited;
end;

class function TControllerFactoryEntity.New:iFactoryEntity;
begin
  Result := Self.Create;
end;

function TControllerFactoryEntity.Entity(Entity:TBaseEntity): TBaseEntity;
begin

  if not Assigned(Entity) and (Entity <> nil) then
    begin
      if TBaseEntity(Entity).ClassNameIs(TClient.ClassName) then
        Result := TClient(Entity).Create;

      if TBaseEntity(Entity).ClassNameIs(TItem.ClassName) then
        Result := TItem(Entity).Create;

      if TBaseEntity(Entity).ClassNameIs(TOrder.ClassName) then
        Result := TOrder(Entity).Create;

      if TBaseEntity(Entity).ClassNameIs(TOrderItems.ClassName) then
        Result := TOrderItems(Entity).Create;
    end
  else
    begin
      Result := Entity;
    end;

  if Entity = nil then
    Result := TBaseEntity.Create;
end;


end.
