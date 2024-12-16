unit Model.Connection.Firedac;

interface

uses
  Model.Interfaces.Data,
  Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Type
  TModelConnectionFiredac = class(TInterfacedObject, iConexao)
    private
      FConexao: TFDConnection;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConexao;
      function Connection : TCustomConnection;
  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoFiredac }

function TModelConnectionFiredac.Connection: TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelConnectionFiredac.Create;
begin
  FConexao := TFDConnection.Create(nil);
  {
  FConexao.DriverName      := 'FB';
  FConexao.Params.Database := 'D:\Bancos\Firebird\DATABASE.FDB';
  FConexao.Params.UserName := 'SYSDBA';
  FConexao.Params.Password := 'masterkey';
  }
  FConexao.Connected       := true;
end;

destructor TModelConnectionFiredac.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TModelConnectionFiredac.New: iConexao;
begin
  Result := Self.Create;
end;

end.
