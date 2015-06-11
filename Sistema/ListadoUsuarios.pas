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
    CheckBox1: TCheckBox;
    Panel3: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label2: TLabel;
    procedure ModificarUsurio1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure EliminarUsuario1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
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
{Solo n�meros al DNI}
begin
  if not (Key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TForm6.DBGrid1TitleClick(Column: TColumn);
begin
 DM.UsuariosActivos.Sort:= Column.Title.Caption ;
end;

procedure TForm6.Edit1Change(Sender: TObject);
{Filtra por teclado!}
begin
  DM.UsuariosActivos.Filtered:=false;
  if edit1.Text <> '' then  begin
    DM.UsuariosActivos.Filter:='Nombre like ''*'+edit1.Text+'*''';
    DM.UsuariosActivos.Filtered:=true;
  end;
end;

procedure TForm6.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
{Chequea que los datos ingresados en nombre y apellido sean letras, y no numeros
ni caracteres especiales}
if not (Key in ['A'..'Z', 'a'..'z',#8]) then
    key := #0;
end;

procedure TForm6.EliminarUsuario1Click(Sender: TObject);
{Eliminamos al usuario de manera l�gica ingresando otro valor al
campo estado (la tabla siempre esta filtrada por estado=activo)}
begin
if (MessageDlg('�Confirma la elimnaci�n del usuario '+DM.UsuariosActivos.Fields[1].AsString
+' '+DM.UsuariosActivos.Fields[2].AsString+'?',mtWarning,[mbYes,mbNo],0)= mryes) then
  begin
  DM.UsuariosActivos.Edit;
  DM.UsuariosActivos.FieldByName('Estado').AsString:='Desactivado';
  DM.UsuariosActivos.Post;
  DM.UsuariosActivos.Close;
  DM.UsuariosActivos.Open;
  end;

end;

procedure TForm6.FormActivate(Sender: TObject);
{Dependiendo el tipo de usuario que este operando lo habilito a
poder modificar y eliminar uuarios. En ADOQuery1 esta filtrado el
usuario que esta operando}
begin
  DM.UsuariosActivos.Close;
  DM.UsuariosActivos.Open;
  Tipo:=DM.ADOQuery1.FieldByName('Tipo').AsString;
  if Tipo = 'Usuario com�n' then begin
    DBGrid1.Columns[0].PopupMenu:=nil;
    DBGrid1.Columns[1].PopupMenu:=nil;
    DBGrid1.Columns[2].PopupMenu:=nil;
  end
  else begin
    DBGrid1.Columns[0].PopupMenu:=PopUpMenu1;
    DBGrid1.Columns[1].PopupMenu:=PopUpMenu1;
    DBGrid1.Columns[2].PopupMenu:=PopUpMenu1;
  end;
end;

procedure TForm6.ModificarUsurio1Click(Sender: TObject);
{Valida el cheackbox para mostrar los datos tal cual se enuentran
registrados}
begin
  DbGrid1.Enabled:=false;
  Panel3.Visible:=false;
  if DM.UsuariosActivos.Fields[3].AsString = 'Mantenimiento' then
    CheckBox1.Checked:=true
    else
      CheckBox1.Checked:=false;
  GroupBox1.Visible:=true;
  edit2.Text:= DM.UsuariosActivos.FieldByName('Nombre').AsString;
  edit3.Text:= DM.UsuariosActivos.FieldByName('DNI').AsString;
  edit4.Text:= DM.UsuariosActivos.FieldByName('Apellido').AsString;

end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
{Cancela la modificaci�n}
begin
  DM.Usuarios.Cancel;
  GroupBox1.Visible:=false;
  DbGrid1.Enabled:=true;
  Panel3.Visible:=true;
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
{Modificamos en la tabla a partir de los valores nuevos ingresados
antes verificamos que los valores ingresados sean correctos y que todos
los datos se ingresen}
begin
  if ((Length(Edit2.Text)=0) or (Length(Edit3.Text)=0) or (Length(Edit4.Text)=0)) then
    MessageDlg('Faltan ingresar datos',mterror,[mbOk],0)
    else
      if (Length(Edit3.Text)<7) then
        MessageDlg('DNI incorrecto',mterror,[mbOk],0)
        else
          if ((Edit3.Text <> DM.UsuariosActivos.FieldByName('DNI').AsString ))then begin
            if (DM.UsuariosActivos.Locate('DNI',Edit3.Text,[])) then
              MessageDlg('Ya existe un usuario con este DNI',mterror,[mbOk],0)
              else
                if DM.Usuarios.Locate('DNI',Edit3.Text,[]) then
                  MessageDlg('El usuario asociado a este DNI se encuentra borrado, para reactivarlo tendr� que volver a registrarse',mtInformation,[mbOk],0);
            GroupBox1.Visible:=false;
            DbGrid1.Enabled:=true;
            Panel3.Visible:=true;
          end
              else begin
                DM.UsuariosActivos.Edit;
                if CheckBox1.Checked then
                  DM.UsuariosActivos.FieldByName('Tipo').AsString:='Mantenimiento'
                  else
                    DM.UsuariosActivos.FieldByName('Tipo').AsString:='Usuario com�n';
                DM.UsuariosActivos.FieldByName('Nombre').AsString:=edit2.Text;
                DM.UsuariosActivos.FieldByName('DNI').AsString:=edit3.Text;
                DM.UsuariosActivos.FieldByName('Apellido').AsString:=edit4.Text;
                DM.UsuariosActivos.Post;
                MessageDlg('El Usuario se ha modificado',mtInformation,[mbOk],0);
                GroupBox1.Visible:=false;
                DbGrid1.Enabled:=true;
                Panel3.Visible:=true;
          end;
end;

end.
