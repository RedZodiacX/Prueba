unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
  Datasnap.DSServer, Datasnap.DSAuth, EncdDecd, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
{$METHODINFO ON}
  TTMetodos = class(TDataModule)
    Conexion: TFDConnection;
    QFacuraEn: TFDQuery;
    QFacturaDe: TFDQuery;
    QProductos: TFDQuery;
    QClientes: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GenerarFactura(Json: TJSONObject): TJSONObject;
    function updateGenerarFactura(Json: TJSONObject): TJSONObject;
    function GenerarCliente(Json: TJSONObject): TJSONObject;
    function updateGenerarCLiente(Json: TJSONObject): TJSONObject;
    function GenerarProducto(Json: TJSONObject): TJSONObject;
    function updateGenerarProducto(Json: TJSONObject): TJSONObject;
    function getClientes: TJSONArray;

    function DeleteCliente(Id: Integer): TJSONObject;
    function getProductos: TJSONArray;
    function getProducto(Id:Integer): TJSONObject;
    function DeleteProducto(Id: Integer): TJSONObject;

  var
    Ruta: string;
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}
{ TTMetodos }

function TTMetodos.DeleteCliente(Id: Integer): TJSONObject;
var
  QCliente: TFDQuery;
  JsonOb: TJSONObject;
begin
  QCliente := TFDQuery.Create(nil);

  QCliente.Connection := Conexion;

  QCliente.Close;
  QCliente.SQL.Add('Delete from clientes where cliente =:cliente');
  QCliente.ParamByName('cliente').AsInteger := Id;
  QCliente.ExecSQL;

  JsonOb := TJSONObject.Create;
  JsonOb.AddPair('Code', TJSONString.Create('200'));
  JsonOb.AddPair('Descripcion', TJSONString.Create('Se elimino el cliente'));

  Result := JsonOb;

end;

function TTMetodos.DeleteProducto(Id: Integer): TJSONObject;
var
  QProducto: TFDQuery;
  JsonOb: TJSONObject;
begin
  QProducto := TFDQuery.Create(nil);

  QProducto.Connection := Conexion;

  QProducto.Close;
  QProducto.SQL.Add('delete from productos where producto =:producto');
  QProducto.ParamByName('producto').AsInteger := Id;
  QProducto.ExecSQL;

  JsonOb := TJSONObject.Create;
  JsonOb.AddPair('Code', TJSONString.Create('200'));
  JsonOb.AddPair('Descripcion', TJSONString.Create('Se elimino el producto'));

  Result := JsonOb;

end;

function TTMetodos.GenerarCliente(Json: TJSONObject): TJSONObject;
var
  Arreglo: TJSONArray;
  JsonOb: TJSONObject;
begin
  { }

end;

function TTMetodos.GenerarFactura(Json: TJSONObject): TJSONObject;
var
  Arreglo: TJSONArray;
  JsonOb: TJSONObject;
begin
  { }

end;

function TTMetodos.GenerarProducto(Json: TJSONObject): TJSONObject;
var
  Arreglo: TJSONArray;
  JsonOb: TJSONObject;
begin
  { }

end;

function TTMetodos.getClientes: TJSONArray;
var
  Arreglo: TJSONArray;

  JsonOb, Json: TJSONObject;
  QConsulta: TFDQuery;

begin
  Arreglo := TJSONArray.Create;

  QConsulta := TFDQuery.Create(nil);
  QConsulta.Connection := Conexion;

  QConsulta.Close;
  QConsulta.SQL.Add('select cliente, nombre_cliente, direccion from clientes');
  QConsulta.Open;
  QConsulta.First;

  while not QConsulta.Eof do
  begin
    JsonOb := TJSONObject.Create;
    JsonOb.AddPair('CLIENTE',
      TJSONString.Create(QConsulta.FieldByName('CLIENTE').AsString));
    JsonOb.AddPair('NOMBRE_CLIENTE',
      TJSONString.Create(QConsulta.FieldByName('NOMBRE_CLIENTE').AsString));
    JsonOb.AddPair('DIRECCION',
      TJSONString.Create(QConsulta.FieldByName('DIRECCION').AsString));

    Arreglo.AddElement(JsonOb);
    QConsulta.Next;

  end;

  Result := Arreglo;

end;

function TTMetodos.getProducto(Id: Integer): TJSONObject;
var
  QProducto: TFDQuery;
  JsonOb: TJSONObject;
begin
  QProducto := TFDQuery.Create(nil);

  QProducto.Connection := Conexion;

  QProducto.Close;
  QProducto.SQL.Add('select producto, nombre_producto, valor from productos where producto =:producto');
  QProducto.ParamByName('producto').AsInteger := Id;
  QProducto.Open;

  JsonOb := TJSONObject.Create;
  JsonOb.AddPair('producto', TJSONString.Create(QProducto.FieldByName('producto').AsString));
  JsonOb.AddPair('nombre_producto', TJSONString.Create(QProducto.FieldByName('nombre_producto').AsString));
    JsonOb.AddPair('valor', TJSONString.Create(QProducto.FieldByName('valor').AsString));

  Result := JsonOb;


end;

function TTMetodos.getProductos: TJSONArray;
var
  Arreglo: TJSONArray;

  JsonOb: TJSONObject;
  QConsulta: TFDQuery;
begin
  Arreglo := TJSONArray.Create;

  QConsulta := TFDQuery.Create(nil);
  QConsulta.Connection := Conexion;

  QConsulta.Close;
  QConsulta.SQL.Add('select producto, nombre_producto, valor from productos');
  QConsulta.Open;
  QConsulta.First;

  while not QConsulta.Eof do
  begin
    JsonOb := TJSONObject.Create;
    JsonOb.AddPair('PRODUCTO',
      TJSONString.Create(QConsulta.FieldByName('PRODUCTO').AsString));
    JsonOb.AddPair('NOMBRE_PRODUCTO',
      TJSONString.Create(QConsulta.FieldByName('NOMBRE_PRODUCTO').AsString));
    JsonOb.AddPair('VALOR', TJSONString.Create(QConsulta.FieldByName('VALOR')
      .AsString));

    Arreglo.AddElement(JsonOb);
    QConsulta.Next;

  end;

  Result := Arreglo;
end;

function TTMetodos.updateGenerarCLiente(Json: TJSONObject): TJSONObject;
var
  Arreglo: TJSONArray;
  JSonValue: TJSonValue;
  JsonOb: TJSONObject;
  stream: TMemoryStream;

  ArrayElement: TJSonValue;
  Cliente: String;
begin

  if (Json.GetValue<Integer>('CLIENTE')) <> 0 then
    QClientes.ParamByName('CLIENTE').AsInteger :=
      Json.GetValue<Integer>('CLIENTE');

  Cliente := Json.GetValue<String>('NOMBRE_CLIENTE');

  QClientes.ParamByName('NOMBRE_CLIENTE').AsString := Cliente;
  QClientes.ParamByName('DIRECCION').AsString :=
    Json.GetValue<String>('DIRECCION');

  QClientes.ExecSQL;

  JsonOb := TJSONObject.Create;
  JsonOb.AddPair('Code', TJSONString.Create('200'));
  JsonOb.AddPair('Cliente', TJSONString.Create(Cliente));

  Result := JsonOb;

end;

function TTMetodos.updateGenerarFactura(Json: TJSONObject): TJSONObject;
var
  Arreglo: TJSONArray;
  JSonValue: TJSonValue;
  JsonOb: TJSONObject;
  stream: TMemoryStream;

  ArrayElement: TJSonValue;
  Numero: String;
begin

  Numero := Json.GetValue<string>('Numero');

  QFacuraEn.ParamByName('FECHA').AsString := Json.GetValue<String>('FECHA');
  QFacuraEn.ParamByName('CLIENTE').AsInteger :=
    Json.GetValue<Integer>('CLIENTE');
  QFacuraEn.ParamByName('TOTAL').AsFloat := Json.GetValue<Double>('TOTAL');

  QFacuraEn.ExecSQL;

  JSonValue := Json.GetValue('DETALLE_FACTURA');
  Arreglo := JSonValue as TJSONArray;
  for ArrayElement in Arreglo do
  begin
    QFacturaDe.ParamByName('NUMERO').AsInteger :=
      Json.GetValue<Integer>('NUMERO');

    QFacturaDe.ParamByName('PRODUCTO').AsInteger :=
      ArrayElement.GetValue<Integer>('PRODUCTO');

    QFacturaDe.ParamByName('CANTIDAD').AsFloat := ArrayElement.GetValue<Double>
      ('CANTIDAD');
    QFacturaDe.ParamByName('TOTAL').AsFloat :=
      ArrayElement.GetValue<Double>('TOTAL');
    QFacturaDe.ExecSQL;
  end;

  JsonOb := TJSONObject.Create;
  JsonOb.AddPair('Code', TJSONString.Create('200'));
  JsonOb.AddPair('Numero', TJSONString.Create(Numero));

  Result := JsonOb;

end;

function TTMetodos.updateGenerarProducto(Json: TJSONObject): TJSONObject;
var
  JsonOb: TJSONObject;
  Producto: String;
begin

  if (Json.GetValue<Integer>('PRODUCTO')) <> 0 then
    QProductos.ParamByName('PRODUCTO').AsInteger :=
      Json.GetValue<Integer>('PRODUCTO');

  Producto := Json.GetValue<String>('NOMBRE_PRODUCTO');

  QProductos.ParamByName('NOMBRE_PRODUCTO').AsString := Producto;
  QProductos.ParamByName('VALOR').AsString := Json.GetValue<String>('VALOR');

  QProductos.ExecSQL;

  JsonOb := TJSONObject.Create;
  JsonOb.AddPair('Code', TJSONString.Create('200'));
  JsonOb.AddPair('Producto', TJSONString.Create(Producto));

  Result := JsonOb;

end;

end.
