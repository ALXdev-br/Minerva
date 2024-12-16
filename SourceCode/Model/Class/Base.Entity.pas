unit Base.Entity;

interface

uses
  Model.Interfaces.Entity,
  Rtti,
  System.Classes,
  System.SysUtils;

type
  TBaseEntity = class(TInterfacedObject, iBaseEntity)
  private
    FID: LongWord;
    FEntity: TBaseEntity;
    FTableName:string;
    function GetEntity: TBaseEntity;
    procedure SetEntity(const Value: TBaseEntity);
  protected
    procedure SetID(const Value: LongWord); virtual;
    function GetTableName:string; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property ID: LongWord read FID write FID;
    property Entity:TBaseEntity read GetEntity write SetEntity;
    property TableName:string read FTableName write FTableName;
  end;

implementation

{ TBaseEntity }

constructor TBaseEntity.Create;
begin
  FID := 0;
end;

destructor TBaseEntity.Destroy;
begin
  if Assigned(FEntity) then
    FreeAndNil(FEntity);

  inherited;
end;

function TBaseEntity.GetEntity: TBaseEntity;
begin
   Result := FEntity;
end;

function TBaseEntity.GetTableName: string;
begin
  Result := FTableName;
end;

procedure TBaseEntity.SetEntity(const Value: TBaseEntity);
begin
  FEntity := Value;
end;

procedure TBaseEntity.SetID(const Value: LongWord);
begin
  FID := Value;
end;



end.
