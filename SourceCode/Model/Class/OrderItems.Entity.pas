unit OrderItems.Entity;

interface

uses
  Model.tableAttribute,
  Base.Entity,
  System.SysUtils, System.Variants, System.Classes,
  RTTI ;

type

  [TTableAttribute('TAB_ORDERS_ITEM')]
  TOrderItems = class(TBaseEntity)
  private
    FOrdemId: LongWord;
    FProductId: LongWord;
    FQuantity: Extended;
    FUnitPrice: Currency;
    function GetId: LongWord;
    procedure SetId(const Value: LongWord);
  public
    function GetTableName:string;
    property ItemOrderId: LongWord read GetId      write SetId;
    property OrdemId:LongWord      read FOrdemId   write FOrdemId;
    property ProductId:LongWord    read FProductId write FProductId;
    property Quantity:Extended     read FQuantity  write FQuantity;
    property UnitPrice:Currency    read FUnitPrice write FUnitPrice;
  end;

implementation

{ TOrderItem }

function TOrderItems.GetId: LongWord;
begin
  Result := ID;
end;

procedure TOrderItems.SetId(const Value: LongWord);
begin
  ID := Value;
end;

function TOrderItems.GetTableName: string;
var
  LContext: TRttiContext;
  LType: TRttiType;
  LAttr: TCustomAttribute;
begin
  LContext := TRttiContext.Create;

  LType := LContext.GetType(TypeInfo(TOrderItems));

  for LAttr in LType.GetAttributes() do
    if LAttr is TTableAttribute then
   Self.TableName :=  TTableAttribute(LAttr).FValue;

  LContext.Free;
  Result := Self.TableName;
end;



end.
