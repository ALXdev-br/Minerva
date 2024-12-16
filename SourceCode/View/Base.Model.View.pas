unit Base.Model.View;

interface

uses
  Base.View,
  Model.Interfaces.Data,
  Base.Entity,
  Model.Interfaces.Entity,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.Menus, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, System.Actions, Vcl.ActnList;

type
  TBaseModelView = class(TBaseView)
    MainMnuModelBase: TMainMenu;
    MnuFile: TMenuItem;
    MnuFileClose: TMenuItem;
    ActListModelBase: TActionList;
    ActClose: TAction;
    ActRecordNew: TAction;
    ActRecordUpdate: TAction;
    ActRecordFind: TAction;
    ActRecordDelete: TAction;
    ActRecordPrint: TAction;
    procedure ActCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  BaseModelView: TBaseModelView;

implementation

{$R *.dfm}

procedure TBaseModelView.ActCloseExecute(Sender: TObject);
begin
  inherited;
  Self.close;
end;


procedure TBaseModelView.FormCreate(Sender: TObject);
begin
  inherited;
 //
end;

procedure TBaseModelView.SetEntity(aEntity: TBaseEntity);
begin
  FEntity := aEntity;
end;

end.
