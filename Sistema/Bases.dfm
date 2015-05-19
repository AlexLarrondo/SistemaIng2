object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 224
  Width = 387
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Documents and Se' +
      'ttings\Alex\Escritorio\Sistema\BaseDeDatos.mdb;Persist Security ' +
      'Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 88
    Top = 64
  end
  object Usuarios: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = 'Estado='#39'Activo'#39
    Filtered = True
    IndexFieldNames = 'Apellido;Nombre'
    TableName = 'Usuarios'
    Left = 176
    Top = 64
    object UsuariosDNI: TIntegerField
      FieldName = 'DNI'
    end
    object UsuariosNombre: TWideStringField
      FieldName = 'Nombre'
      Size = 255
    end
    object UsuariosApellido: TWideStringField
      FieldName = 'Apellido'
      Size = 255
    end
    object UsuariosTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 255
    end
    object UsuariosPass: TWideStringField
      FieldName = 'Pass'
      Size = 255
    end
    object UsuariosEstado: TWideStringField
      FieldName = 'Estado'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = Usuarios
    Left = 256
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'DNI'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Usuarios U'
      'WHERE (U.DNI = :DNI) ')
    Left = 336
    Top = 64
  end
end
