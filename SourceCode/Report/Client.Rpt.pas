unit Client.Rpt;

interface

uses
  Model.Client.Repository,
  Client.Entity,
  Base.Model.Rpt,
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs,
  Data.DB, Data.Win.ADODB,
  frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF;

type
  TClientlRpt = class(TBaseModelRpt)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  ClientlRpt: TClientlRpt;

implementation

{$R *.dfm}

procedure TClientlRpt.FormCreate(Sender: TObject);
begin
  inherited;
  FRepository := TModelClientRepository.New(TClient.Create);

  inherited;

end;

end.
