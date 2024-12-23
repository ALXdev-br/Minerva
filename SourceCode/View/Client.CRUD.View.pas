unit Client.CRUD.View;

interface

uses
  Model.Client.Repository,
  Client.Entity,
  Model.CRUD.View,
  Client.Rpt,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Data.DB,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.TitleBarCtrls, Data.Win.ADODB;

type
  TClientCRUDView = class(TModelCRUDView)
    procedure FormCreate(Sender: TObject);
    procedure ActRecordPrintExecute(Sender: TObject);
    procedure ActRecordSaveExecute(Sender: TObject);
  private
    procedure SearchRecord; virtual;
  public
    { Public declarations }
  end;

//var
//  ClientCRUDView: TClientCRUDView;

implementation

{$R *.dfm}

procedure TClientCRUDView.ActRecordPrintExecute(Sender: TObject);
var
  ClientRpt: TClientlRpt;
begin
  inherited;
  ClientRpt:= TClientlRpt.Create(Self);
  try
     ClientRpt. frxDBDataset1.DataSource := DtaSrcModelCRUDView;
     ClientRpt.frxReport1.ShowReport();
  finally
    if Assigned(ClientRpt) then
      FreeAndNil(ClientRpt);
  end;

end;

procedure TClientCRUDView.ActRecordSaveExecute(Sender: TObject);
var
  varId:Variant;
begin
  inherited;
  varId := DtaSrcModelCRUDView.DataSet.FieldByName('cod_client').Value;
  if Assigned(FEntity) then
    FEntity.ID := varId;
end;

procedure TClientCRUDView.FormCreate(Sender: TObject);
begin
  FRepository := TModelClientRepository.New(TClient.Create);
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

procedure TClientCRUDView.SearchRecord;
begin
  ActRecordFind.Execute;
end;

end.
