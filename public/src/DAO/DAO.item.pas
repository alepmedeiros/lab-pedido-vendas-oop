unit DAO.item;

interface

uses
  interfaces.DAO.item,
  entidade.item,
  Data.FireDACJSONReflect,
  entidade.query,
  interfaces.query,
  System.SysUtils,
  FireDAC.Comp.Client;

type
  TDAOItem = class(TInterfacedObject, IDAOItem)
    constructor create;
    destructor destroy; override;
    function carregarPorPedido(ATabela: TFDMemTable; APedido: Integer): Boolean;
    function Cadastrar(AItem: TItem): Boolean;
    function Editar(AItem: TItem): Boolean;
    function Excluir(ACodigo: Integer): Boolean;
  end;

implementation

{ TDAOItem }

function TDAOItem.Cadastrar(AItem: TItem): Boolean;
var
  LQuery: IQuery;
  LValorTotal: string;
  LValorUnitario: string;
  LQuantidade: string;
begin
  LQuery := TQuery.create;

  LValorUnitario := stringreplace(FormatFloat('#,##0.00', AItem.valorUnitario), '.', '', [rfReplaceAll]);
  LValorUnitario := stringreplace(FormatFloat('#,##0.00', AItem.valorUnitario), ',', '.', [rfReplaceAll]);
  LValorTotal := stringreplace(FormatFloat('#,##0.00', AItem.valorTotal), '.', '', [rfReplaceAll]);
  LValorTotal := stringreplace(FormatFloat('#,##0.00', AItem.valorTotal), ',', '.', [rfReplaceAll]);
  LQuantidade := stringreplace(FormatFloat('#,##0.00', AItem.quantidade), '.', '', [rfReplaceAll]);
  LQuantidade := stringreplace(FormatFloat('#,##0.00', AItem.quantidade), ',', '.', [rfReplaceAll]);
  result := LQuery.executar(' INSERT INTO PEDIDOSITENS (NUMEROPEDIDO, CODIGOPRODUTO, QUANTIDADE, VALORUNITARIO, VALORTOTAL) '+
                            ' VALUES  ('+AItem.numeroPedido.ToString+', '+AItem.codigoProduto.ToString+', '+
                                         quotedStr(LQuantidade)+', '+quotedStr(LValorUnitario)+', '+quotedStr(LValorTotal)+')');
end;

constructor TDAOItem.create;
begin

end;

destructor TDAOItem.destroy;
begin

  inherited;
end;

function TDAOItem.Editar(AItem: TItem): Boolean;
var
  LQuery : IQuery;
  LValorTotal: string;
  LValorUnitario: string;
  LQuantidade: string;
begin
  LQuery := TQuery.create;
  result := false;

  LValorUnitario := stringreplace(FormatFloat('#,##0.00', AItem.valorUnitario), '.', '', [rfReplaceAll]);
  LValorUnitario := stringreplace(FormatFloat('#,##0.00', AItem.valorUnitario), ',', '.', [rfReplaceAll]);
  LValorTotal := stringreplace(FormatFloat('#,##0.00', AItem.valorTotal), '.', '', [rfReplaceAll]);
  LValorTotal := stringreplace(FormatFloat('#,##0.00', AItem.valorTotal), ',', '.', [rfReplaceAll]);
  LQuantidade := stringreplace(FormatFloat('#,##0.00', AItem.quantidade), '.', '', [rfReplaceAll]);
  LQuantidade := stringreplace(FormatFloat('#,##0.00', AItem.quantidade), ',', '.', [rfReplaceAll]);
  result := LQuery.executar(' UPDATE PEDIDOSITENS SET QUANTIDADE = '+quotedStr(LQuantidade)+', '+
                            ' VALORUNITARIO = '+quotedStr(LValorUnitario)+', VALORTOTAL = '+quotedStr(LValorTotal)+' '+
                            ' WHERE CODIGO = '+AItem.codigo.ToString);
end;

function TDAOItem.Excluir(ACodigo: Integer): Boolean;
var
  LQuery : IQuery;
  LValor: string;
begin
  LQuery := TQuery.create;

  result := LQuery.executar('DELETE FROM PEDIDOSITENS WHERE CODIGO = '+ACodigo.ToString);
end;

function TDAOItem.carregarPorPedido(ATabela: TFDMemTable; APedido: Integer): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.Open(ATabela,
    ' SELECT I.CODIGO, I.NUMEROPEDIDO, I.CODIGOPRODUTO, I.QUANTIDADE, I.VALORUNITARIO, I.VALORTOTAL, PD.DESCRICAO, PD.VALOR'+
    ' FROM PEDIDOSITENS I'+
    ' INNER JOIN PEDIDOS P ON P.NUMEROPEDIDO = I.NUMEROPEDIDO'+
    ' LEFT JOIN PRODUTO PD ON PD.CODIGO = I.codigoproduto'+
    ' WHERE I.numeropedido = '+APedido.ToString);
end;

end.

