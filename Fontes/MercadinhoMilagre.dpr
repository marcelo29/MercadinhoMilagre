program MercadinhoMilagre;

uses
  Forms,
  ULogin in 'ULogin.pas' {frmLogin},
  UDMPrincipal in 'UDMPrincipal.pas' {dmPrincipal: TDataModule},
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
