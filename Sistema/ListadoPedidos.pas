unit ListadoPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, Grids, DBGrids, Menus, Ticket, StdCtrls, ExtCtrls;

type
  TForm13 = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    Mostrardetalle1: TMenuItem;
    Anularticket1: TMenuItem;
    Panel3: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Mostrardetalle1Click(Sender: TObject);
    procedure Anularticket1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses MenuPrincipal;

{$R *.dfm}

procedure TForm13.Anularticket1Click(Sender: TObject);
VAR
Nombre: string;
Cantidad: integer;
Seguir: boolean;
begin

  DM.ProdPedidoParaPedido.Close;
  DM.ProdPedidoParaPedido.Parameters.ParamByName('Num').Value:= DM.Pedidos.FieldByName('Id').AsString;
  DM.ProdPedidoParaPedido.Open;
  DM.ProdPedidoParaPedido.First;
  while not DM.ProdPedidoParaPedido.Eof  do begin
    Nombre:=DM.ProdPedidoParaPedido.FieldByName('NombreProd').AsString;
    Cantidad:=DM.ProdPedidoParaPedido.FieldByName('Cantidad').AsInteger;
    DM.Productos.Requery();
    DM.Productos.First;
    Seguir:=true;
    while not DM.Productos.Eof and Seguir do BEGIN
      if Nombre = DM.Productos.FieldByName('Nombre').AsString then BEGIN
        DM.Productos.Edit;
        DM.Productos.FieldByName('Cantidad').AsInteger:=  DM.Productos.FieldByName('Cantidad').AsInteger + Cantidad;
        DM.Productos.Post;
        Seguir:=false;
      END;
      DM.Productos.Next;
    END;
    DM.ProdPedidoParaPedido.Next;
  end;
  DM.Pedidos.Edit;
  DM.Pedidos.FieldByName('Estado').AsString:='Anulado';
  DM.Pedidos.Post;
end;

procedure TForm13.Edit1Change(Sender: TObject);
begin
  DM.Pedidos.Filtered:=false;
  DM.Pedidos.Filter:= 'Evento = ''' + evento + ''' and Estado = ''Facturado''';
  DM.Pedidos.Filtered:=True;
  If (Edit1.Text <> '') then begin
    DM.Pedidos.Filtered := False;
    DM.Pedidos.Filter:= ('Evento = ''' + evento + ''' and Estado = ''Facturado'' and Id like '''+(Edit1.Text) + '''' );
    DM.Pedidos.Filtered := True
end
end;

procedure TForm13.FormActivate(Sender: TObject);
begin
  
  DM.Pedidos.Filtered:=false;
  DM.Pedidos.Filter:= 'Evento = ''' + evento + ''' and Estado = ''Facturado''';
  DM.Pedidos.Filtered:=True;
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Pedidos.Filtered:=FALSE;
end;

procedure TForm13.Mostrardetalle1Click(Sender: TObject);
begin
  DM.ProdPedidoParaPedido.Close;
  DM.ProdPedidoParaPedido.Parameters.ParamByName('Num').Value:= DM.Pedidos.FieldByName('Id').AsString;
  DM.ProdPedidoParaPedido.Open;
  Form12.QuickRep1.preview;
end;

end.
