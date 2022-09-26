program Cliente;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmMain},
  Unit2 in 'Unit2.pas' {FrmGuardarCliente},
  Unit3 in 'Unit3.pas' {FrmConsulClientes},
  Unit1 in 'Unit1.pas' {FrmConsulProducto},
  Unit4 in 'Unit4.pas' {FrmGuardarProducto},
  Unit5 in 'Unit5.pas' {FrmFactura};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmGuardarCliente, FrmGuardarCliente);
  Application.CreateForm(TFrmConsulClientes, FrmConsulClientes);
  Application.CreateForm(TFrmConsulProducto, FrmConsulProducto);
  Application.CreateForm(TFrmGuardarProducto, FrmGuardarProducto);
  Application.CreateForm(TFrmFactura, FrmFactura);
  Application.Run;
end.
