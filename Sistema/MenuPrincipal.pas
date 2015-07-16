//Menu principal falta desarrollarlo. Hay que saber que usuario esta operando.
unit MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, jpeg, ListadoUsuarios, Bases, AltaProducto,
  ListadoProductos, AltaEvento, ListadoEventosActivos, GenerarPedido,
  ListadoPedidos, FranjaHoraria, ReportePorFechas;

type
  TForm4 = class(TForm)
    MainMenu1: TMainMenu;
    Men1: TMenuItem;
    Pedidos1: TMenuItem;
    ListarProductos1: TMenuItem;
    Pedidos2: TMenuItem;
    GenerarPedido1: TMenuItem;
    Salir1: TMenuItem;
    Usuarios1: TMenuItem;
    Dardealtaproducto1: TMenuItem;
    Reportes1: TMenuItem;
    Generarreportediario1: TMenuItem;
    Informaciondelprograma1: TMenuItem;
    Salir2: TMenuItem;
    Image1: TImage;
    Listarusuarios1: TMenuItem;
    Eventos1: TMenuItem;
    Listareventosactivos1: TMenuItem;
    Dardealtaunevento1: TMenuItem;
    ListarPedidos1: TMenuItem;
    Generarreporteentrefechas1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure Listarusuarios1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Dardealtaproducto1Click(Sender: TObject);
    procedure ListarProductos1Click(Sender: TObject);
    procedure Dardealtaunevento1Click(Sender: TObject);
    procedure Listareventosactivos1Click(Sender: TObject);
    procedure GenerarPedido1Click(Sender: TObject);
    procedure ListarPedidos1Click(Sender: TObject);
    procedure Generarreportediario1Click(Sender: TObject);
    procedure Generarreporteentrefechas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Nombre,Apellido,Tipo,evento: String;

implementation

uses UsuarioRegistrado;

{$R *.dfm}

procedure TForm4.Dardealtaproducto1Click(Sender: TObject);
begin
  Form7.Show;
end;

procedure TForm4.Dardealtaunevento1Click(Sender: TObject);
begin
  Form9.Show;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin

  Nombre:= DM.ADOQuery1.FieldByName('Nombre').AsString;
  Apellido:= DM.ADOQuery1.FieldByName('Apellido').AsString;
  if not (form3.dblookupcombobox1.keyvalue = Null) then
     evento:=form3.dblookupcombobox1.keyvalue;
  Tipo:= DM.ADOQuery1.FieldByName('Tipo').AsString;
  Form4.Caption:= 'SPR - Sistema de pedidos y reportes / Usuario: '+Nombre+' '+Apellido + ' / Evento: ' + evento;
  if Tipo = 'Usuario común' then begin
    Dardealtaproducto1.Enabled:=false;
    Eventos1.Enabled:=false;
    Reportes1.Enabled:=false
    end
    else begin
      Dardealtaproducto1.Enabled:=true;
      Eventos1.Enabled:=true;
      Reportes1.Enabled:=true
      end;

 if evento = '<Elije un evento>' then begin
    GenerarPedido1.Enabled:=false;
    ListarPedidos1.Enabled:=False;
    GenerarReporteDiario1.Enabled:=false;
    end
    else begin
      GenerarPedido1.Enabled:=true;
       ListarPedidos1.Enabled:=true;
       GenerarReporteDiario1.Enabled:=true;
     end;

end;

procedure TForm4.GenerarPedido1Click(Sender: TObject);
begin
  {DM.Pedidos.Append;
  DM.Pedidos.FieldByName('Fecha').AsDateTime:=Now;
  DM.Pedidos.Post; }
  Form11.showModal;
  if form11.ModalResult = mrCancel then
    DM.Pedidos.Delete
end;

procedure TForm4.Generarreportediario1Click(Sender: TObject);
begin
  Form15.show;
end;

procedure TForm4.Generarreporteentrefechas1Click(Sender: TObject);
begin
 Form16.Show;
end;

procedure TForm4.Listareventosactivos1Click(Sender: TObject);
begin
  Form10.show;
end;

procedure TForm4.ListarPedidos1Click(Sender: TObject);
begin
  Form13.Show;
end;

procedure TForm4.ListarProductos1Click(Sender: TObject);
begin
  Form8.Show;
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
