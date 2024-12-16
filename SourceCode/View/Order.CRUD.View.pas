unit Order.CRUD.View;

interface

uses
  Base.Entity,
  Order.Entity,
  OrderItems.Entity,
  Model.Interfaces.Data,
  Model.Order.Repository,
  Model.OrderItem.Repository,
  Model.CRUD.View,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Data.DB, System.UITypes, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.TitleBarCtrls,
  Vcl.Graphics,  Vcl.Dialogs,
  Data.Win.ADODB;

type
  TOrderCRUDView = class(TModelCRUDView)
    este1: TMenuItem;
    Conectar1: TMenuItem;
    CategoryPanel3: TCategoryPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ActRecordItemNew: TAction;
    ActRecordItemUpdate: TAction;
    ActRecordItemSave: TAction;
    ActRecordItemDelete: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActRecordNewExecute(Sender: TObject);
    procedure ActRecordSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DtaSrcCRUDMasterStateChange(Sender: TObject);
    procedure ActRecordPrintExecute(Sender: TObject);
    procedure ActRecordItemNewExecute(Sender: TObject);
    procedure ActRecordItemUpdateExecute(Sender: TObject);
    procedure ActRecordItemDeleteExecute(Sender: TObject);
    procedure ActRecordItemSaveExecute(Sender: TObject);
    procedure DtaSrcCRUDDetailStateChange(Sender: TObject);
  private
    FRepositoryDetail : iEntityRepository;
    FTotalOrderDS: TDataSource;
    procedure DatasetStateChange(Value:TDataSetState);
  public
    { Public declarations }
  end;

//var
//  OrderCRUDView: TOrderCRUDView;

implementation

{$R *.dfm}

procedure TOrderCRUDView.ActRecordItemDeleteExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Confirm Delete Item record?', mtConfirmation,[mbYes, mbNo], 0, mbNo) = mrYes then
  begin
    DtaSrcCRUDDetail.DataSet.Delete;
  end;

end;

procedure TOrderCRUDView.ActRecordItemNewExecute(Sender: TObject);
begin
  inherited;
    if Assigned(DtaSrcCRUDDetail) then
    begin
      if DBGrid1.CanFocus then
        DBGrid1.SetFocus;

      DtaSrcCRUDDetail.DataSet.Append;
    end;
end;

procedure TOrderCRUDView.ActRecordItemUpdateExecute(Sender: TObject);
begin
  inherited;
  DtaSrcCRUDDetail.DataSet.Edit;
end;

procedure TOrderCRUDView.ActRecordNewExecute(Sender: TObject);
begin
  PgeCtrView.ActivePage := TabSht_ListRecordsMasterDetail;
  inherited;

end;

procedure TOrderCRUDView.ActRecordPrintExecute(Sender: TObject);
begin
  inherited;
    ShowMessage('Sorry! '+#13#10+
              'Report ORDER/ITEMS unavailable.'+ #13#10 +
              'Item available in the next version of the product.');
end;

procedure TOrderCRUDView.ActRecordSaveExecute(Sender: TObject);
var
  TotalOrder:Currency;
begin
  inherited;
  TotalOrder := 0;
  StatusBar1.SimpleText := Format('Id: %d -  Total Order: %18.2f',[FEntity.ID, TotalOrder]);
  if Assigned(FRepository) and Assigned(FRepositoryDetail) then
  begin
    FRepository.QueryCommand(Format('EXECUTE dbo.OrdersCalculateTotal_DS_SP %d',[9]), FTotalOrderDS);

    if Assigned(FTotalOrderDS) then
      TotalOrder :=  FTotalOrderDS.DataSet.FieldByName('total_order_calculated').AsCurrency;

    FRepository.QueryClose;
    FRepository.QueryOpen;

    Edit1.ReadOnly := True;
    SetValueSearch(UIntToStr(FEntity.ID));
    SetColumnTitleClicked('');
    SetSearchField('cod_order');
    ActRecordFind.Execute;
    Edit1.ReadOnly := False;

    FRepositoryDetail.QueryClose;
    FRepositoryDetail.QueryOpen;
    FRepositoryDetail.LinkQuery(GetDataSourceDefaultView);
    FRepositoryDetail.List(DtaSrcCRUDDetail);
  end;
  StatusBar1.SimpleText := Format('Id: %d - Total Order: %18.2f',[FEntity.ID, TotalOrder]);
end;

procedure TOrderCRUDView.ActRecordItemSaveExecute(Sender: TObject);
var
  varActionStr:string;
  varId:LongWord;
  TotalOrder:Currency;
begin
  inherited;
  varActionStr := '';
  if Assigned(DtaSrcCRUDDetail) then
  begin
    case DtaSrcCRUDDetail.DataSet.State of
      dsEdit:
         varActionStr := 'Update';
      dsInsert:
         varActionStr := 'New';
      end;

    if varActionStr <> '' then
    begin
      if MessageDlg(Format('Confirm %s record? ',[varActionStr]),mtConfirmation,[mbYes, mbNo], 0, mbNo) = mrYes then
      begin

        DtaSrcCRUDDetail.DataSet.Post;

        varId := GetDataSourceDefaultView.DataSet.FieldByName('cod_order').AsLongWord;


        if Assigned(FEntity) then
          FreeAndNil(FEntity);

        FEntity := TBaseEntity.Create;
        FRepository := TModelOrderRepository.New(TOrder(FEntity));
        FRepositoryDetail :=  TModelOrderItemRepository.New(TOrderItems.Create);
        SetDataSourceDefaultView(DtaSrcCRUDMaster);

        if Assigned(FRepository) and Assigned(FRepositoryDetail) then
        begin
          FRepository.List(GetDataSourceDefaultView);
          FRepositoryDetail.LinkQuery(GetDataSourceDefaultView);
          FRepositoryDetail.List(DtaSrcCRUDDetail);
        end;

        FEntity.ID := varId;

        Edit1.ReadOnly := True;
        SetValueSearch(UIntToStr(FEntity.ID));
        SetColumnTitleClicked('');
        SetSearchField('cod_order');
        ActRecordFind.Execute;
        Edit1.ReadOnly := False;

        //FRepositoryDetail.QueryClose;
        //FRepositoryDetail.QueryOpen;
        //FRepositoryDetail.LinkQuery(GetDataSourceDefaultView);
        //FRepositoryDetail.List(DtaSrcCRUDDetail);


        TotalOrder := 0;
        StatusBar1.SimpleText := Format('Id: %d -  Total Order: %18.2f',[FEntity.ID, TotalOrder]);
        if Assigned(FRepository) and Assigned(FRepositoryDetail) then
        begin
             {
             FRepository.QueryCommand(Format('EXECUTE dbo.OrdersCalculateTotal_DS_SP %d',[FEntity.ID]), FTotalOrderDS);
             if Assigned(FTotalOrderDS) then
               TotalOrder := FTotalOrderDS.DataSet.FieldByName('total_order_calculated').AsCurrency;

             GetDataSourceDefaultView.DataSet.Edit;
             GetDataSourceDefaultView.DataSet.FieldByName('total_order').AsCurrency :=  TotalOrder;
             GetDataSourceDefaultView.DataSet.Post;
             }
        end;
        StatusBar1.SimpleText := Format('Id: %d - Total Order: %18.2f',[FEntity.ID, TotalOrder]);
      end;
     end;
  end;
end;



procedure TOrderCRUDView.DtaSrcCRUDDetailStateChange(Sender: TObject);
begin
  inherited;
  DatasetStateChange(DtaSrcCRUDDetail.DataSet.State);
end;

procedure TOrderCRUDView.DtaSrcCRUDMasterStateChange(Sender: TObject);
begin
  inherited;
  DatasetStateChange(DtaSrcCRUDMaster.DataSet.State);
end;

procedure TOrderCRUDView.DatasetStateChange(Value:TDataSetState);
begin
  inherited;
  case Value of
    dsInactive: StatusBar1.SimpleText   := 'DataSet State: dsInactive';
    dsBrowse: StatusBar1.SimpleText     := 'DataSet State: dsBrowse';
    dsEdit: StatusBar1.SimpleText       := 'DataSet State: dsEdit';
    dsInsert: StatusBar1.SimpleText     := 'DataSet State: dsInsert';
    dsSetKey: StatusBar1.SimpleText     := 'DataSet State: dsSetKey';
    dsCalcFields: StatusBar1.SimpleText := 'DataSet State: dsCalcFields';
    dsFilter: StatusBar1.SimpleText     := 'DataSet State: dsFilter';
    dsNewValue: StatusBar1.SimpleText   := 'DataSet State: dsNewValue';
    dsOldValue: StatusBar1.SimpleText   := 'DataSet State: dsOldValue';
    dsCurValue: StatusBar1.SimpleText   := 'DataSet State: dsCurValue';
    dsBlockRead: StatusBar1.SimpleText  := 'DataSet State: dsBlockRead';
    dsInternalCalc: StatusBar1.SimpleText := 'DataSet State: dsInternalCalc';
    dsOpening: StatusBar1.SimpleText := 'DataSet State: dsOpening';
  end;
end;



procedure TOrderCRUDView.FormCreate(Sender: TObject);
begin
  FEntity := TBaseEntity.Create;
  FRepository := TModelOrderRepository.New(TOrder(FEntity));
  FRepositoryDetail :=  TModelOrderItemRepository.New(TOrderItems.Create);
  SetDataSourceDefaultView(DtaSrcCRUDMaster);

  inherited;

  FTotalOrderDS := TDataSource.Create(Self);

  PgeCtrView.ActivePage         := TabSht_ListRecordsMasterDetail;
  TabSht_ListRecords.TabVisible := False;
  TabSht_FileRecord.TabVisible  := False;

  if Assigned(FRepository) and Assigned(FRepositoryDetail) then
  begin
    FRepository.List(GetDataSourceDefaultView);
    FRepositoryDetail.LinkQuery(GetDataSourceDefaultView);
    FRepositoryDetail.List(DtaSrcCRUDDetail);
  end;

end;

procedure TOrderCRUDView.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(FTotalOrderDS) then
    FreeAndNil(FTotalOrderDS);
end;

end.
