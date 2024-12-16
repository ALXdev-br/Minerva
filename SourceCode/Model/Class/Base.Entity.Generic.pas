unit Base.Entity.Generic;

interface

uses
  System.Generics.Collections;

type
  TBaseEntityGeneric<T:Class, Constructor> = class
  private
    FID: LongWord;
    FEntity: T;
    function GetEntity: T;
    procedure SetEntity(const Value: T);
    function GetID: LongWord;
    procedure SetID(const Value: LongWord);
  protected
  public
    constructor Create(AValue: T); virtual;
    destructor Destroy; override;
    property ID: LongWord read GetID write SetID;
    property Entity:T read GetEntity write SetEntity;
  end;

implementation

{ TBaseEntityGeneric }


constructor TBaseEntityGeneric<T>.Create(AValue: T);
begin
  inherited Create;
  FID := 0;
  FEntity := AValue;
end;



destructor TBaseEntityGeneric<T>.Destroy;
begin
  //
  inherited Destroy;
end;
function TBaseEntityGeneric<T>.GetEntity: T;
begin
  Result := FEntity;
end;

procedure TBaseEntityGeneric<T>.SetEntity(const Value: T);
begin
  FEntity := Value;
end;

function TBaseEntityGeneric<T>.GetID: LongWord;
begin
  Result := FID;
end;

procedure TBaseEntityGeneric<T>.SetID(const Value: LongWord);
begin
  FID := Value;
end;

end.
