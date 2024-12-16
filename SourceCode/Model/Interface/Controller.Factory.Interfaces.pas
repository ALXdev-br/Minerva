unit Controller.Factory.Interfaces;

interface

uses
  Model.Interfaces.Entity,
  Model.Interfaces.Data,
  Base.Entity;

type
  iFactoryEntity = interface
    ['{D13C02C0-BAB5-45ED-911E-E368D9795784}']
    function Entity(Entity:TBaseEntity): TBaseEntity;
  end;

  iFactoryQuery = interface
    ['{54395377-D65A-458C-8F1B-764A11A9C070}']
    function Query(Connection : iConexao) : iQuery;
  end;

implementation

end.
