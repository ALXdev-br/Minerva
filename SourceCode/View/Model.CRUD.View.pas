unit Model.CRUD.View;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Model.View, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.TitleBarCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB,
  Data.Win.ADODB;

type
  TModelCRUDView = class(TBaseModelView)
    StatusBar1: TStatusBar;
    TitleBarPanel1: TTitleBarPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    BtnRecordUpdate: TButton;
    CategoryPanel2: TCategoryPanel;
    BtnPrint: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BtnRecordFind: TButton;
    BtnClose: TButton;
    StatusBar2: TStatusBar;
    Panel2: TPanel;
    PgeCtrView: TPageControl;
    TabSht_ListRecords: TTabSheet;
    Action1: TAction;
    Action11: TMenuItem;
    Find1: TMenuItem;
    Update1: TMenuItem;
    N1: TMenuItem;
    Delete1: TMenuItem;
    N2: TMenuItem;
    Print1: TMenuItem;
    Print2: TMenuItem;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DtaSrcModelCRUDView: TDataSource;
    TabSht_ListRecordsMasterDetail: TTabSheet;
    DBNavCRUDDetail: TDBNavigator;
    Splitter1: TSplitter;
    DBGrdCRUDDetail: TDBGrid;
    PnlCRUDMaster: TPanel;
    DBGrdCRUDMaster: TDBGrid;
    DBNavCRUDMaster: TDBNavigator;
    TabSht_FileRecord: TTabSheet;
    DtaSrcCRUDDetail: TDataSource;
    DtaSrcCRUDMaster: TDataSource;
    CatPnGrpPnlDelete: TPanel;
    BtnRecordDelete: TButton;
    BtnRecordSave: TButton;
    ActRecordSave: TAction;
    BtnRecordNew: TButton;
    procedure ActRecordNewExecute(Sender: TObject);
    procedure ActRecordUpdateExecute(Sender: TObject);
    procedure ActRecordDeleteExecute(Sender: TObject);
    procedure ActRecordFindExecute(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrdCRUDMasterTitleClick(Column: TColumn);
    procedure DBGrdCRUDDetailTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrdCRUDMasterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrdCRUDDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActRecordSaveExecute(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    procedure DtaSrcCRUDMasterDataChange(Sender: TObject; Field: TField);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
    FSearchField:string;
    FColumnTitleClicked:string;
    FValueSearch:string;
    FUseDataControls:Boolean;
    FDataSourceDefaultView:TDataSource;
    procedure DBGrid_TitleClick(Column: TColumn);
  published
    //
    procedure SetSearchField(Value: string);
    procedure SetColumnTitleClicked(Value: string);
    procedure SetValueSearch(Value: string);
    procedure SetUseDataControls(Value:Boolean);
    procedure SetDataSourceDefaultView(DataSourceDefault:TDataSource);
    function GetDataSourceDefaultView:TDataSource;
    procedure SearchRecord; virtual;
  public
    { Public declarations }
  end;

//var
//  ModelCRUDView: TModelCRUDView;

implementation

{$R *.dfm}

procedure TModelCRUDView.FormCreate(Sender: TObject);
begin
  inherited;
  FUseDataControls := True;
end;

function TModelCRUDView.GetDataSourceDefaultView: TDataSource;
begin
  Result := FDataSourceDefaultView;
end;

procedure TModelCRUDView.SearchRecord;
begin
  //
end;

procedure TModelCRUDView.SetColumnTitleClicked(Value: string);
begin
  FColumnTitleClicked := Value;
end;

procedure TModelCRUDView.SetDataSourceDefaultView(DataSourceDefault: TDataSource);
begin
  FDataSourceDefaultView := DataSourceDefault;
end;

procedure TModelCRUDView.SetSearchField(Value: string);
begin
  FSearchField := Value;
end;

procedure TModelCRUDView.SetUseDataControls(Value: Boolean);
begin
  FUseDataControls := Value;
end;

procedure TModelCRUDView.SetValueSearch(Value: string);
begin
  FValueSearch := Value;
end;

procedure TModelCRUDView.ActCloseExecute(Sender: TObject);
begin
  if Assigned(FDataSourceDefaultView) then
  begin
    if FDataSourceDefaultView.DataSet.State in [dsEdit, dsInsert] then
    begin
      if MessageDlg('New information entered or edited that is not saved.'#13#10'Do you want to continue?'
                  , mtConfirmation,[mbYes, mbNo], 0, mbNo) = mrNo then
        begin
           Exit;
        end
      else
        begin
          FDataSourceDefaultView.DataSet.Cancel;
        end;
    end;
  end;
  inherited;
end;

procedure TModelCRUDView.ActRecordDeleteExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Confirm Delete record?', mtConfirmation,[mbYes, mbNo], 0, mbNo) = mrYes then
  begin
    if FUseDataControls then
      if Assigned(FDataSourceDefaultView) then
      begin
        FDataSourceDefaultView.DataSet.Delete;
      end;
  end;
end;

procedure TModelCRUDView.ActRecordFindExecute(Sender: TObject);
begin
  inherited;
   if FSearchField = '' then
  begin
    StatusBar1.SimpleText := 'Click on title column on grid for select field for search.';
    ShowMessage(StatusBar1.SimpleText);
  end
  else
  begin
    StatusBar1.SimpleText := Format('Search for [%s][%s][%s] Searching reacord...', [ FColumnTitleClicked, FSearchField, Edit1.Text]);
    if not FDataSourceDefaultView.DataSet.Locate(FSearchField, FValueSearch,[loCaseInsensitive,loPartialKey]) then
    begin
      StatusBar1.SimpleText := Format('Search for [%s][%s][%s] Record not found! [Tips] Use: %%<text to search>', [ FColumnTitleClicked, FSearchField, Edit1.Text]);
      MessageDlg('Record not found!'#13#10'[Tips] Use: %<text to search>',mtInformation,[mbOK], 0);
      StatusBar1.SimpleText := ''
    end
    else
      StatusBar1.SimpleText := Format('Search for [%s][%s][%s] Record found! ', [ FColumnTitleClicked, FSearchField, Edit1.Text]);
  end;

  if Edit1.CanFocus then
    Edit1.SetFocus;
end;


procedure TModelCRUDView.ActRecordNewExecute(Sender: TObject);
begin
  inherited;
  if FUseDataControls then
    if Assigned(FDataSourceDefaultView) then
    begin
      if DBGrid1.CanFocus then
        DBGrid1.SetFocus;

      FDataSourceDefaultView.DataSet.Append;
    end;
end;

procedure TModelCRUDView.ActRecordSaveExecute(Sender: TObject);
var
  varActionStr:string;
  varId:Variant;
begin
  inherited;
  varActionStr := '';
  if FUseDataControls then
  begin
    if Assigned(FDataSourceDefaultView) then
    begin
      case FDataSourceDefaultView.DataSet.State of
        dsEdit:
         begin
           varActionStr := 'Update';
         end;
        dsInsert:
         begin
           varActionStr := 'New';
         end;
       end;

      if varActionStr <> '' then
      begin
        if MessageDlg(Format('Confirm %s record? ',[varActionStr]),mtConfirmation,[mbYes, mbNo], 0, mbNo) = mrYes then
        begin
           FDataSourceDefaultView.DataSet.Post;
           varId := FDataSourceDefaultView.DataSet.FindField('cod_order').Value;
           FEntity.ID := varId;
        end;
       end;
    end;
  end;
end;

procedure TModelCRUDView.ActRecordUpdateExecute(Sender: TObject);
begin
  inherited;
  if FUseDataControls then
  begin
     FDataSourceDefaultView.DataSet.Edit;
  end;
end;

procedure TModelCRUDView.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  DBGrid_TitleClick(Column);
end;

procedure TModelCRUDView.DBGrdCRUDDetailTitleClick(Column: TColumn);
begin
  inherited;
  DBGrid_TitleClick(Column);
end;

procedure TModelCRUDView.DBGrdCRUDMasterTitleClick(Column: TColumn);
begin
  inherited;
  DBGrid_TitleClick(Column);
end;

procedure TModelCRUDView.DBGrid_TitleClick(Column: TColumn);
begin
  FSearchField := Column.FieldName;
  FColumnTitleClicked := Column.Title.Caption;
  StatusBar1.SimpleText := Format('Search for [%s][%s]', [FColumnTitleClicked, FSearchField]);
  if Edit1.CanFocus then
    Edit1.SetFocus;
end;

procedure TModelCRUDView.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbFirst: ;
    nbPrior: ;
    nbNext: ;
    nbLast: ;
    nbInsert: ;
    nbDelete: ;
    nbEdit: ;
    nbPost: ;
    nbCancel: ;
    nbRefresh: ;
    nbApplyUpdates: ;
    nbCancelUpdates: ;
  end;
end;

procedure TModelCRUDView.DtaSrcCRUDMasterDataChange(Sender: TObject;
  Field: TField);
var
  debugOldValue,
  debugCurValue,
  debugNewValue:Variant;
begin
  inherited;

end;

procedure TModelCRUDView.Edit1Exit(Sender: TObject);
begin
  inherited;
    FValueSearch := Edit1.Text;
end;

procedure TModelCRUDView.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    if BtnRecordFind.CanFocus then
      BtnRecordFind.SetFocus;
    BtnRecordFind.Click;
  end;
end;

procedure TModelCRUDView.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DOWN) then
  begin
    with DBGrid1.DataSource do
    begin
      if (DataSet.State = dsEdit) then
       DataSet.Post;
      DataSet.DisableControls;
      DataSet.Next;

      if DataSet.EOF then
        Key := 0
      else
        DataSet.Prior;
      DataSet.EnableControls;
    end;
  end;
end;

procedure TModelCRUDView.DBGrdCRUDMasterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DOWN) then
  begin
    with DBGrdCRUDMaster.DataSource do
    begin
      if (  DataSet.State = dsEdit) then
       DataSet.Post;
      DataSet.DisableControls;
      DataSet.Next;

      if DataSet.EOF then
        Key := 0
      else
        DataSet.Prior;
      DataSet.EnableControls;
    end;
  end;
end;

procedure TModelCRUDView.DBGrdCRUDDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DOWN) then
  begin
    with DBGrdCRUDDetail.DataSource do
    begin
      if (  DataSet.State = dsEdit) then
       DataSet.Post;
      DataSet.DisableControls;
      DataSet.Next;

      if DataSet.EOF then
        Key := 0
      else
        DataSet.Prior;
      DataSet.EnableControls;
    end;
  end;
end;



end.
