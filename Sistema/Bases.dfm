object DM: TDM
  OldCreateOrder = False
  Height = 154
  Width = 356
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Documents and Se' +
      'ttings\Alex\Escritorio\Sistema\Base\BaseDeDatos.mdb;Persist Secu' +
      'rity Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 88
    Top = 64
  end
  object Usuarios: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Usuarios'
    Left = 176
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = Usuarios
    Left = 256
    Top = 64
  end
end
