unit UsuarioRegistrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, StdCtrls, MenuPrincipal;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
//Ingresar al sistema chequea el documento sea corecto que exista en la BD
//e ingresa, caso contrario muestra mensaje.

 if (Length(Edit1.Text)<7) then
      ShowMessage('DNI INCORRECTO')
      else
         if (DM.Usuarios.Locate('DNI', Edit1.Text,[])) then
            Form4.showModal
            else
              Showmessage('El DNI no se encuentra registrado')
end;

end.
