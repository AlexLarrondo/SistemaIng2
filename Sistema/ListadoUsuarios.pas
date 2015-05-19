unit ListadoUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, Grids, DBGrids, Menus, StdCtrls, DBCtrls, Mask, Buttons,
  ExtCtrls;

type
  TForm6 = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    ModificarUsurio1: TMenuItem;
    EliminarUsuario1: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    CheckBox1: TCheckBox;
    procedure ModificarUsurio1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure EliminarUsuario1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  Tipo: String;

implementation

{$R *.dfm}

procedure TForm6.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
{Chequea que los datos ingresados en nombre y apellido sean letras, y no numeros
ni caracteres especiales}
  if not (Key in ['A'..'Z', 'a'..'z',#8]) then
    key := #0;

end;

procedure TForm6.DBEdit2KeyPress(Sender: TObject; var Key: Char);
{Solo númros al DNI}
begin
  if not (Key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TForm6.EliminarUsuario1Click(Sender: TObject);
{Eliminamos al usuario de manera lógica ingresando otro valor al
campo estado (la tabla siempre esta filtrada por estado=activo)}
begin
if (MessageDlg('¿Confirma la elimnación del usuario '+DM.Usuarios.Fields[1].AsString
+' '+DM.Usuarios.Fields[2].AsString+'?',mtWarning,[mbYes,mbNo],0)= mryes) then
  begin
  DM.Usuarios.Edit;
  DM.Usuarios.FieldByName('Estado').AsString:='Desactivado';
  DM.Usuarios.Post
  end;

end;

procedure TForm6.FormActivate(Sender: TObject);
{Dependiendo el tipo de usuario que este operando lo habilito a
poer modificar y eliminar uuarios. En ADOQuery1 esta filtrado el
usuario que esta operando}
begin
  Tipo:=DM.ADOQuery1.FieldByName('Tipo').AsString;
  if Tipo = 'Usuario Común' then begin
    Form6.DBGrid1.Columns[0].PopupMenu:=nil;
    Form6.DBGrid1.Columns[1].PopupMenu:=nil;
    Form6.DBGrid1.Columns[2].PopupMenu:=nil;
  end
  else
    Form6.DBGrid1.Columns[0].PopupMenu:=PopUpMenu1;
    Form6.DBGrid1.Columns[1].PopupMenu:=PopUpMenu1;
    Form6.DBGrid1.Columns[2].PopupMenu:=PopUpMenu1;
end;

procedure TForm6.ModificarUsurio1Click(Sender: TObject);
{Valida el cheackbox para mostrar los datos tal cual se enuentran
registrados}
begin
  DbGrid1.Enabled:=false;
  if DM.Usuarios.Fields[3].AsString = 'Mantenimiento' then
    CheckBox1.Checked:=true
    else
      CheckBox1.Checked:=false;
  GroupBox1.Visible:=true;
  DM.Usuarios.Edit;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
{Cancela la modificación}
begin
  DM.Usuarios.Cancel;
  GroupBox1.Visible:=false;
  DbGrid1.Enabled:=true;
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
{Modificamos en la tabla a partir de los valores nuevos ingresados
antes verificamos que los valores ingresados sean correctos y que todos
los datos se ingresen}
begin
  if ((Length(DBEdit1.Text)=0) or (Length(DBEdit2.Text)=0) or (Length(DBEdit3.Text)=0)) then
        MessageDlg('Faltan ingresar datos',mterror,[mbOk],0)
       else
       if (Length(DBEdit2.Text)<7) then
          MessageDlg('DNI incorrecto',mterror,[mbOk],0)
          else begin
            if CheckBox1.Checked then
              DM.Usuarios.FieldByName('Tipo').AsString:='Mantenimiento'
              else
                DM.Usuarios.FieldByName('Tipo').AsString:='Usuario común';
                DM.Usuarios.Post;
                GroupBox1.Visible:=false;
                DbGrid1.Enabled:=true;
          end;
end;

end.
