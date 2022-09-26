object FrmGuardarCliente: TFrmGuardarCliente
  Left = 0
  Top = 0
  Caption = 'FrmGuardarCliente'
  ClientHeight = 342
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 147
    Width = 71
    Height = 19
    Caption = 'Direccion:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 48
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 13
      Width = 75
      Height = 29
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 48
    Width = 679
    Height = 294
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 21
      Height = 19
      Caption = 'Id:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 60
      Width = 63
      Height = 19
      Caption = 'Nombre:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 104
      Top = 18
      Width = 241
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 104
      Top = 58
      Width = 241
      Height = 21
      TabOrder = 1
    end
  end
  object Edit5: TEdit
    Left = 104
    Top = 140
    Width = 241
    Height = 21
    TabOrder = 2
  end
end
