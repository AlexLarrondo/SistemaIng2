unit FranjaHoraria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Bases, ReporteFranjaHoraria;

type
  TForm15 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox5: TGroupBox;
    DateTimePicker2: TDateTimePicker;
    GroupBox2: TGroupBox;
    DateTimePicker3: TDateTimePicker;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DateTimePicker3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.DateTimePicker3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    SpeedButton2Click(Sender);
end;

procedure TForm15.FormActivate(Sender: TObject);
begin
  DateTimePicker3.Date:=date;
  DateTimePicker2.Time:= 00;
  DateTimePicker1.Time:=24;
end;

procedure TForm15.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm15.SpeedButton2Click(Sender: TObject);
begin
  DM.ReporteHora.Close;
  DM.ReporteHora.Parameters.ParamByName('Desde').Value:=(DatetoStr(trunc(DateTimePicker3.Date))) +' '+ (timetostr(DateTimePicker2.Time));
  DM.ReporteHora.Parameters.ParamByName('Hasta').Value:=(DatetoStr(trunc(DateTimePicker3.Date))) +' ' + (timetostr(DateTimePicker1.Time));
  DM.ReporteHora.Open;
  DM.CantPedidoRep.Close;
  DM.CantPedidoRep.Parameters.ParamByName('Primera').Value:=(DatetoStr(trunc(DateTimePicker3.Date))) +' '+ (timetostr(DateTimePicker2.Time));
  DM.CantPedidoRep.Parameters.ParamByName('Segunda').Value:=(DatetoStr(trunc(DateTimePicker3.Date))) +' ' + (timetostr(DateTimePicker1.Time));
  DM.CantPedidoRep.Open;
  Form14.QuickRep1.preview;
end;

end.
