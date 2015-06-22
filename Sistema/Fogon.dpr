program Fogon;

uses
  Forms,
  Bienvenida in 'Bienvenida.pas' {Form1},
  Bases in 'Bases.pas' {DM: TDataModule},
  Registrarse in 'Registrarse.pas' {Form2},
  UsuarioRegistrado in 'UsuarioRegistrado.pas' {Form3},
  MenuPrincipal in 'MenuPrincipal.pas' {Form4},
  RecuperarContraseņa in 'RecuperarContraseņa.pas' {Form5},
  ListadoUsuarios in 'ListadoUsuarios.pas' {Form6},
  AltaProducto in 'AltaProducto.pas' {Form7},
  ListadoProductos in 'ListadoProductos.pas' {Form8},
  AltaEvento in 'AltaEvento.pas' {Form9},
  ListadoEventosActivos in 'ListadoEventosActivos.pas' {Form10},
  GenerarPedido in 'GenerarPedido.pas' {Form11},
  Ticket in 'Ticket.pas' {Form12};

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
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.Run;
end.
