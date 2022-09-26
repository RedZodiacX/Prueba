unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, IPPeerClient, Vcl.Grids;

type
  TFrmConsulClientes = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTResponse2: TRESTResponse;
    RESTRequest2: TRESTRequest;
    RESTClient2: TRESTClient;
    DataSource2: TDataSource;
    MemClientes: TFDMemTable;
    MemClientesCLIENTE: TWideStringField;
    MemClientesNOMBRE_CLIENTE: TWideStringField;
    MemClientesDIRECCION: TWideStringField;
    MemClientesSELECCIONAR: TStringField;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulClientes: TFrmConsulClientes;

implementation

{$R *.dfm}

uses
  Principal, Unit2;

procedure TFrmConsulClientes.SpeedButton1Click(Sender: TObject);
begin

  MemClientes.Close;
  MemClientes.CreateDataSet;
  MemClientes.Open;

  RESTClient2.CleanupInstance;
  RESTClient2.BaseURL := 'http://localhost/datasnap/rest/TTMetodos/getclientes';
  RESTRequest2.Execute;
end;

procedure TFrmConsulClientes.SpeedButton2Click(Sender: TObject);
var
  vBook: TBookmark;
begin
  vBook := MemClientes.GetBookmark;
  MemClientes.DisableControls;
  try

    MemClientes.Filtered := True;

    while not MemClientes.Eof do
    begin
      RESTClient2.CleanupInstance;
      RESTClient2.BaseURL :=
        'http://localhost/datasnap/rest/TTMetodos/DeleteCliente/' +
        MemClientesCLIENTE.AsString;
      RESTRequest2.Execute;
      MemClientes.Next;
    end;
  finally
    MemClientes.Filtered := False;
    // MemClientes.GotoBookmark(vBook);
    MemClientes.FreeBookmark(vBook);
    MemClientes.EnableControls;

  end;
end;

procedure TFrmConsulClientes.SpeedButton3Click(Sender: TObject);
begin
  FrmGuardarCliente := TFrmGuardarCliente.Create(Self);
  FrmGuardarCliente.ShowModal;
  FrmGuardarCliente.Free;
end;

procedure TFrmConsulClientes.SpeedButton4Click(Sender: TObject);
var
  vBook: TBookmark;
begin
  vBook := MemClientes.GetBookmark;
  MemClientes.DisableControls;
  try

    MemClientes.Filtered := True;

    FrmGuardarCliente := TFrmGuardarCliente.Create(Self);
    FrmGuardarCliente.Edit3.Text := MemClientesCLIENTE.AsString;
    FrmGuardarCliente.Edit4.Text := MemClientesNOMBRE_CLIENTE.AsString;
    FrmGuardarCliente.Edit5.Text := MemClientesDIRECCION.AsString;
    FrmGuardarCliente.ShowModal;
    FrmGuardarCliente.Free;
  finally
    MemClientes.Filtered := False;
    // MemClientes.GotoBookmark(vBook);
    MemClientes.FreeBookmark(vBook);
    MemClientes.EnableControls;

  end;

end;

end.
