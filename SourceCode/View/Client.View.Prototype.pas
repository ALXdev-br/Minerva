unit Client.View.Prototype;

interface

uses
  Base.Model.View,
  Model.Interfaces.Data,
  Model.Interfaces.Entity,
  Model.Client.Repository,
  Client.Entity,
  Base.Entity,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.Actions,
  Vcl.ActnList;

type
  TClientViewPrototype = class(TBaseModelView)
    N1: TMenuItem;
    New1: TMenuItem;
    Update1: TMenuItem;
    Find1: TMenuItem;
    Delete1: TMenuItem;
    Delete2: TMenuItem;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button2: TButton;
    Button1: TButton;
    DBNavigator1: TDBNavigator;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientViewPrototype: TClientViewPrototype;

implementation

{$R *.dfm}

procedure TClientViewPrototype.Button1Click(Sender: TObject);
begin
  inherited;
  if Assigned(FRepository) then
   FRepository.List(DataSource1);
end;

procedure TClientViewPrototype.Button2Click(Sender: TObject);
begin
  inherited;
  if Assigned(FRepository) then
    FRepository.ListFields(Edit1.Text, DataSource1);
end;

procedure TClientViewPrototype.FormCreate(Sender: TObject);
begin
  //inherited SetEntity(TClient.Create);
  //SetEntity(TClient.Create);
   FRepository := TModelClientRepository.New(TClient.Create);
   inherited;
end;


end.
