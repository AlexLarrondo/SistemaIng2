object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 334
  Width = 591
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Documents and Se' +
      'ttings\Alex\Escritorio\Sistema\BaseDeDatos.mdb;Persist Security ' +
      'Info=False'
    KeepConnection = False
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 144
  end
  object Usuarios: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = 'Estado='#39'Activo'#39
    IndexFieldNames = 'Apellido;Nombre'
    TableName = 'Usuarios'
    Left = 144
    Top = 8
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
    Left = 216
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DNI'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '37549666'
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Usuarios U'
      'WHERE (U.DNI = :DNI) AND (U.Estado='#39'Activo'#39')')
    Left = 32
    Top = 64
    object ADOQuery1DNI: TIntegerField
      FieldName = 'DNI'
    end
    object ADOQuery1Nombre: TWideStringField
      FieldName = 'Nombre'
      Size = 255
    end
    object ADOQuery1Apellido: TWideStringField
      FieldName = 'Apellido'
      Size = 255
    end
    object ADOQuery1Tipo: TWideStringField
      FieldName = 'Tipo'
      Size = 255
    end
    object ADOQuery1Pass: TWideStringField
      FieldName = 'Pass'
      Size = 255
    end
    object ADOQuery1Estado: TWideStringField
      FieldName = 'Estado'
      Size = 255
    end
  end
  object Proveedores: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Proveedores'
    Left = 144
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = Proveedores
    Left = 216
    Top = 112
  end
  object Productos: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = 'Estado='#39'Activo'#39
    Filtered = True
    IndexFieldNames = 'Nombre'
    TableName = 'Productos'
    Left = 144
    Top = 184
    object ProductosNombre: TWideStringField
      FieldName = 'Nombre'
      Size = 255
    end
    object ProductosCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object ProductosPreciocompra: TBCDField
      DefaultExpression = '00.00'
      FieldName = 'Precio compra'
      DisplayFormat = '$ 00.00'
      EditFormat = '00.00'
      Precision = 19
    end
    object ProductosPrecioventa: TBCDField
      DefaultExpression = '00.00'
      FieldName = 'Precio venta'
      DisplayFormat = '$ 00.00'
      EditFormat = '00.00'
      Precision = 19
    end
    object ProductosProveedor: TWideStringField
      FieldName = 'Proveedor'
      Size = 255
    end
    object ProductosEstado: TWideStringField
      FieldName = 'Estado'
      Size = 255
    end
  end
  object DataSource3: TDataSource
    DataSet = Productos
    Left = 216
    Top = 184
  end
  object UsuariosActivos: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Usuarios U'
      'WHERE U.Estado='#39'Activo'#39)
    Left = 144
    Top = 56
    object UsuariosActivosDNI: TIntegerField
      FieldName = 'DNI'
    end
    object UsuariosActivosNombre: TWideStringField
      FieldName = 'Nombre'
      Size = 255
    end
    object UsuariosActivosApellido: TWideStringField
      FieldName = 'Apellido'
      Size = 255
    end
    object UsuariosActivosTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 255
    end
    object UsuariosActivosPass: TWideStringField
      FieldName = 'Pass'
      Size = 255
    end
    object UsuariosActivosEstado: TWideStringField
      FieldName = 'Estado'
      Size = 255
    end
  end
  object ProductosActivos: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM Productos P'
      'WHERE P.Estado='#39'Activo'#39
      '')
    Left = 144
    Top = 240
    object ProductosActivosNombre: TWideStringField
      FieldName = 'Nombre'
      Size = 255
    end
    object ProductosActivosCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object ProductosActivosPreciocompra: TBCDField
      FieldName = 'Precio compra'
      DisplayFormat = '$ 00.00'
      Precision = 19
    end
    object ProductosActivosPrecioventa: TBCDField
      FieldName = 'Precio venta'
      DisplayFormat = '$ 00.00'
      Precision = 19
    end
    object ProductosActivosProveedor: TWideStringField
      FieldName = 'Proveedor'
      Size = 255
    end
    object ProductosActivosEstado: TWideStringField
      FieldName = 'Estado'
      Size = 255
    end
  end
  object DataSource4: TDataSource
    DataSet = ProductosActivos
    Left = 216
    Top = 240
  end
  object DataSource5: TDataSource
    DataSet = UsuariosActivos
    Left = 216
    Top = 56
  end
  object Eventos: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Eventos'
    Left = 304
    Top = 8
    object EventosNombre: TWideStringField
      FieldName = 'Nombre'
      Size = 255
    end
    object EventosFecha_Inicio: TDateTimeField
      FieldName = 'Fecha_Inicio'
    end
    object EventosFecha_Final: TDateTimeField
      FieldName = 'Fecha_Final'
    end
  end
  object EventosActivos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Fecha1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Fecha2'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Eventos'
      
        'WHERE (:Fecha1 >= Fecha_Inicio) and (:Fecha2 <= Fecha_Final) and' +
        ' (Nombre <> '#39'<Elije una opcion>'#39')'
      'ORDER BY Fecha_Inicio')
    Left = 304
    Top = 64
  end
  object DataSource6: TDataSource
    DataSet = Eventos
    Left = 368
    Top = 8
  end
  object DS_EventosActivos: TDataSource
    DataSet = EventosActivos
    Left = 392
    Top = 64
  end
  object EventosFechaYFecha: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'Fecha2'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Eventos'
      
        'WHERE  ( :Fecha2 <= Fecha_Final) and (Nombre <> '#39'<Elije una opci' +
        'on>'#39')'
      'ORDER BY Fecha_Inicio')
    Left = 496
    Top = 64
  end
end
