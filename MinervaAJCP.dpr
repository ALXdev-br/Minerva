program MinervaAJCP;

uses
  Vcl.Forms,
  Client.Entity in 'SourceCode\Model\Class\Client.Entity.pas',
  Order.Entity in 'SourceCode\Model\Class\Order.Entity.pas',
  Base.View in 'SourceCode\View\Base.View.pas' {BaseView},
  Main.View in 'SourceCode\View\Main.View.pas' {MainView},
  Base.Model.View in 'SourceCode\View\Base.Model.View.pas' {BaseModelView},
  Base.Entity in 'SourceCode\Model\Class\Base.Entity.pas',
  Model.Interfaces.Data in 'SourceCode\Model\Interface\Model.Interfaces.Data.pas',
  Model.Connection.ADO in 'SourceCode\Model\Connection\Model.Connection.ADO.pas',
  Controller.Factory.Query in 'SourceCode\Controller\Controller.Factory.Query.pas',
  Model.Query.ADO in 'SourceCode\Model\Data\Model.Query.ADO.pas',
  Model.Query.Firedac in 'SourceCode\Model\Data\Model.Query.Firedac.pas',
  Model.Connection.Firedac in 'SourceCode\Model\Connection\Model.Connection.Firedac.pas',
  Model.CRUD.View in 'SourceCode\View\Model.CRUD.View.pas' {ModelCRUDView},
  Client.CRUD.View in 'SourceCode\View\Client.CRUD.View.pas' {ClientCRUDView},
  Model.Interfaces.Entity in 'SourceCode\Model\Interface\Model.Interfaces.Entity.pas',
  Controller.Factory.Interfaces in 'SourceCode\Model\Interface\Controller.Factory.Interfaces.pas',
  Controller.Factory.Entity in 'SourceCode\Controller\Controller.Factory.Entity.pas',
  Model.Entity.Repository in 'SourceCode\Model\Data\Model.Entity.Repository.pas',
  Model.Client.Repository in 'SourceCode\Model\Data\Model.Client.Repository.pas',
  AttrUtils in 'SourceCode\Util\AttrUtils.pas',
  Model.TableAttribute in 'SourceCode\Model\Data\Model.TableAttribute.pas',
  Item.CRUD.View in 'SourceCode\View\Item.CRUD.View.pas' {ItemCRUDView},
  Item.Entity in 'SourceCode\Model\Class\Item.Entity.pas',
  Model.Item.Repository in 'SourceCode\Model\Data\Model.Item.Repository.pas',
  OrderItems.Entity in 'SourceCode\Model\Class\OrderItems.Entity.pas',
  Model.Order.Repository in 'SourceCode\Model\Data\Model.Order.Repository.pas',
  Model.OrderItem.Repository in 'SourceCode\Model\Data\Model.OrderItem.Repository.pas',
  Order.CRUD.View in 'SourceCode\View\Order.CRUD.View.pas' {OrderCRUDView},
  Base.Rpt in 'SourceCode\Report\Base.Rpt.pas' {BaseRpt},
  Base.Model.Rpt in 'SourceCode\Report\Base.Model.Rpt.pas' {BaseModelRpt},
  Client.Rpt in 'SourceCode\Report\Client.Rpt.pas' {ClientlRpt},
  ConfigIni in 'SourceCode\Util\ConfigIni.pas',
  Model.Connection.DataModule in 'SourceCode\Model\Connection\Model.Connection.DataModule.pas' {ModelConnectionDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.CreateForm(TModelConnectionDM, ModelConnectionDM);
  Application.Run;
end.
