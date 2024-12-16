unit Base.Model.Rpt;

interface

uses
  Base.Rpt,
  Base.Entity,
  Model.Interfaces.Data,
  Model.Interfaces.Entity,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, Data.DB;

type
  TBaseModelRpt = class(TBaseRpt)
  private
    { Private declarations }
  published
    FEntity:TBaseEntity;
    FRepository : iEntityRepository;
    procedure SetEntity(aEntity: TBaseEntity);
  public
    { Public declarations }
  end;

var
  BaseModelRpt: TBaseModelRpt;

implementation

{$R *.dfm}

{ TBaseModelRpt }

procedure TBaseModelRpt.SetEntity(aEntity: TBaseEntity);
begin
  FEntity := aEntity;
end;

end.
