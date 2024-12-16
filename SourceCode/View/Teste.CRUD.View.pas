unit Teste.CRUD.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model.CRUD.View, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.TitleBarCtrls, Vcl.ComCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB;

type
  TTesteCRUDView = class(TModelCRUDView)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  TesteCRUDView: TTesteCRUDView;

implementation

{$R *.dfm}

end.
