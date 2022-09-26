unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, system.json,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Types, REST.Client,
  REST.Response.Adapter, Data.Bind.Components, Data.Bind.ObjectScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, IPPeerClient, Vcl.Grids;

type
  TFrmFactura = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DBComboBox1: TDBComboBox;
    Label2: TLabel;
    Label3: TLabel;
    MemFacturaDet: TFDMemTable;
    MemFacturaDetPRODUCTO: TIntegerField;
    MemFacturaDetCANTIDAD: TFloatField;
    MemFacturaDetVALOR: TFloatField;
    DataSource1: TDataSource;
    RESTClient1: TRESTClient;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    DBGrid1: TDBGrid;
    MemFacturaCliente: TFDMemTable;
    MemFacturaClienteCLIENTE: TIntegerField;
    MemFacturaClienteNOMBRE_CLIENTE: TStringField;
    DataSource2: TDataSource;
    procedure MemFacturaClienteChange();
    procedure MemFacturaDetPRODUCTOChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFactura: TFrmFactura;

implementation

{$R *.dfm}
uses
Principal;

procedure TFrmFactura.FormCreate(Sender: TObject);
begin

//  MemFacturaClienteChange();

  MemFacturaDet.Close;
  MemFacturaDet.CreateDataSet;
  MemFacturaDet.Open;



end;

procedure TFrmFactura.MemFacturaDetPRODUCTOChange(Sender: TField);
var
jvalue : TJSONValue;
begin

  RESTClient1.BaseURL :=
    'http://localhost/datasnap/rest/TTMetodos/getproducto/' +
    (Sender.AsString);
  RESTRequest1.Execute;
  jvalue := RESTResponse1.JSONValue;
  showmessage(jvalue.GetValue<String>('nombre_producto'));
end;

procedure TFrmFactura.MemFacturaClienteChange();
var
jvalue : TJSONValue;
begin
  MemFacturaCliente.Close;
  MemFacturaCliente.CreateDataSet;
  MemFacturaCliente.Open;

  RESTClient1.BaseURL := 'http://localhost/datasnap/rest/TTMetodos/getclientes';
  RESTRequest1.Execute;
  jvalue := RESTResponse1.JSONValue;
end;

end.
