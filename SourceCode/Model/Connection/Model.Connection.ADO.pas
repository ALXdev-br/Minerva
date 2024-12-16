unit Model.Connection.ADO;

interface

uses
  Model.Connection.DataModule,
  Model.Interfaces.Data, System.IniFiles,
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TModelConexaoADO = class(TInterfacedObject, iConexao)
  private
     FConexao :TADOConnection;
  public
     constructor Create;
     destructor Destroy; override;
     class function New : iConexao;
     function Connection : TCustomConnection;
  end;

implementation


{ TModelConexaoADO }

function TModelConexaoADO.Connection: TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelConexaoADO.Create;
begin
  ModelConnectionDM.ReadConfigIni;

  FConexao := TADOConnection.Create(nil);
  FConexao.ConnectionString := Format('Provider=SQLOLEDB.1; Password=%s;Persist Security Info=True;User ID=%s;Initial Catalog=%s;Data Source=%s',[ModelConnectionDM.Password, ModelConnectionDM.UserId, ModelConnectionDM.Database, ModelConnectionDM.Server]);
  FConexao.LoginPrompt := False;
  FConexao.Connected := true;
end;

destructor TModelConexaoADO.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TModelConexaoADO.New: iConexao;
begin
  Result := Self.Create;
end;

end.
