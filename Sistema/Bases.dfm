object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 457
  Width = 641
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=BaseD' +
      'eDatos.mdb;Mode=Share Deny None;Extended Properties="";Persist S' +
      'ecurity Info=False;Jet OLEDB:System database="";Jet OLEDB:Regist' +
      'ry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=' +
      '5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bul' +
      'k Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Datab' +
      'ase Password="";Jet OLEDB:Create System Database=False;Jet OLEDB' +
      ':Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=F' +
      'alse;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SF' +
      'P=False'
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
    Active = True
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
      'ORDER BY P.Nombre')
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
    Left = 384
    Top = 16
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
    Active = True
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
      end
      item
        Name = 'Nombre'
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
        ' (Nombre <> :Nombre)'
      'ORDER BY Fecha_Inicio')
    Left = 384
    Top = 72
  end
  object DataSource6: TDataSource
    DataSet = Eventos
    Left = 448
    Top = 16
  end
  object DS_EventosActivos: TDataSource
    DataSet = EventosActivos
    Left = 448
    Top = 72
  end
  object EvitarSuperponer: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'FechaFin1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'FechaFin2'
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
      
        'WHERE (:FechaFin1 >= Fecha_Inicio) and (:FechaFin2 <= Fecha_Fina' +
        'l)')
    Left = 544
    Top = 64
  end
  object ProductoPedido: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'ProductoPedido'
    Left = 384
    Top = 120
    object ProductoPedidoId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object ProductoPedidoCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object ProductoPedidoPrecio: TBCDField
      FieldName = 'Precio'
      DisplayFormat = '$ 00,00'
      Precision = 19
    end
    object ProductoPedidoNombreProd: TWideStringField
      FieldName = 'NombreProd'
      Size = 255
    end
  end
  object DS_ProductoPedido: TDataSource
    DataSet = ProductoPedido
    Left = 448
    Top = 128
  end
  object Pedidos: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Pedidos'
    Left = 368
    Top = 240
    object PedidosId: TAutoIncField
      DisplayWidth = 12
      FieldName = 'Id'
      ReadOnly = True
    end
    object PedidosFecha: TDateTimeField
      DisplayWidth = 21
      FieldName = 'Fecha'
    end
    object PedidosPrecio_Total: TBCDField
      DisplayWidth = 15
      FieldName = 'Precio_Total'
      DisplayFormat = '$ 00.00'
      Precision = 19
    end
    object PedidosDNI: TIntegerField
      DisplayWidth = 14
      FieldName = 'DNI'
    end
    object PedidosEvento: TWideStringField
      DisplayWidth = 298
      FieldName = 'Evento'
      Size = 255
    end
    object PedidosVendedor: TStringField
      FieldKind = fkLookup
      FieldName = 'Vendedor'
      LookupDataSet = Usuarios
      LookupKeyFields = 'DNI'
      LookupResultField = 'Nombre'
      KeyFields = 'DNI'
      Lookup = True
    end
    object PedidosVen1: TStringField
      FieldKind = fkLookup
      FieldName = 'Ven1'
      LookupDataSet = Usuarios
      LookupKeyFields = 'DNI'
      LookupResultField = 'Apellido'
      KeyFields = 'DNI'
      Lookup = True
    end
    object PedidosEstado: TWideStringField
      FieldName = 'Estado'
      Size = 255
    end
  end
  object ProdPedidoParaPedido: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Num'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM ProductoPedido'
      'WHERE  :Num = Id')
    Left = 368
    Top = 184
    object ProdPedidoParaPedidoId: TIntegerField
      FieldName = 'Id'
    end
    object ProdPedidoParaPedidoCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object ProdPedidoParaPedidoPrecio: TBCDField
      FieldName = 'Precio'
      DisplayFormat = '$ 00.00'
      Precision = 19
    end
    object ProdPedidoParaPedidoNombreProd: TWideStringField
      FieldName = 'NombreProd'
      Size = 255
    end
  end
  object DS_PPPP: TDataSource
    DataSet = ProdPedidoParaPedido
    Left = 448
    Top = 184
  end
  object BorrarEventos: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Evento'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM Pedidos P'
      'WHERE (:Evento = P.Evento) ')
    Left = 136
    Top = 320
  end
  object Tciket: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT P.Precio_Total, P.Evento, M.Cantidad, M.NombreProd, M.Pre' +
        'cio'
      'FROM Pedidos P INNER JOIN ProductoPedido M ON M.Id = P.Id'
      'ORDER BY M.NombreProd')
    Left = 368
    Top = 312
  end
  object DS_Ticket: TDataSource
    DataSet = Tciket
    Left = 440
    Top = 312
  end
  object DS_Pedidos: TDataSource
    DataSet = Pedidos
    Left = 440
    Top = 248
  end
  object ReporteHora: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Desde'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Hasta'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT O.NombreProd, COUNT(P.Id) as CantPedidos, SUM(O.Cantidad)' +
        ' as CantProdutos, SUM(O.Precio) as PrecioXProd'
      'FROM Pedidos P, ProductoPedido O'
      'WHERE P.Fecha >= :Desde and P.Fecha <= :Hasta  and P.Id=O.Id'
      'GROUP BY O.NombreProd')
    Left = 536
    Top = 208
  end
  object ReporteFecha: TADOQuery
    Active = True
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
      end
      item
        Name = 'Evento'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT O.NombreProd, COUNT(P.Id) as CantPedidos, SUM(O.Cantidad)' +
        ' as CantProdutos, SUM(O.Precio) as PrecioXProd'
      'FROM Pedidos P, ProductoPedido O'
      
        'WHERE P.Fecha >= :Fecha1 and P.Fecha <= :Fecha2  and P.Id=O.Id  ' +
        'and P.Evento = :Evento'
      'GROUP BY O.NombreProd')
    Left = 536
    Top = 264
  end
end
