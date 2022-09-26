unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, Unit2, IPPeerClient;

type
  TFrmMain = class(TForm)
    Panel2: TPanel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemClientes: TFDMemTable;
    DataSource1: TDataSource;
    MemClientesCLIENTE: TWideStringField;
    MemClientesNOMBRE_CLIENTE: TWideStringField;
    MemClientesDIRECCION: TWideStringField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    MemClientesSELECCIONAR: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}
uses
Unit3, Unit1, Unit5;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
FrmConsulClientes := TFrmConsulClientes.Create(Self);
  FrmConsulClientes.ShowModal;
  FrmConsulClientes.Free;
end;

procedure TFrmMain.SpeedButton2Click(Sender: TObject);
begin
FrmConsulProducto := TFrmConsulProducto.Create(Self);
  FrmConsulProducto.ShowModal;
  FrmConsulProducto.Free;
end;

procedure TFrmMain.SpeedButton3Click(Sender: TObject);
begin
 FrmFactura := TFrmFactura.Create(Self);
  FrmFactura.ShowModal;
  FrmFactura.Free;
end;

end.
