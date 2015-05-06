unit Registrarse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    
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
  //Boton regitrar, controla que tanto en el campo nombre,apellido y dni
  //hayan datos y no esten vacios, luego chequea que el DNI no sea mayor
  //digitos y por ultima se fija que el DNI ingresado ya exista en la BD, sino
  //exste lo registra y vuelve al formulario de Bienvenida.
  //Intentar mejorar los if then else if then else. Agregar pass.
    if ((Length(Edit1.Text)=0) or (Length(Edit2.Text)=0) or (Length(Edit3.Text)=0)) then
       ShowMessage('FALTAN INGRESAR DATOS')
       else
       if (Length(Edit3.Text)<7) then
          ShowMessage('DNI INCORRECTO')
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
                      if CheckBox1.Checked then
                        DM.Usuarios.FieldByName('Tipo').AsString:='Manteniminto'
                        else
                          DM.Usuarios.FieldByName('Tipo').AsString:='Usuario com�n';
                      DM.Usuarios.post;
                      Close;
                      end;
end;

procedure TForm2.Button2Click(Sender: TObject);
  //Cancela, se cierra el formulario y no se guarda nada en la BD
begin
    DM.Usuarios.cancel;
    Close;
end;

procedure TForm2.FormActivate(Sender: TObject);
//Al iniciar el formulario deja los campos en blanco y en false el campo para
//chequear si es de mantenimiento.
begin
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    CheckBox1.Checked:=false;


end;

end.
