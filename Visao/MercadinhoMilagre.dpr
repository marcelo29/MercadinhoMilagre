program MercadinhoMilagre;

uses
  Forms,
  ULogin in 'ULogin.pas' {frmLogin},
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal},
  UDMPrincipal in '..\Modelo\UDMPrincipal.pas' {dmPrincipal: TDataModule},
  UControleUsuario in '..\Controle\UControleUsuario.pas',
  UUsuario in '..\Modelo\UUsuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
