unit Model.Query.ADO;

interface

uses
  Model.Interfaces.Data,
  Model.Connection.ADO,
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

Type
  TModelQueryADO = class(TInterfacedObject, iQuery)
    private
      FParent : iConexao;
      FQuery  : TADOQuery;
    public
      constructor Create(Parent : iConexao);
      destructor Destroy; override;
      class function New(Parent : iConexao) : iQuery;
      function SQL(Value : String) : iQuery;
      function DataSet : TDataSet;
      procedure DataSrc(Value:TDataSource);
      function Active(Open:ShortInt=-1):Boolean;
  end;

implementation

{ TModelQueryFiredac }

function TModelQueryADO.Active(Open:ShortInt): Boolean;
begin
  case Open of
   -1: Result := FQuery.Active;
    0: FQuery.Active := False;
    1: begin
         if Trim(FQuery.SQL.Text) <> '' then
           FQuery.Active := True;
       end;
    else
     Result := FQuery.Active;
  end;
end;

constructor TModelQueryADO.Create(Parent : iConexao);
begin
  FParent := Parent;
  FQuery := TADOQuery.Create(nil);

  if not Assigned(FParent) then
    FParent := TModelConexaoADO.New;

  FQuery.Connection := TADOConnection(FParent.Connection);
end;

function TModelQueryADO.DataSet: TDataSet;
begin
  Result := FQuery;
end;

procedure TModelQueryADO.DataSrc(Value: TDataSource);
begin
   FQuery.DataSource := Value;
end;

destructor TModelQueryADO.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelQueryADO.New(Parent : iConexao) : iQuery;
begin
  Result := Self.Create(Parent);
end;

function TModelQueryADO.SQL(Value: String): iQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

end.
