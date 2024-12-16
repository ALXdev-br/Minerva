unit Item.Entity;

interface

uses
  Model.tableAttribute,
  Base.Entity,
  System.SysUtils, System.Variants, System.Classes,
  RTTI ;


type
  [TTableAttribute('TAB_ITEM')]
  TItem = class(TBaseEntity)
  private
    FName: string;
    FDescription: string;
    function GetID: LongWord;
  public
    procedure SetID(const Value: LongWord);
    function GetTableName:string;
    property CodeId: LongWord     read GetID        write SetID;
    property Description: string  read FDescription write FDescription;
  end;

implementation

{ TItem }

function TItem.GetID: LongWord;
begin
  Result := ID;
end;

procedure TItem.SetID(const Value: LongWord);
begin
   Self.ID := Value;
end;

function TItem.GetTableName: string;
var
  LContext: TRttiContext;
  LType: TRttiType;
  LAttr: TCustomAttribute;
begin
  LContext := TRttiContext.Create;

  LType := LContext.GetType(TypeInfo(TItem));

  for LAttr in LType.GetAttributes() do
    if LAttr is TTableAttribute then
   Self.TableName :=  TTableAttribute(LAttr).FValue;

  LContext.Free;
  Result := Self.TableName;
end;


end.