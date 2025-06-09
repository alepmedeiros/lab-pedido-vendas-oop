unit interfaces.controller.pedido;

interface

uses
  FireDAC.Comp.Client,
  entidade.pedido;

type
  IControllerPedido = interface
    ['{68FC3536-6172-42F2-8852-8FCACD8BB16B}']
    function carregar(out ATabela: TFDMemTable): Boolean; overload;
    function carregar(out ATabela: TFDMemTable; ATipoConsulta: Integer; AParametro: string): Boolean; overload;
    function Cadastrar(out APedido: TPedido): Boolean;
    function Editar(APedido: TPedido): Boolean;
  end;

implementation

end.
