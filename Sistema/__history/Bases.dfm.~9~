object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 224
  Width = 387
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 88
    Top = 64
  end
  object Usuarios: TADOTable
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
    Left = 264
    Top = 128
  end
end
