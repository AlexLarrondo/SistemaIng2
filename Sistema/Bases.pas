unit Bases;
 //WHERE P.Fecha >= :Fecha1 and P.Fecha <= :Fecha2 AND P.Estado = 'Facturado' And P.Evento = :Evento
//Data Module
interface

uses
  SysUtils, Classes, DB, ADODB, FMTBcd, SqlExpr;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Usuarios: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    UsuariosDNI: TIntegerField;
    UsuariosNombre: TWideStringField;
    UsuariosApellido: TWideStringField;
    UsuariosTipo: TWideStringField;
    UsuariosPass: TWideStringField;
    UsuariosEstado: TWideStringField;
    Proveedores: TADOTable;
    DataSource2: TDataSource;
    Productos: TADOTable;
    DataSource3: TDataSource;
    UsuariosActivos: TADOQuery;
    ProductosNombre: TWideStringField;
    ProductosCantidad: TIntegerField;
    ProductosPreciocompra: TBCDField;
    ProductosPrecioventa: TBCDField;
    ProductosProveedor: TWideStringField;
    ProductosActivos: TADOQuery;
    ProductosEstado: TWideStringField;
    DataSource4: TDataSource;
    ProductosActivosNombre: TWideStringField;
    ProductosActivosCantidad: TIntegerField;
    ProductosActivosPreciocompra: TBCDField;
    ProductosActivosPrecioventa: TBCDField;
    ProductosActivosProveedor: TWideStringField;
    ProductosActivosEstado: TWideStringField;
    UsuariosActivosDNI: TIntegerField;
    UsuariosActivosNombre: TWideStringField;
    UsuariosActivosApellido: TWideStringField;
    UsuariosActivosTipo: TWideStringField;
    UsuariosActivosPass: TWideStringField;
    UsuariosActivosEstado: TWideStringField;
    DataSource5: TDataSource;
    Eventos: TADOTable;
    EventosActivos: TADOQuery;
    DataSource6: TDataSource;
    ADOQuery1DNI: TIntegerField;
    ADOQuery1Nombre: TWideStringField;
    ADOQuery1Apellido: TWideStringField;
    ADOQuery1Tipo: TWideStringField;
    ADOQuery1Pass: TWideStringField;
    ADOQuery1Estado: TWideStringField;
    EventosFecha_Final: TDateTimeField;
    EventosNombre: TWideStringField;
    EventosFecha_Inicio: TDateTimeField;
    DS_EventosActivos: TDataSource;
    EvitarSuperponer: TADOQuery;
    ProductoPedido: TADOTable;
    DS_ProductoPedido: TDataSource;
    Pedidos: TADOTable;
    PedidosId: TAutoIncField;
    PedidosFecha: TDateTimeField;
    PedidosPrecio_Total: TBCDField;
    PedidosDNI: TIntegerField;
    PedidosEvento: TWideStringField;
    ProductoPedidoId: TAutoIncField;
    ProductoPedidoCantidad: TIntegerField;
    ProductoPedidoPrecio: TBCDField;
    ProductoPedidoNombreProd: TWideStringField;
    ProdPedidoParaPedido: TADOQuery;
    DS_PPPP: TDataSource;
    ProdPedidoParaPedidoId: TIntegerField;
    ProdPedidoParaPedidoCantidad: TIntegerField;
    ProdPedidoParaPedidoPrecio: TBCDField;
    ProdPedidoParaPedidoNombreProd: TWideStringField;
    BorrarEventos: TADOQuery;
    Tciket: TADOQuery;
    DS_Ticket: TDataSource;
    DS_Pedidos: TDataSource;
    PedidosVendedor: TStringField;
    PedidosVen1: TStringField;
    PedidosEstado: TWideStringField;
    ReporteHora: TADOQuery;
    ReporteFecha: TADOQuery;
    ReporteHoraNombreProd: TWideStringField;
    ReporteHoraCantProdutos: TFloatField;
    ReporteHoraPrecioXProd: TBCDField;
    TciketPrecio_Total: TBCDField;
    TciketEvento: TWideStringField;
    TciketCantidad: TIntegerField;
    TciketNombreProd: TWideStringField;
    TciketPrecio: TBCDField;
    CantPedidoRep: TADOQuery;
    CantPedidoRepCantPedidos: TIntegerField;
    ReporteFechaNombreProd: TWideStringField;
    ReporteFechaCantProdutos: TFloatField;
    ReporteFechaPrecioXProd: TBCDField;
    ReporteFechaExpr1001: TDateTimeField;
    CantPedidoRep2: TADOQuery;
    IntegerField1: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
ruta:String;
begin
{
ruta:=ExtractFilePath(ParamStr(0))+ 'BaseDeDatos.mdb';
ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ ruta;
ADOConnection1.Connected:=true;
Usuarios.Active:=True;
Proveedores.Active:=True;
Productos.Active:=true;
ProductosActivos.Active:=true;
UsuariosActivos.Active:=true;
Eventos.Active:=true;  }
end;


end.
