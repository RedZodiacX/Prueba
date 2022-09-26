unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Response.Adapter, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, IPPeerClient, Vcl.Grids;

type
  TFrmConsulProducto = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Panel2: TPanel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemProductos: TFDMemTable;
    DataSource1: TDataSource;
    MemProductosPRODUCTO: TWideStringField;
    MemProductosNOMBRE_PRODUCTO: TWideStringField;
    MemProductosVALOR: TWideStringField;
    MemProductosSELECCIONAR: TStringField;
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
  FrmConsulProducto: TFrmConsulProducto;

implementation

{$R *.dfm}

uses
Unit4;

procedure TFrmConsulProducto.SpeedButton1Click(Sender: TObject);
begin

  MemProductos.Close;
  MemProductos.CreateDataSet;
  MemProductos.Open;

  RESTClient1.CleanupInstance;
  RESTClient1.BaseURL := 'http://localhost/datasnap/rest/TTMetodos/getproductos';
  RESTRequest1.Execute;
end;

procedure TFrmConsulProducto.SpeedButton2Click(Sender: TObject);
var
  vBook: TBookmark;
begin
  vBook := MemProductos.GetBookmark;
  MemProductos.DisableControls;
  try

    MemProductos.Filtered := True;

    while not MemProductos.Eof do
    begin
      RESTClient1.CleanupInstance;
      RESTClient1.BaseURL :=
        'http://localhost/datasnap/rest/TTMetodos/DeleteProducto/' +
        MemProductosPRODUCTO.AsString;
      RESTRequest1.Execute;
      MemProductos.Next;
    end;
  finally
    MemProductos.Filtered := False;
    // MemProductos.GotoBookmark(vBook);
    MemProductos.FreeBookmark(vBook);
    MemProductos.EnableControls;

  end;
end;

procedure TFrmConsulProducto.SpeedButton3Click(Sender: TObject);
begin
  FrmGuardarProducto := TFrmGuardarProducto.Create(Self);
  FrmGuardarProducto.ShowModal;
  FrmGuardarProducto.Free;
end;

procedure TFrmConsulProducto.SpeedButton4Click(Sender: TObject);
var
  vBook: TBookmark;
begin
  vBook := MemProductos.GetBookmark;
  MemProductos.DisableControls;
  try

    MemProductos.Filtered := True;

    FrmGuardarProducto := TFrmGuardarProducto.Create(Self);
    FrmGuardarProducto.Edit3.Text := MemProductosPRODUCTO.AsString;
    FrmGuardarProducto.Edit4.Text := MemProductosNOMBRE_PRODUCTO.AsString;
    FrmGuardarProducto.Edit5.Text := MemProductosVALOR.AsString;
    FrmGuardarProducto.ShowModal;
    FrmGuardarProducto.Free;
  finally
    MemProductos.Filtered := False;
    // MemProductos.GotoBookmark(vBook);
    MemProductos.FreeBookmark(vBook);
    MemProductos.EnableControls;

  end;
end;

end.
