//Menu principal falta desarrollarlo. Hay que saber que usuario esta operando.
unit MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, jpeg, ListadoUsuarios, Bases;

type
  TForm4 = class(TForm)
    MainMenu1: TMainMenu;
    Men1: TMenuItem;
    Pedidos1: TMenuItem;
    ListarProductos1: TMenuItem;
    Pedidos2: TMenuItem;
    GenerarPedido1: TMenuItem;
    Anulartickets1: TMenuItem;
    Salir1: TMenuItem;
    Usuarios1: TMenuItem;
    Dardealtaproducto1: TMenuItem;
    Dardebajaproducto1: TMenuItem;
    Modificarproducto1: TMenuItem;
    Listarpedidos1: TMenuItem;
    Modificarunpedido1: TMenuItem;
    Reportes1: TMenuItem;
    Generarreportediario1: TMenuItem;
    Informaciondelprograma1: TMenuItem;
    Salir2: TMenuItem;
    Image1: TImage;
    Listarusuarios1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure Listarusuarios1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Nombre,Apellido,Tipo: String;

implementation

{$R *.dfm}

procedure TForm4.FormActivate(Sender: TObject);
begin
 Nombre:= DM.ADOQuery1.FieldByName('Nombre').AsString;
 Apellido:= DM.ADOQuery1.FieldByName('Apellido').AsString;
end;

procedure TForm4.Listarusuarios1Click(Sender: TObject);
begin
  Form6.Show;
end;

procedure TForm4.Salir1Click(Sender: TObject);
begin
  if (MessageDlg('¿Está seguro que desea cerrar sesión y salir del sistema?',mtWarning,[mbYes,mbNo],0)= mryes) then
    Close;
end;

end.
