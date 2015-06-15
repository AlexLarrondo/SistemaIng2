unit GenerarPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Bases, Grids, DBGrids;

type
  TForm11 = class(TForm)
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit3: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  generePedido: boolean;
implementation

uses MenuPrincipal;

{$R *.dfm}

procedure TForm11.Edit2Change(Sender: TObject);
begin
   DM.ProductosActivos.Filtered := False;
  If (Edit1.Text <> '') then begin
    DM.ProductosActivos.Filter:= 'Nombre like '''+Edit2.Text+ '*''' ;
    DM.ProductosActivos.Filtered := True
end
end;

procedure TForm11.FormActivate(Sender: TObject);
begin
  DM.Pedidos.Append;
  DM.Pedidos.FieldByName('Fecha').AsDateTime:=Now;
  DM.Pedidos.Post;
  DM.ProdPedidoParaPedido.Close;
  DM.ProdPedidoParaPedido.Parameters.ParamByName('Num').Value:= DM.Pedidos.FieldByName('Id').AsString;
  DM.ProdPedidoParaPedido.Open;
  Edit2.text:='';
  Edit1.Text:='1';
  Edit3.Text:= '$ 00,00';
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SpeedButton3Click(Sender);
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
  generePedido:=true;
  DM.Pedidos.Edit;
  DM.Pedidos.FieldByName('Precio_Total').AsString:=COPY(Edit3.Text,POS ('$',Edit3.Text)+1,Length(Edit3.text)-1);
  DM.Pedidos.FieldByName('DNI').AsString:=DM.ADOQuery1.FieldByName('DNI').AsString;;
  DM.Pedidos.FieldByName('Evento').AsString:= evento;
  DM.Pedidos.Post;
  MessageDlg('todo bien',mtInformation,[mbOk],0);
  FormActivate(Sender);
end;

procedure TForm11.SpeedButton2Click(Sender: TObject);
var
seguir, yaAgregue: boolean;
cant: integer;
begin
  if DM.ProductosActivos.FieldByName('Cantidad').AsInteger < strtoint(edit1.text)  then
    MessageDlg('No hay stock suficiente',mtError,[mbOk],0)
    else begin
  seguir:=true;
  yaAgregue:=false;
  Edit3.Text:=COPY(Edit3.Text,POS ('$',Edit3.Text)+1,Length(Edit3.text)-1);
  DM.ProdPedidoParaPedido.First;
  while ((not DM.ProdPedidoParaPedido.Eof) and (seguir)) do begin
    if (DM.ProdPedidoParaPedido.FieldByName('NombreProd').AsString = DM.ProductosActivos.FieldByName('Nombre').AsString) then  begin
      cant:=DM.ProdPedidoParaPedido.FieldByName('Cantidad').AsInteger;
      seguir:=false;
      yaAgregue:=true;
      DM.ProdPedidoParaPedido.Edit;
      DM.ProdPedidoParaPedido.FieldByName('Id').AsString:=DM.Pedidos.FieldByName('Id').AsString;
      DM.ProdPedidoParaPedido.FieldByName('Cantidad').AsString:=inttostr(strtoint(Edit1.Text)+cant);
      DM.ProdPedidoParaPedido.FieldByName('Precio').AsString:= FloatToStr(  DM.ProdPedidoParaPedido.FieldByName('Precio').AsFloat+(DM.ProductosActivos.FieldByName('Precio venta').AsFloat*StrToFloat(Edit1.text)));
      Edit3.Text:=FloatToStr(StrToFloat(edit3.Text)+DM.Productos.FieldByName('Precio venta').AsFloat*StrToFloat(Edit1.text));
      DM.ProdPedidoParaPedido.FieldByName('NombreProd').AsString:=DM.ProductosActivos.FieldByName('Nombre').AsString;
      DM.ProdPedidoParaPedido.Post;
    end;
    DM.ProdPedidoParaPedido.Next;
  end;
  if not yaAgregue then begin
    DM.ProdPedidoParaPedido.Append;
    DM.ProdPedidoParaPedido.FieldByName('Id').AsString:=DM.Pedidos.FieldByName('Id').AsString;
    DM.ProdPedidoParaPedido.FieldByName('Cantidad').AsString:=Edit1.Text;
    DM.ProdPedidoParaPedido.FieldByName('Precio').AsString:=FloatToStr(DM.ProductosActivos.FieldByName('Precio venta').AsFloat*StrToFloat(Edit1.text));
    Edit3.Text:=FloatToStr(StrToFloat(edit3.Text)+(DM.ProductosActivos.FieldByName('Precio venta').AsFloat*StrToFloat(Edit1.text)));
    DM.ProdPedidoParaPedido.FieldByName('NombreProd').AsString:=DM.ProductosActivos.FieldByName('Nombre').AsString;
    DM.ProdPedidoParaPedido.Post;
  end;
  Edit1.Text:='1';
  Edit3.Text:=FormatFloat('$ ##.00',strtofloat(Edit3.Text));
  Dm.ProductosActivos.Edit;
  DM.ProductosActivos.FieldByName('Cantidad').AsInteger:=DM.ProductosActivos.FieldByName('Cantidad').AsInteger - strtoint(edit1.text);
  Dm.ProductosActivos.Post;
    end;
end;

procedure TForm11.SpeedButton3Click(Sender: TObject);
begin

 if not generePedido then begin
    DM.ProdPedidoParaPedido.First;
    while not DM.ProdPedidoParaPedido.isEmpty do begin
      DM.ProdPedidoParaPedido.Delete;
      DM.ProdPedidoParaPedido.Next;
      end;
    ModalResult:=mrCancel;
    end;
  close;
end;

end.
