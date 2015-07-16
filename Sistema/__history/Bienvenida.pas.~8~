unit Bienvenida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registrarse, UsuarioRegistrado, pngimage, ExtCtrls, Buttons,
  MenuPrincipal, Bases, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Form4.ShowModal;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  //Abre el formulario para el registro del usurario.
   Form2.showModal;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  //Abre el formulario para el inicio de sesión
   Form3.showModal;
end;

end.
