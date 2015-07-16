unit ReporteFechas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Bases, QRCtrls, jpeg, QuickRpt, ExtCtrls;

type
  TForm17 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRImage1: TQRImage;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;
  Subtotal: integer;
implementation

{$R *.dfm}

procedure TForm17.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);

begin
  DM.CantPedidoRep2.Close;
  DM.CantPedidoRep2.Parameters.ParamByName('f').Value:=DatetoStr(DM.ReporteFecha.FieldByName('Expr1001').AsDateTime);
  DM.CantPedidoRep2.Parameters.ParamByName('f1').Value:=DatetoStr(DM.ReporteFecha.FieldByName('Expr1001').AsDateTime+1);
  DM.CantPedidoRep2.Open;


end;

procedure TForm17.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    Qrlabel4.Caption:= DateToStr(DM.ReporteFecha.FieldByName('Expr1001').AsDateTime);
  end;

end.
