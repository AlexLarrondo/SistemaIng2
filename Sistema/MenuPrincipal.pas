//Menu principal falta desarrollarlo. Hay que saber que usuario esta operando.
unit MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, jpeg;

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
    Dardebajausuario1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Salir1Click(Sender: TObject);
begin
{Permite al usuario salir del sistema, atajo Alt+S}
  if (MessageDlg('�Est� seguro que desea cerrar sesi�n y salir del sistema?',mtWarning,[mbYes,mbNo],0)= mryes) then
    Close;
end;

end.
