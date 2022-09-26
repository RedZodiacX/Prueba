object FrmConsulProducto: TFrmConsulProducto
  Left = 0
  Top = 0
  Caption = 'FrmConsulProductos'
  ClientHeight = 336
  ClientWidth = 833
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
    Width = 833
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
      Width = 118
      Height = 33
      Caption = 'Productos'
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
    Width = 833
    Height = 271
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 6
      Width = 825
      Height = 251
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost/datasnap/rest/TTMetodos/getproductos'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 384
    Top = 120
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 488
    Top = 88
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 552
    Top = 128
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Active = True
    Dataset = MemProductos
    FieldDefs = <>
    Response = RESTResponse1
    Left = 368
    Top = 232
  end
  object MemProductos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'PRODUCTO'
        DataType = ftWideString
        Size = 80
      end
      item
        Name = 'NOMBRE_PRODUCTO'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'VALOR'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'SELECCIONAR'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 552
    Top = 208
    object MemProductosPRODUCTO: TWideStringField
      DisplayWidth = 17
      FieldName = 'PRODUCTO'
      Size = 80
    end
    object MemProductosNOMBRE_PRODUCTO: TWideStringField
      DisplayWidth = 49
      FieldName = 'NOMBRE_PRODUCTO'
      Size = 200
    end
    object MemProductosVALOR: TWideStringField
      DisplayWidth = 23
      FieldName = 'VALOR'
      Size = 100
    end
    object MemProductosSELECCIONAR: TStringField
      DisplayWidth = 12
      FieldName = 'SELECCIONAR'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = MemProductos
    Left = 464
    Top = 176
  end
end
