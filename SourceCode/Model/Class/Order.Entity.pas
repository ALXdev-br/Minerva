unit Order.Entity;

interface

uses
  Model.tableAttribute,
  Base.Entity,
  OrderItems.Entity,
  System.SysUtils, System.Variants, System.Classes,
  RTTI;

type
  [TTableAttribute('TAB_ORDERS')]
  TOrder = class(TBaseEntity)
  private
    FClientId:LongWord;
    FDate: TDate;
    FTotal: Currency;
    FOrderItemsId:TOrderItems;
    function GetId: LongWord;
    procedure SetId(const Value: LongWord);
  public
    function GetTableName:string;
    property OrderId: LongWord read GetId      write SetId;
    property ClientId:LongWord read FClientId  write FClientId;
    property Date:TDate        read FDate      write FDate;
    property Total:Currency    read FTotal     write FTotal;

  end;

implementation

{ TOrder }

function TOrder.GetId: LongWord;
begin
  Result := ID;
end;

procedure TOrder.SetId(const Value: LongWord);
begin
   Self.ID := Value;
end;

function TOrder.GetTableName: string;
var
  LContext: TRttiContext;
  LType: TRttiType;
  LAttr: TCustomAttribute;
begin
  LContext := TRttiContext.Create;

  LType := LContext.GetType(TypeInfo(TOrder));

  for LAttr in LType.GetAttributes() do
    if LAttr is TTableAttribute then
   Self.TableName :=  TTableAttribute(LAttr).FValue;

  LContext.Free;
  Result := Self.TableName;
end;



end.
