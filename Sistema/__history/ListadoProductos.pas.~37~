unit ListadoProductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
  Menus, AltaProducto;

type
  TForm8 = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox5: TGroupBox;
    GroupBox7: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    PopupMenu1: TPopupMenu;
    Modificarproducto1: TMenuItem;
    Eliminarproducto1: TMenuItem;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Eliminarproducto1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Modificarproducto1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  Tipo: String;

implementation

{$R *.dfm}

procedure TForm8.DBGrid1TitleClick(Column: TColumn);
begin
   DM.ProductosActivos.Sort:= Column.Title.Caption ;
end;

procedure TForm8.Edit1Change(Sender: TObject);
{Filtra por teclado!}
begin
  DM.ProductosActivos.Filtered:=false;
  if edit1.Text <> '' then  begin
    DM.ProductosActivos.Filter:='Nombre like ''*'+edit1.Text+'*''';
    DM.ProductosActivos.Filtered:=true;
  end;
end;

procedure TForm8.Edit4KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm8.Edit5KeyPress(Sender: TObject; var Key: Char);
{Cantidad sean solo números}
begin
 if not (Key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TForm8.Eliminarproducto1Click(Sender: TObject);
{Eliminamos al producto de manera lógica ingresando otro valor al
campo estado}
begin
  if (MessageDlg('¿Confirma la elimnación del producto '+DM.ProductosActivos.Fields[0].AsString
    +'?',mtWarning,[mbYes,mbNo],0)= mryes) then
    begin
      DM.ProductosActivos.Edit;
      DM.ProductosActivos.FieldByName('Estado').AsString:='Desactivado';
      DM.ProductosActivos.Post;
      DM.ProductosActivos.Close;
      DM.ProductosActivos.Open;
    end;
end;

procedure TForm8.FormActivate(Sender: TObject);
{Dependiendo el tipo de usuario que este operando lo habilito a
poer modificar y eliminar productos. En ADOQuery1 esta filtrado el
usuario que esta operando}
begin
  DM.ProductosActivos.Close;
  DM.ProductosActivos.Open;
  Tipo:=DM.ADOQuery1.FieldByName('Tipo').AsString;
  if Tipo = 'Usuario común' then begin
    DBGrid1.Columns[0].PopupMenu:=nil;
    DBGrid1.Columns[1].PopupMenu:=nil;
    DBGrid1.Columns[2].PopupMenu:=nil;
    DBGrid1.Columns[3].PopupMenu:=nil;
    DBGrid1.Columns[4].PopupMenu:=nil;
  end
  else begin
    DBGrid1.Columns[0].PopupMenu:=PopUpMenu1;
    DBGrid1.Columns[1].PopupMenu:=PopUpMenu1;
    DBGrid1.Columns[2].PopupMenu:=PopUpMenu1;
    DBGrid1.Columns[3].PopupMenu:=PopUpMenu1;
    DBGrid1.Columns[4].PopupMenu:=PopUpMenu1;
  end;
end;

procedure TForm8.Modificarproducto1Click(Sender: TObject);
{Mostramos los campos para la modifiacion del producto}
begin
  DbGrid1.Enabled:=false;
  Panel3.Visible:=false;
  GroupBox1.Visible:=true;
  edit2.Text:=DM.ProductosActivos.FieldByName('Nombre').AsString;
  edit3.Text:= FormatFloat('##.00',(DM.ProductosActivos.FieldByName('Precio compra').AsFloat));
  edit4.Text:= FormatFloat('##.00',(DM.ProductosActivos.FieldByName('Precio venta').AsFloat));
  edit5.Text:=(DM.ProductosActivos.FieldByName('Cantidad').AsString);
end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
{Cancela la modificación}
begin
  DM.Productos.Cancel;
  GroupBox1.Visible:=false;
  DbGrid1.Enabled:=true;
  Panel3.Visible:=true;
end;

procedure TForm8.SpeedButton2Click(Sender: TObject);
{Modificamos en la tabla a partir de los valores nuevos ingresados
antes verificamos que los valores ingresados sean correctos y que todos
los datos se ingresen}
var
nombre:string;
begin
  if ((Length(Edit2.Text)=0) or (Length(Edit3.Text)=0) or (Length(Edit4.Text)=0)) or (Length(Edit5.Text)=0)then
    MessageDlg('Faltan ingresar datos',mterror,[mbOk],0)
    else
      if DM.Proveedores.FieldByName('Nombre').AsString = '<Elija un proveedor>' then
        MessageDlg('Seleccione un proveedor',mterror,[mbOk],0)
        else begin
          nombre:=DM.ProductosActivos.FieldByName('Nombre').AsString;
          if ((Edit2.Text <> nombre )
          and (DM.ProductosActivos.Locate('Nombre',Edit2.Text,[]))) then BEGIN
              MessageDlg('Ya existe un producto con este nombre',mterror,[mbOk],0);
               GroupBox1.Visible:=false;
               DbGrid1.Enabled:=true;
               Panel3.Visible:=true;
          END
              else begin
                if POS ('$',Edit3.Text) <> 0 then
                  Edit3.Text:=COPY(Edit3.Text,POS ('$',Edit3.Text)+1,Length(Edit3.text)-1);
                if POS ('$',Edit4.Text) <> 0 then
                  Edit4.Text:=COPY(Edit4.Text,POS ('$',Edit4.Text)+1,Length(Edit4.text)-1);
                DM.ProductosActivos.Edit;
                DM.ProductosActivos.FieldByName('Nombre').AsString:=Edit2.Text;
                DM.ProductosActivos.FieldByName('Precio venta').AsString:=Edit4.Text;
                DM.ProductosActivos.FieldByName('Precio compra').AsString:=Edit3.Text;
                DM.ProductosActivos.FieldByName('Cantidad').AsString:=Edit5.Text;
                DM.ProductosActivos.Post;
                MessageDlg('El producto se ha modificado',mtInformation,[mbOk],0);
                GroupBox1.Visible:=false;
                DbGrid1.Enabled:=true;
                Panel3.Visible:=true;
              end;
        end;
end;

end.
