unit Main.View;

interface

uses
  Base.View,
  Item.CRUD.View,
  Client.CRUD.View,
  Model.Client.Repository,
  Client.Entity,
  Client.Rpt,
  Order.CRUD.View,
  Data.DB,
  Model.Connection.DataModule,
  System.Classes, System.SysUtils, System.Variants,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls;

type
  TMainView = class(TBaseView)
    MainMnu: TMainMenu;
    MnuFile: TMenuItem;
    MnuFileClose: TMenuItem;
    MnuRecord: TMenuItem;
    MnuRecordClient: TMenuItem;
    MnuRecordProduct: TMenuItem;
    MnuInvoice: TMenuItem;
    MnuInvoiceOrder: TMenuItem;
    MnuReport: TMenuItem;
    MnuRptClient: TMenuItem;
    StatusBar1: TStatusBar;
    procedure MnuFileCloseClick(Sender: TObject);
    procedure MnuRecordClientClick(Sender: TObject);
    procedure MnuRecordProductClick(Sender: TObject);
    procedure MnuInvoiceOrderClick(Sender: TObject);
    procedure MnuRptClientClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.MnuInvoiceOrderClick(Sender: TObject);
var
  OrderCRUDView: TOrderCRUDView;
begin
  inherited;
  OrderCRUDView:= TOrderCRUDView.Create(Self);
  try
    OrderCRUDView.ShowModal;
  finally
    if Assigned(OrderCRUDView) then
      FreeAndNil(OrderCRUDView);
  end;
end;

procedure TMainView.MnuRecordClientClick(Sender: TObject);
var
  ClientCRUDView: TClientCRUDView;
begin
  inherited;
  ClientCRUDView := TClientCRUDView.Create(Self);
  try
    ClientCRUDView.ShowModal;
  finally
    if Assigned(ClientCRUDView) then
      FreeAndNil(ClientCRUDView);
  end;
end;

procedure TMainView.MnuRecordProductClick(Sender: TObject);
var
  ItemCRUDView: TItemCRUDView;
begin
  inherited;
  ItemCRUDView:= TItemCRUDView.Create(Self);
  try
    ItemCRUDView.ShowModal;
  finally
    if Assigned(ItemCRUDView) then
      FreeAndNil(ItemCRUDView);
  end;
end;

procedure TMainView.MnuRptClientClick(Sender: TObject);
var
  ClientRpt: TClientlRpt;
  dsClientRpt:TDataSource;
begin
  inherited;
  ClientRpt   := TClientlRpt.Create(Self);
  dsClientRpt := TDataSource.Create(Self);
  try
    ClientRpt.FRepository := TModelClientRepository.New(TClient.Create);
    if Assigned(ClientRpt.FRepository) then
    begin
      ClientRpt.FRepository.List(dsClientRpt);
      ClientRpt.frxDBDataset1.DataSource := dsClientRpt;
      ClientRpt.frxReport1.ShowReport();
    end;
  finally
    if Assigned(ClientRpt) then
      FreeAndNil(ClientRpt);

    if Assigned(dsClientRpt) then
      FreeAndNil(dsClientRpt);
  end;
end;
procedure TMainView.FormCreate(Sender: TObject);
begin
   inherited;
   //
end;

procedure TMainView.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(ModelConnectionDM) then
    FreeAndNil(ModelConnectionDM);

end;

procedure TMainView.FormShow(Sender: TObject);
begin
  inherited;
  ModelConnectionDM := TModelConnectionDM.Create(Self);
  ModelConnectionDM.AppName  := ExtractFileName(Application.ExeName);
  ModelConnectionDM.SetExePath(ExtractFilePath(Application.ExeName));
end;

procedure TMainView.MnuFileCloseClick(Sender: TObject);
begin
   Close;
end;

end.
