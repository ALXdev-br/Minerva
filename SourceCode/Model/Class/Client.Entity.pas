unit Client.Entity;

interface

uses
  Model.tableAttribute,
  Base.Entity,
  System.SysUtils, System.Variants, System.Classes,
  RTTI ;

type

  [TTableAttribute('TAB_CLIENTS')]
  TClient = class(TBaseEntity)
  private
    FName: string;
    FAddress: string;
    FPhone: NativeUInt;
    FEmail: string;
    procedure SetCode(const Value: LongWord);
    function GetCode: LongWord;
  public
    procedure SetID(const Value: LongWord);
    function GetTableName:string;
    property Code: LongWord     read GetCode   write SetCode;
    property Name: string       read FName     write FName;
    property Address: string    read FAddress  write FAddress;
    property Phone: NativeUInt  read FPhone    write FPhone;
    property Email: string      read FEmail    write FEmail;
  end;

implementation

{ TClient }

function TClient.GetCode: LongWord;
begin
  Result := TBaseEntity(Self).ID;
end;


function TClient.GetTableName: string;
var
  LContext: TRttiContext;
  LType: TRttiType;
  LAttr: TCustomAttribute;
begin
  LContext := TRttiContext.Create;

  LType := LContext.GetType(TypeInfo(TClient));

  for LAttr in LType.GetAttributes() do
    if LAttr is TTableAttribute then
   Self.TableName :=  TTableAttribute(LAttr).FValue;

  LContext.Free;
  Result := Self.TableName;
end;

procedure TClient.SetCode(const Value: LongWord);
begin
  TBaseEntity(Self).ID := Value;
end;

procedure TClient.SetID(const Value: LongWord);
begin
   Self.ID := Value;
end;

end.

