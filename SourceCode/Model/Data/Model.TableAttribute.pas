unit Model.TableAttribute;

interface

type
  TTableAttribute = class(TCustomAttribute)
  public
    FValue: String;
    constructor Create(const AValue: String);
  end;

implementation

{ TSpecialAttribute }

constructor TTableAttribute.Create(const AValue: String);
begin
     FValue := AValue;
end;

end.
