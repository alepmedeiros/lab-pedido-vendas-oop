unit DAO.pedido;

interface

uses
  interfaces.DAO.pedido,
  entidade.pedido,
  Data.FireDACJSONReflect,
  entidade.query,
  interfaces.query,
  System.SysUtils,
  FireDAC.Comp.Client;

type
  TDAOPedido = class(TInterfacedObject, IDAOPedido)
    constructor create;
    destructor destroy; override;
    function carregar(out ATabela: TFDMemTable): Boolean; overload;
    function carregar(out ATabela: TFDMemTable; ATipoConsulta: Integer; AParametro: string): Boolean; overload;
    function Cadastrar(out APedido: TPedido): Boolean;
    function Editar(APedido: TPedido): Boolean;
  end;

implementation

{ TDAOPedido }

function TDAOPedido.Cadastrar(out APedido: TPedido): Boolean;
var
  LQuery : IQuery;
  LValor: string;
begin
  LQuery := TQuery.create;

  LValor := stringreplace(FormatFloat('#,##0.00', APedido.valortotal), '.', '', [rfReplaceAll]);
  LValor := stringreplace(FormatFloat('#,##0.00', APedido.valortotal), ',', '.', [rfReplaceAll]);
  result := LQuery.executar(' INSERT INTO PEDIDOS (CODIGOCLIENTE, DATAEMISSAO, VALORTOTAL) VALUES  ('+
                              APedido.cliente.Codigo.ToString+', '+quotedStr(FormatDateTime('dd/MM/yyyy HH:nn:ss', APedido.dataemissao))+', '+quotedStr(LValor)+')');

  APedido.numeropedido := LQuery.recuperarUltimoId('SELECT MAX(numeropedido) as numeropedido FROM PEDIDOS');
end;

function TDAOPedido.carregar(out ATabela: TFDMemTable; ATipoConsulta: Integer;
  AParametro: string): Boolean;
var
  LQuery: IQuery;
  LScript: string;
begin
  LQuery := TQuery.create;
  LScript := ' SELECT P.NUMEROPEDIDO, P.CODIGOCLIENTE, P.DATAEMISSAO, P.VALORTOTAL, C.NOME '+
                                 ' FROM PEDIDOS P LEFT JOIN CLIENTE C ON C.CODIGO = P.CODIGOCLIENTE ';

  case ATipoConsulta of
    0: LScript := LScript + 'WHERE P.NUMEROPEDIDO = '+AParametro;
    1: LScript := LScript + 'WHERE C.NOME = '+quotedStr(AParametro);
  end;

  result := LQuery.Open(ATabela, LScript);

end;

function TDAOPedido.carregar(out ATabela: TFDMemTable): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.Open(ATabela, 'SELECT P.NUMEROPEDIDO, P.CODIGOCLIENTE, P.DATAEMISSAO, P.VALORTOTAL, C.NOME FROM PEDIDOS P LEFT JOIN CLIENTE C ON C.CODIGO = P.CODIGOCLIENTE');
end;

constructor TDAOPedido.create;
begin

end;

destructor TDAOPedido.destroy;
begin

  inherited;
end;

function TDAOPedido.Editar(APedido: TPedido): Boolean;
var
  LQuery : IQuery;
  LValor: string;
begin
  LQuery := TQuery.create;

  LValor := stringreplace(FormatFloat('#,##0.00', APedido.valortotal), '.', '', [rfReplaceAll]);
  LValor := stringreplace(FormatFloat('#,##0.00', APedido.valortotal), ',', '.', [rfReplaceAll]);
  result := LQuery.executar('UPDATE PEDIDOS SET CODIGOCLIENTE = '+APedido.cliente.Codigo.ToString+', VALORTOTAL = '+quotedStr(LValor)+' WHERE NUMEROPEDIDO = '+APedido.numeropedido.ToString);
end;

end.
