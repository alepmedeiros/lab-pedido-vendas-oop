unit DAO.produto;

interface

uses
  interfaces.DAO.produto,
  entidade.produto,
  Data.FireDACJSONReflect,
  entidade.query,
  interfaces.query,
  System.SysUtils,
  FireDAC.Comp.Client;

type
  TDAOProduto = class(TInterfacedObject, IDAOProduto)
    constructor create;
    destructor destroy; override;
    function carregarTodos(ATabela: TFDMemTable): Boolean;
    function Cadastrar(AProduto: TProduto): Boolean;
    function Editar(AProduto: TProduto): Boolean;
  end;

implementation

{ TDAOProduto }

function TDAOProduto.Cadastrar(AProduto: TProduto): Boolean;
var
  LQuery : IQuery;
  LValor: string;
begin
  LQuery := TQuery.create;

  LValor := stringreplace(FormatFloat('#,##0.00', AProduto.Valor), '.', '', [rfReplaceAll]);
  LValor := stringreplace(FormatFloat('#,##0.00', AProduto.Valor), ',', '.', [rfReplaceAll]);
  result := LQuery.executar('INSERT INTO PRODUTO (DESCRICAO, VALOR) VALUES  ('+quotedStr(AProduto.descricao)+', '+quotedStr(LValor)+')');
end;

constructor TDAOProduto.create;
begin

end;

destructor TDAOProduto.destroy;
begin

  inherited;
end;

function TDAOProduto.Editar(AProduto: TProduto): Boolean;
var
  LQuery : IQuery;
  LValor: string;
begin
  LQuery := TQuery.create;

  LValor := stringreplace(FormatFloat('#,##0.00', AProduto.Valor), '.', '', [rfReplaceAll]);
  LValor := stringreplace(FormatFloat('#,##0.00', AProduto.Valor), ',', '.', [rfReplaceAll]);
  result := LQuery.executar('UPDATE PRODUTO SET DESCRICAO = '+quotedStr(AProduto.descricao)+', VALOR = '+quotedStr(LValor)+' WHERE CODIGO = '+AProduto.codigo.ToString);
end;

function TDAOProduto.carregarTodos(ATabela: TFDMemTable): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.Open(ATabela, 'SELECT P.CODIGO, P.DESCRICAO, P.VALOR FROM PRODUTO P');
end;


end.
