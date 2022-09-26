object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 177
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 214
    Height = 177
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -16
    ExplicitTop = -32
    ExplicitWidth = 525
    ExplicitHeight = 307
    object SpeedButton1: TSpeedButton
      Left = 24
      Top = 24
      Width = 169
      Height = 41
      Caption = 'CLIENTES'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 24
      Top = 70
      Width = 169
      Height = 41
      Caption = 'PRODUCTOS'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 24
      Top = 117
      Width = 169
      Height = 41
      Caption = 'FACTURAS'
      OnClick = SpeedButton3Click
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    Params = <
      item
        name = 'body'
      end>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 8
    Top = 8
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 72
  end
  object RESTResponse1: TRESTResponse
    Left = 144
    Top = 8
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = MemClientes
    FieldDefs = <>
    Response = RESTResponse1
    Left = 16
    Top = 64
  end
  object MemClientes: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 96
    Top = 56
    object MemClientesCLIENTE: TWideStringField
      FieldName = 'CLIENTE'
      Size = 10
    end
    object MemClientesNOMBRE_CLIENTE: TWideStringField
      FieldName = 'NOMBRE_CLIENTE'
      Size = 50
    end
    object MemClientesDIRECCION: TWideStringField
      FieldName = 'DIRECCION'
      Size = 50
    end
    object MemClientesSELECCIONAR: TStringField
      FieldName = 'SELECCIONAR'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = MemClientes
    Left = 16
    Top = 120
  end
end
