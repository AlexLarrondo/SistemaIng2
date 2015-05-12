unit Registrarse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox5: TGroupBox;
    Edit4: TEdit;
    GroupBox6: TGroupBox;
    Edit5: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  {Boton regitrar, controla que tanto el campo nombre,apellido,dni y pass
  contenga datos y no esten vacios, luego chequea que el DNI no sea menor a 7
  digitos, que el pass no sea menor a 4 dig, que coincidan los campos contrase�a
  y confirmar contrase�a, por ultima se fija que el DNI no exista en la base, y
  crea un nuevo registro retornando al formulario bienvenida.
  "Intentar mejorar los if then else if then else..."}
    if ((Length(Edit1.Text)=0) or (Length(Edit2.Text)=0) or (Length(Edit3.Text)=0)or (Length(Edit4.Text)=0)or (Length(Edit5.Text)=0)) then
       ShowMessage('FALTAN INGRESAR DATOS')
       else
       if (Length(Edit3.Text)<7) then
          ShowMessage('DNI INCORRECTO')
          else
            if (Length(Edit4.Text)<4)  then
              ShowMessage ('La contrase�a debe tener m�nimo 4 caracteres')
              else
              if Edit4.Text <> Edit5.Text then
                ShowMessage ('No coincide la contrase�a con la confirmaci�n')
                else
                if (DM.Usuarios.Locate('DNI', Edit3.Text,[])) then  BEGIN
                  ShowMessage('YA EXISTE UN USUARIO PARA ESTE DNI');
                  Close;
                  END
                  else begin
                      DM.Usuarios.Append;
                      DM.Usuarios.FieldByName('Nombre').AsString:=Edit1.Text;
                      DM.Usuarios.FieldByName('Apellido').AsString:=Edit2.Text;
                      DM.Usuarios.FieldByName('DNI').AsString:=Edit3.Text;
                      DM.Usuarios.FieldByName('Pass').AsString:=Edit4.Text;
                      if CheckBox1.Checked then
                        DM.Usuarios.FieldByName('Tipo').AsString:='Manteniminto'
                        else
                          DM.Usuarios.FieldByName('Tipo').AsString:='Usuario com�n';
                      DM.Usuarios.post;
                      Close;
                      end;
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
{Chequea que los datos ingresados en nombre y apellido sean letras, y no numeros
ni caracteres especiales}
  if not (Key in ['A'..'Z', 'a'..'z',#8]) then
    key := #0;
end;

procedure TForm2.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
{Verifica que en los campos contrase�a y confirmar contrase�a solo se ingresen
letras y n�meros}
  if not (Key in ['A'..'Z', 'a'..'z','0'..'9',#8]) then
    key := #0;
end;

procedure TForm2.FormActivate(Sender: TObject);
{Al iniciar el formulario deja los campos en blanco y en false el campo para
chequear si es de mantenimiento}
begin
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    Edit4.Text:='';
    Edit5.Text:='';
    CheckBox1.Checked:=false;


end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
 {Cancela, se cierra el formulario y no se guarda nada en la BD}
begin
    DM.Usuarios.cancel;
    Close;
end;

end.