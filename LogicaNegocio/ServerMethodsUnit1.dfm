object TMetodos: TTMetodos
  OldCreateOrder = False
  Height = 252
  Width = 426
  object Conexion: TFDConnection
    Params.Strings = (
      'Database=F:\Instalador Delphie\PUREBA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object QFacuraEn: TFDQuery
    Connection = Conexion
    SQL.Strings = (
      
        'INSERT INTO CABEZA_FACTURA(NUMERO,FECHA,CLIENTE,TOTAL) VALUES(:N' +
        'UMERO,:FECHA,:CLIENTE,:TOTAL)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 192
    Top = 88
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'TOTAL'
        ParamType = ptInput
      end>
  end
  object QFacturaDe: TFDQuery
    Connection = Conexion
    SQL.Strings = (
      'INSERT INTO FACTURADE (NUMERO,PRODUCTO,CANTIDAD,VALOR) VALUES'
      '(:NUMERO,:PRODUCTO,:CANTIDAD,:VALOR);')
    Left = 296
    Top = 112
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        Name = 'PRODUCTO'
        ParamType = ptInput
      end
      item
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        ParamType = ptInput
      end>
  end
  object QProductos: TFDQuery
    Connection = Conexion
    SQL.Strings = (
      
        'UPDATE OR INSERT INTO PRODUCTOS (PRODUCTO,NOMBRE_PRODUCTO,VALOR)' +
        ' VALUES'
      '(:PRODUCTO,:NOMBRE_PRODUCTO,:VALOR);')
    Left = 104
    Top = 96
    ParamData = <
      item
        Name = 'PRODUCTO'
        ParamType = ptInput
      end
      item
        Name = 'NOMBRE_PRODUCTO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end>
  end
  object QClientes: TFDQuery
    Connection = Conexion
    SQL.Strings = (
      
        'UPDATE OR INSERT INTO CLIENTES(CLIENTE,NOMBRE_CLIENTE,DIRECCION)' +
        ' VALUES(:CLIENTE,:NOMBRE_CLIENTE,:DIRECCION)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 24
    Top = 88
    ParamData = <
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'NOMBRE_CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'DIRECCION'
        ParamType = ptInput
      end>
  end
end
