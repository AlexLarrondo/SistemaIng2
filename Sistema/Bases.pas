unit Bases;
//Data Module
interface

uses
  SysUtils, Classes, DB, ADODB, FMTBcd, SqlExpr;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Usuarios: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    UsuariosDNI: TIntegerField;
    UsuariosNombre: TWideStringField;
    UsuariosApellido: TWideStringField;
    UsuariosTipo: TWideStringField;
    UsuariosPass: TWideStringField;
    UsuariosEstado: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
ruta:String;
begin
ruta:=ExtractFilePath(ParamStr(0))+ 'BaseDeDatos.mdb';
ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ ruta;
ADOConnection1.Connected:=true;
Usuarios.Active:=True;
end;


end.
