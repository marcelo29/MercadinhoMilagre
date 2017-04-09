unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FMTBcd, DB, SqlExpr;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    edtUsuario: TEdit;
    btnConfirmar: TButton;
    Label2: TLabel;
    edtSenha: TEdit;
    btnCancelar: TButton;
    qryLogin: TSQLQuery;
    qryLoginPERFIL: TStringField;
    qryLoginID: TIntegerField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses UDMPrincipal, UMenuPrincipal, UControleUsuario, UUsuario;

{$R *.dfm}

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  // limpa os campos
  edtUsuario.Clear;
  edtSenha.Clear;
end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
var
  usuario: TUsuario;
  controleUsuario: TControleUsuario;
begin
  usuario := TUsuario.Create;
  usuario.login := edtUsuario.Text;
  usuario.senha := edtSenha.Text;

  controleUsuario := TControleUsuario.create;

  if controleUsuario.efetuarLogin(usuario) then
  begin
    if frmMenuPrincipal = nil then
      frmMenuPrincipal := TfrmMenuPrincipal.Create(Self);
    try
      frmMenuPrincipal.idPerfil := usuario.idPerfil;
      frmMenuPrincipal.ShowModal;
    finally
      FreeAndNil(frmMenuPrincipal);
    end;
  end
  else
    ShowMessage('Não foi possivel efetuar o login.');
end;

end.

