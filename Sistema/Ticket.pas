unit Ticket;

interface

uses
  Windows, Messages,  Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  QRCtrls, Bases, jpeg, QuickRpt, Sysutils;

type
  TForm12 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRSysData1: TQRSysData;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QuickRep1.PrinterSettings.Copies:=2;
end;

end.
