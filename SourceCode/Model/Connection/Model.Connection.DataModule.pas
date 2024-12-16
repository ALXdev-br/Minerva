unit Model.Connection.DataModule;

interface

uses
  System.IniFiles,
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TModelConnectionDM = class(TDataModule)
  private
    { Private declarations }
    FPassword:string;
    FUserId:string;
    FDatabase:string;
    FServer:string;
    FExePath:string;
    FAppName:string;
  public
    { Public declarations }
    procedure SetExePath(Value:string);
    function GetExePath:String;
    property UserId:string   read FUserId   write FUserId;
    property Password:string read FPassword write FPassword;
    property Database:string read FDatabase write FDatabase;
    property Server:string   read FServer   write FServer;
    property AppName:string  read FAppName  write FAppName;
    procedure ReadConfigIni;
  end;

var
  ModelConnectionDM: TModelConnectionDM;

implementation

{$R *.dfm}

{ TDataModule1 }

function TModelConnectionDM.GetExePath: String;
begin
  Result := FExePath;
end;

procedure TModelConnectionDM.ReadConfigIni;
var
  Ini:TIniFile;
  sPathIni:string;
begin
  sPathIni:= Format('%s%s',[FExePath, ChangeFileExt(FAppName,'.ini')]);
  Ini := TIniFile.Create(sPathIni);
  try
    FPassword := Ini.ReadString('DATABASE_SECURITY','Password', '');
    FUserId   := Ini.ReadString('DATABASE_SECURITY','UserId'  , '');
    FDatabase := Ini.ReadString('DATABASE_SECURITY','Database', '');
    FServer   := Ini.ReadString('DATABASE_SECURITY','Server'  , '');
  finally
    Ini.free;
  end;
end;

procedure TModelConnectionDM.SetExePath(Value: string);
begin
  FExePath := Value;
end;

end.
