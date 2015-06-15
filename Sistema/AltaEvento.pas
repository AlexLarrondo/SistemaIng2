unit AltaEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, StdCtrls, Bases;

type
  TForm9 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox5: TGroupBox;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    procedure DateTimePicker2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.DateTimePicker2Change(Sender: TObject);
begin
  datetimepicker1.MinDate:=trunc(datetimepicker2.Date);
end;

procedure TForm9.FormActivate(Sender: TObject);
begin
  Edit1.Text:='';
  DateTimePicker1.Date:=date;
  DateTimePicker2.Date:=date;
  datetimepicker1.MinDate:=date;
  datetimepicker2.MinDate:=date;
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm9.SpeedButton2Click(Sender: TObject);
begin
  DM.EventosActivos.Close;
  DM.EventosActivos.Parameters.ParamByName('Fecha1').Value:= Datetostr(DateTimePicker2.Date);
  DM.EventosActivos.Parameters.ParamByName('Fecha2').Value:= Datetostr(DateTimePicker1.Date);
  DM.EventosActivos.Parameters.ParamByName('Nombre').Value:= '<Elije un evento>';
  DM.EventosActivos.Open;
  If Edit1.Text='' then
     MessageDlg('Falta ingresar el nombre del evento',mterror,[mbOk],0)
     else
      If DM.EventosActivos.Locate('Nombre',Edit1.Text,[]) then
        MessageDlg('Este evento ya se encuentra activo',mterror,[mbOk],0)
        else
          If not (DM.EventosActivos.IsEmpty) then begin
            if (MessageDlg('Existen eventos activos, �De todas maneras desea dar de alta el evento?',mtWarning,[mbYes,mbNo],0) = mrYes) then
            begin
              DM.Eventos.Append;
              DM.Eventos.FieldByName('Nombre').AsString:=Edit1.Text;
              DM.Eventos.FieldByName('Fecha_Inicio').AsDateTime:=Trunc(DateTimePicker2.DateTime);
              DM.Eventos.FieldByName('Fecha_Final').AsDateTime:=Trunc(DateTimePicker1.DateTime);
              DM.Eventos.Post;
              MessageDlg('El evento ha sido dado de alta',mtInformation,[mbOk],0);
              Close;
            end;
          end
          else begin
            DM.Eventos.Append;
            DM.Eventos.FieldByName('Nombre').AsString:=Edit1.Text;
            DM.Eventos.FieldByName('Fecha_Inicio').AsDateTime:=Trunc(DateTimePicker2.DateTime);
            DM.Eventos.FieldByName('Fecha_Final').AsDateTime:=Trunc(DateTimePicker1.DateTime);
            DM.Eventos.Post;
            MessageDlg('El evento ha sido dado de alta',mtInformation,[mbOk],0);
            Close;
            end;
end;

end.
