unit Controller.Factory.Query;

interface

uses
  Controller.Factory.Interfaces,
  Model.Interfaces.Data,
//Model.Query.Firedac,
  Model.Query.ADO;

Type
  TControllerFactoryQuery = class(TInterfacedObject, iFactoryQuery)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFactoryQuery;
      function Query(Connection : iConexao) : iQuery;
  end;

implementation


{ TControllerFactoryQuery }

constructor TControllerFactoryQuery.Create;
begin

end;

destructor TControllerFactoryQuery.Destroy;
begin

  inherited;
end;

class function TControllerFactoryQuery.New: iFactoryQuery;
begin
  Result := Self.Create;
end;

function TControllerFactoryQuery.Query(Connection : iConexao) : iQuery;
begin
//Result := TModelQueryFiredac.New(Connection);
  Result := TModelQueryADO.New(Connection);
end;

end.
