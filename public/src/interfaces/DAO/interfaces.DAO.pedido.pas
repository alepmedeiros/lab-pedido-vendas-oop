unit interfaces.DAO.pedido;

interface

uses
  entidade.pedido,
  FireDAC.Comp.Client;

type
  IDAOPedido = interface
    ['{104B0BD9-6B57-4263-BD71-4239E42A0825}']
    function carregar(out ATabela: TFDMemTable): Boolean; overload;
    function carregar(out ATabela: TFDMemTable; ATipoConsulta: Integer; AParametro: string): Boolean; overload;
    function Cadastrar(out APedido: TPedido): Boolean;
    function Editar(APedido: TPedido): Boolean;
  end;

implementation

end.
