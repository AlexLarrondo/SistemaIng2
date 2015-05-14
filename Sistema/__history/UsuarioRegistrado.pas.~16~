unit UsuarioRegistrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, StdCtrls, MenuPrincipal, Buttons, ExtCtrls, DBCtrls, Grids,
  DBGrids;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox6: TGroupBox;
    Edit5: TEdit;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Label1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses RecuperarContraseña;

{$R *.dfm}

procedure TForm3.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
{Verifica que en el campo contraseña solo se ingresen letras y/o números}
 if not (Key in ['A'..'Z', 'a'..'z','0'..'9',#8]) then
    key := #0;
end;

procedure TForm3.FormActivate(Sender: TObject);
{Inicia el formulario con los campos en blanco}
begin
  Edit2.Text:='';
  Edit5.Text:='';
end;

procedure TForm3.Label1Click(Sender: TObject);
begin
{Abre un nuevo formulario para recuperar la contraseña}
  Form5.showModal;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
{Cierra el formulari sin iniciar sesión}
  Form3.Close;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  {Ingresar al sistema, primero chequea que ambos campos contengan datos, luego
  que el documento sea corecto que exista en la BD, por ultimo con la consulta
  SQL filtra para ese DNI todos los campos asi puede comprar el pass con el
  ingresado, si es correcto da un saludo de bienvenida e ingresa}
 if ((Length(Edit5.Text)=0) or (Length(Edit2.Text)=0)) then
     ShowMessage('FALTAN INGRESAR DATOS')
     else
     if (Length(Edit5.Text)<7) then
      ShowMessage('DNI INCORRECTO')
      else
        if not(DM.Usuarios.Locate('DNI', Edit5.Text,[])) then
            Showmessage('El DNI no se encuentra registrado')
            else  begin
              DM.ADOQuery1.Close;
              DM.ADOQuery1.Parameters.ParamByName('DNI').Value:=Edit5.Text;
              DM.ADOQuery1.Open;
              DM.DataSource1.DataSet:=DM.ADOQuery1;
              if Edit2.Text <> DM.Usuarios.Fields[4].AsString then
                ShowMessage('Pass incorrecto')

                else  begin
                  ShowMessage ('Bienvenido'+DM.Usuarios.Fields[1].AsString+' '+ DM.Usuarios.Fields[2].AsString);
                  Form4.ShowModal;
                  Close;
                end;


            end;

end;

end.
