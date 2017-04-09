unit UDMPrincipal;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, Dialogs;

type
  TdmPrincipal = class(TDataModule)
    sqlConnPrincipal: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  try
    sqlConnPrincipal.Connected := true;
  except on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  try
    sqlConnPrincipal.Connected := False;
  except on E: Exception do
      ShowMessage(E.Message);
  end;
end;

end.

