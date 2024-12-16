unit Model.Query.Firedac;

interface

uses
  Model.Interfaces.Data,
  Model.Connection.Firedac,
  System.SysUtils,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Type
  TModelQueryFiredac = class(TInterfacedObject, iQuery)
    private
      FParent : iConexao;
      FQuery : TFDQuery;
    public
      constructor Create(Parent : iConexao);
      destructor Destroy; override;
      class function New(Parent : iConexao) : iQuery;
      function SQL(Value : String) : iQuery;
      function DataSet : TDataSet;
      procedure DataSrc(Value:TDataSource);
      function Active(Open:ShortInt=-1):Boolean;
      procedure Close;
  end;

implementation

{ TModelQueryFiredac }

function TModelQueryFiredac.Active(Open: ShortInt): Boolean;
begin
  case Open of
  - 1:;
    0: FQuery.Open;
    1: FQuery.Close;
  end;

  Result := FQuery.Active;
end;

procedure TModelQueryFiredac.Close;
begin
  FQuery.Close;
end;

constructor TModelQueryFiredac.Create(Parent : iConexao);
begin
  FParent := Parent;
  FQuery := TFDQuery.Create(nil);

  if not Assigned(FParent) then
    FParent := TModelConnectionFiredac.New;

  FQuery.Connection := TFDConnection(FParent.Connection);
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
  Result := FQuery;
end;

procedure TModelQueryFiredac.DataSrc(Value: TDataSource);
begin
  FQuery.DataSource := Value;
end;

destructor TModelQueryFiredac.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelQueryFiredac.New(Parent : iConexao) : iQuery;
begin
  Result := Self.Create(Parent);
end;

function TModelQueryFiredac.SQL(Value: String): iQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
  FQuery.Active := true;
end;

end.
