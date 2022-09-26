unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  System.Json, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmGuardarCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGuardarCliente: TFrmGuardarCliente;

implementation

{$R *.dfm}

uses
  Principal;

procedure TFrmGuardarCliente.Button1Click(Sender: TObject);
var
  Json: TJSONObject;
  JSONString: String;
  QConsulta: TFDQuery;
begin


  Json := TJSONObject.Create;
  if Edit3.Text <> '' then
  Json.AddPair('CLIENTE', TJSONString.Create(Edit3.Text))
  else
  Json.AddPair('CLIENTE', TJSONString.Create('0'));

  Json.AddPair('NOMBRE_CLIENTE', TJSONString.Create(Edit4.Text));
  Json.AddPair('DIRECCION', TJSONString.Create(Edit5.Text));

  JSONString := Json.ToString;

  try
    FrmMain.RESTClient1.CleanupInstance;
    FrmMain.RESTRequest1.Method := TRESTRequestMethod.rmPOST;
    FrmMain.RESTClient1.BaseURL :=
      'http://localhost/datasnap/rest/TTMetodos/GenerarCLiente';
    FrmMain.RESTRequest1.params[0].Value := JSONString;
    FrmMain.RESTRequest1.Execute;
    showmessage('Cliente guardado con exito');
  except
    showmessage('No se pudo guardar el cliente');
  end;

end;

end.
