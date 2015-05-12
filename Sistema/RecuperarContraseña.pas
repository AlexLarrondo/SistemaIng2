unit RecuperarContraseña;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox6: TGroupBox;
    Edit5: TEdit;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Edit4: TEdit;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    Panel4: TPanel;
    SpeedButton4: TSpeedButton;
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    Panel6: TPanel;
    SpeedButton6: TSpeedButton;
    Edit3: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Bases;

{$R *.dfm}

procedure TForm5.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
{Verifica que en los campos contraseña y confirmar contraseña solo se ingresen
letras y números}
 if not (Key in ['A'..'Z', 'a'..'z','0'..'9',#8]) then
    key := #0;
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
{Cierra el formulario sin guardar cambios}
  Close;
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
{Consulta SQL para quedarnos con los datos de usuario de el DNI ingresado,
en caso de no existir se notifica. Si existe se abren campos ocultos a llenar}
  DM.ADOQuery1.Close;
  DM.ADOQuery1.Parameters.ParamByName('DNI').Value:=Edit5.Text;
  DM.ADOQuery1.Open;
  DM.DataSource1.DataSet:=DM.ADOQuery1;
  if Edit5.Text <> DM.Usuarios.Fields[0].AsString then
    ShowMessage('El DNI no se encuentra registrado')
    else begin
      GroupBox3.visible:=true;
      GroupBox4.Visible:=true;
      Panel1.Visible:=false;
      Panel2.Visible:=false;
      Panel3.Visible:=true;
      Panel4.Visible:=true;
      Edit1.Text:=DM.Usuarios.Fields[1].AsString[1];
      Edit3.Text:=DM.Usuarios.Fields[2].AsString[1];
    end;
end;

procedure TForm5.SpeedButton3Click(Sender: TObject);
begin
{Chequea que el nombre y apellido ingresado sean correctos}
  if ((Edit1.Text=DM.Usuarios.Fields[1].AsString) and (Edit3.Text=DM.Usuarios.Fields[2].AsString)) then begin
      GroupBox2.visible:=true;
      GroupBox5.Visible:=true;
      Panel3.Visible:=false;
      Panel4.Visible:=false;
      Panel5.Visible:=true;
      Panel6.Visible:=true;
  end
  else
    ShowMessage('Los datos no coinciden con los registrados');
end;

procedure TForm5.SpeedButton4Click(Sender: TObject);
begin
{Vuelvo al paso 1 mostrando solo campo DNI}
   GroupBox3.visible:=false;
   GroupBox4.Visible:=false;
   Panel3.Visible:=false;
   Panel4.Visible:=false;
   Panel1.Visible:=true;
   Panel2.Visible:=true;
end;

procedure TForm5.SpeedButton5Click(Sender: TObject);
begin
{Verifica que la contraseña no sea menos a 4 dígitos, que coincida la
confirmación y edita con el nuevo pass para ese usuario}
  if (Length(Edit4.Text)<4)  then
    ShowMessage ('La contraseña debe tener mínimo 4 caracteres')
    else
    if Edit2.Text = Edit4.Text then begin
      DM.Usuarios.Edit;
      DM.Usuarios.FieldByName('Pass').AsString:=Edit2.Text;
      DM.Usuarios.Post;
      ShowMessage('Su contraseña fue modificado con éxito');
      Close;
    end
    else
      ShowMessage ('No coinciden las contraseñas') ;
end;

procedure TForm5.SpeedButton6Click(Sender: TObject);
begin
{Vuelve al paso 1 mostrando el campo DNI}
   DM.Usuarios.Cancel;
   GroupBox3.visible:=false;
   GroupBox4.Visible:=false;
   GroupBox2.visible:=false;
   GroupBox5.Visible:=false;
   Panel3.Visible:=false;
   Panel4.Visible:=false;
   Panel5.Visible:=false;
   Panel6.Visible:=false;
   Panel1.Visible:=true;
   Panel2.Visible:=true;

end;

end.
