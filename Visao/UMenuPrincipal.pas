unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UUsuario;

type
  TfrmMenuPrincipal = class(TForm)
    menuPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentacao1: TMenuItem;
    Relatorios1: TMenuItem;
    Graficos1: TMenuItem;
    Utilitrios1: TMenuItem;
    Funcionarios: TMenuItem;
    procedure FormShow(Sender: TObject);
  private
    FIdperfil: Integer;
    procedure setIdPerfil(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property idPerfil: Integer read FIdperfil write setIdPerfil;
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses ULogin;

{$R *.dfm}

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
const
  PERFIL_OPERADOR = 2;
begin
  // avalia nivel de permissao
  if (idPerfil = PERFIL_OPERADOR) then
  begin
    Cadastro1.Enabled := False;
    Relatorios1.Enabled := False;
    Graficos1.Enabled := False;
  end;
end;

procedure TfrmMenuPrincipal.setIdPerfil(const Value: Integer);
begin
  FIdperfil := Value;
end;

end.

