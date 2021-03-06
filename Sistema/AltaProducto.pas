unit AltaProducto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, DBCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TForm7 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox5: TGroupBox;
    GroupBox7: TGroupBox;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.Edit5KeyPress(Sender: TObject; var Key: Char);
{Permite ingresar solo numeros y solo una sola ',' .Si el valor ingresado
es '.' lo transforma a ','.}
var
i,cantcoma: integer;
begin
  cantcoma:=0;
  if not (Key in ['0'..'9',',','.', #7,#8]) then
    key := #0
    else
      if ((key = '.') or (key = ',')) then begin
        for i := 1 to length((Sender as Tedit).Text) do
          if (copy((Sender as Tedit).Text,i,1) =',') then
            cantcoma:=cantcoma+1;
        if cantcoma >=1 then
          key:=#0
          else
            key:=',';
    end;
end;

procedure TForm7.FormActivate(Sender: TObject);
{Campos vacios, proveedores en opci�n '<Elija un proveedor>'
Activa el sql de productos activos.}
begin
  DBLookupComboBox1.KeyValue:='<Elija un proveedor>';
  Edit1.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  DM.ProductosActivos.Close ;
  DM.ProductosActivos.Open;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
{No registra el alta}
begin
  DM.Productos.Cancel;
  Close;
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
{Controla que se ingresen todos los datos, qu el proveedor haya salido
de la opcion '<Elija un proveedor>', se fija que no exista, y lo da de alta}
begin
 if ((Length(Edit1.Text)=0) or (Length(Edit3.Text)=0) or
 (Length(Edit4.Text)=0)or (Length(Edit5.Text)=0) ) then
    MessageDlg('Faltan ingresar datos, todos los campos deben estar llenos',mterror,[mbOk],0)
    else
      if DM.ProductosActivos.Locate('Nombre', Edit1.Text,[]) then
        MessageDlg('Ya existe el produto',mterror,[mbOk],0)
        else
          if DM.Proveedores.FieldByName('Nombre').AsString = '<Elija un proveedor>' then
            MessageDlg('Seleccione un proveedor',mterror,[mbOk],0)
      else  BEGIN
      DM.Productos.Append;
      DM.Productos.FieldByName('Nombre').AsString:=Edit1.Text;
      DM.Productos.FieldByName('Precio venta').AsString:=Edit4.Text;
      DM.Productos.FieldByName('Precio compra').AsString:=Edit5.Text;
      DM.Productos.FieldByName('Cantidad').AsString:=Edit3.Text;
      DM.Productos.FieldByName('Proveedor').AsString:=DM.Proveedores.FieldByName('Nombre').AsString;
      DM.Productos.FieldByName('Estado').AsString:='Activo';
      DM.Productos.Post;
      MessageDlg('El producto ha sido dado de alta con exito',mtInformation,[mbOk],0);
      Close;
    END;
end;

end.
