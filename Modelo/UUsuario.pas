unit UUsuario;

interface

uses UDMPrincipal, SqlExpr, SysUtils;

type
  TUsuario = class
  private
    FIdPerfil: Integer;
    FLogin: string;
    FSenha: string;
    procedure setIdPerfil(const Value: Integer);
    procedure setLogin(const Value: string);
    procedure setSenha(const Value: string);
  public
    property login: string read FLogin write setLogin;
    property senha: string read FSenha write setSenha;
    property idPerfil: Integer read FIdPerfil write setIdPerfil;
    function efetuarLogin(const usuario: TUsuario): Boolean;
  end;

implementation

uses ULogin, DB;

{ TUsuario }

function TUsuario.efetuarLogin(const usuario: TUsuario): Boolean;
var
  qryLogin: TSQLQuery;
const
  PERFIL_GERENTE = 1;
  PERFIL_OPERADOR = 2;
begin
  qryLogin := TSQLQuery.create(nil);
  qryLogin.SQLConnection := dmPrincipal.sqlConnPrincipal;
  qryLogin.SQL.Add('select p.id, p.perfil from permissao p, usuario u ');
  qryLogin.SQL.Add('where p.id = u.id_perfil and u.login =:login and u.senha =:senha');
  qryLogin.ParamByName('login').AsString := usuario.login;
  qryLogin.ParamByName('senha').AsString := usuario.senha;
  try
    qryLogin.Open;
    if (qryLogin.FieldByName('perfil').AsString <> EmptyStr) then
    begin
      usuario.idPerfil := qryLogin.FieldByName('id').AsInteger;
      result := true;
    end
    else
      result := false;
  finally
    FreeAndNil(qryLogin);
  end;
end;

procedure TUsuario.setIdPerfil(const Value: Integer);
begin
  FIdPerfil := Value;
end;

procedure TUsuario.setLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TUsuario.setSenha(const Value: string);
begin
  FSenha := Value;
end;

end.

