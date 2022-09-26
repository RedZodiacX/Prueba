object FrmFactura: TFrmFactura
  Left = 0
  Top = 0
  Caption = 'FrmFactura'
  ClientHeight = 445
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Cliente:'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Total:'
    end
    object Label3: TLabel
      Left = 64
      Top = 56
      Width = 37
      Height = 16
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBComboBox1: TDBComboBox
      Left = 64
      Top = 13
      Width = 145
      Height = 21
      DataField = 'NOMBRE_CLIENTE'
      DataSource = DataSource2
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 753
    Height = 243
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 6
      Width = 737
      Height = 231
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUCTO'
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 96
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 348
    Width = 753
    Height = 97
    Align = alBottom
    TabOrder = 2
  end
  object MemFacturaDet: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 624
    Top = 176
    object MemFacturaDetPRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
      OnChange = MemFacturaDetPRODUCTOChange
    end
    object MemFacturaDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object MemFacturaDetVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object DataSource1: TDataSource
    DataSet = MemFacturaDet
    Left = 624
    Top = 120
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost/datasnap/rest/TTMetodos/getproductos'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 208
    Top = 120
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = MemFacturaDet
    FieldDefs = <>
    Response = RESTResponse1
    Left = 496
    Top = 120
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 280
    Top = 120
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 368
    Top = 120
  end
  object MemFacturaCliente: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 208
    Top = 176
    object MemFacturaClienteCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object MemFacturaClienteNOMBRE_CLIENTE: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Size = 100
    end
  end
  object DataSource2: TDataSource
    DataSet = MemFacturaCliente
    Left = 304
    Top = 176
  end
end
