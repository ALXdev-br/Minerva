unit Item.CRUD.View;

interface

uses
  Model.Item.Repository,
  Item.Entity,
  Model.CRUD.View,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.TitleBarCtrls, Data.Win.ADODB;

type
  TItemCRUDView = class(TModelCRUDView)
    procedure FormCreate(Sender: TObject);
    procedure ActRecordPrintExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  ItemCRUDView: TItemCRUDView;

implementation

{$R *.dfm}

procedure TItemCRUDView.ActRecordPrintExecute(Sender: TObject);
begin
  inherited;
    ShowMessage('Sorry! '+#13#10+
              'Report ITEM unavailable.'+ #13#10 +
              'Item available in the next version of the product.');
end;

procedure TItemCRUDView.FormCreate(Sender: TObject);
begin
  FRepository := TModelItemRepository.New(TItem.Create);
  SetDataSourceDefaultView(DtaSrcModelCRUDView);
  inherited;

  PgeCtrView.ActivePage                     := TabSht_ListRecords;
  TabSht_ListRecordsMasterDetail.TabVisible := False;
  TabSht_FileRecord.TabVisible              := False;

  if Assigned(FRepository) then
  begin
    FRepository.List(GetDataSourceDefaultView);
  end;
end;

end.
