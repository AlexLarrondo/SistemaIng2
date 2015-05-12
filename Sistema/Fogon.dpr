program Fogon;

uses
  Forms,
  Bienvenida in 'Bienvenida.pas' {Form1},
  Bases in 'Bases.pas' {DM: TDataModule},
  Registrarse in 'Registrarse.pas' {Form2},
  UsuarioRegistrado in 'UsuarioRegistrado.pas' {Form3},
  MenuPrincipal in 'MenuPrincipal.pas' {Form4},
  RecuperarContraseņa in 'RecuperarContraseņa.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
