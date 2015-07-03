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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.SpeedButton2Click(Sender: TObject);
begin
  DM.ReporteHora.Close;
  DM.ReporteHora.Parameters.ParamByName('Desde').Value:=(DatetoStr(trunc(DateTimePicker3.Date))) +' '+ (timetostr(DateTimePicker2.Time));
  DM.ReporteHora.Parameters.ParamByName('Hasta').Value:=(DatetoStr(trunc(DateTimePicker3.Date))) +' ' + (timetostr(DateTimePicker1.Time));
  DM.ReporteHora.Open;
  Form14.QuickRep1.preview;
end;

end.
