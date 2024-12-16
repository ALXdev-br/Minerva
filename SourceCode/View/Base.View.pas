unit Base.View;

interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TBaseView = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseView: TBaseView;

implementation

{$R *.dfm}

procedure TBaseView.FormCreate(Sender: TObject);
begin
  //
end;

end.
