unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    edtUsuario: TEdit;
    btnConfirmar: TButton;
    Label2: TLabel;
    edtSenha: TEdit;
    btnCancelar: TButton;
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
begin
  // efetua o login
end;

end.

