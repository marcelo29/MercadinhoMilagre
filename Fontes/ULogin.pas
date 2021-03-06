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
    function idPerfil: Integer;
    procedure setIdPerfil(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property PropIdPerfil: Integer read idPerfil write setIdPerfil;
  end;

var
  frmLogin: TfrmLogin;



implementation

uses UDMPrincipal, UMenuPrincipal;

{$R *.dfm}

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  // limpa os campos
  edtUsuario.Clear;
  edtSenha.Clear;
end;

function TfrmLogin.idPerfil: Integer;
begin
  result := idPerfil;
end;

procedure TfrmLogin.setIdPerfil(const Value: Integer);
begin
  if (Value <> 0) then
    PropIdPerfil := Value;
end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
const
  PERFIL_GERENTE = 0;
  PERFIL_OPERADOR = 1;
begin
  // efetua o login
  if (Trim(edtUsuario.Text) <> EmptyStr) and (Trim(edtSenha.Text) <> EmptyStr) then
  begin
    try
      qryLogin.ParamByName('LOGIN').AsString := LowerCase(Trim(edtUsuario.Text));
      qryLogin.ParamByName('SENHA').AsString := LowerCase(Trim(edtSenha.Text));
      try
        qryLogin.Open;
        if (qryLoginPERFIL.AsString <> EmptyStr) then
        begin
          if qryLoginPERFIL.AsString = 'Gerente' then
            setIdPerfil(PERFIL_GERENTE)
          else
            setIdPerfil(PERFIL_OPERADOR);

          if (frmMenuPrincipal = nil) then
            frmMenuPrincipal := TfrmMenuPrincipal.Create(Self);
          frmMenuPrincipal.ShowModal;
        end
        else
          ShowMessage('Usu�rio ou senha inv�lidos.');
      finally
        qryLogin.Close;
        FreeAndNil(frmMenuPrincipal);
      end;
    except on E: Exception do
        ShowMessage(E.Message);
    end;
  end
  else
    ShowMessage('Campos em branco, preencha os campos.');
end;

end.

