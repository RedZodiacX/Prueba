object FrmConsulClientes: TFrmConsulClientes
  Left = 0
  Top = 0
  Caption = 'FrmConsulClientes'
  ClientHeight = 357
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 65
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 25
      Top = 16
      Width = 79
      Height = 27
      Caption = 'Consultar'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 111
      Top = 16
      Width = 79
      Height = 27
      Caption = 'Eliminar'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 283
      Top = 16
      Width = 79
      Height = 27
      Caption = 'Nuevo'
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 197
      Top = 16
      Width = 79
      Height = 27
      Caption = 'Editar'
      OnClick = SpeedButton4Click
    end
    object Label1: TLabel
      Left = 552
      Top = 11
      Width = 92
      Height = 33
      Caption = 'Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 816
    Height = 292
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 6
      Width = 801
      Height = 259
      DataSource = DataSource2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION'
          Width = 293
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SELECCIONAR'
          Width = 77
          Visible = True
        end>
    end
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = MemClientes
    FieldDefs = <>
    Response = RESTResponse2
    Left = 432
    Top = 96
  end
  object RESTResponse2: TRESTResponse
    Left = 304
    Top = 88
  end
  object RESTRequest2: TRESTRequest
    Client = RESTClient2
    Params = <
      item
        Kind = pkREQUESTBODY
        name = 'body'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 408
    Top = 24
  end
  object RESTClient2: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    Params = <
      item
        name = 'body'
      end>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 288
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = MemClientes
    Left = 224
    Top = 80
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
    Left = 376
    Top = 136
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
end
