unit DAO.cliente;

interface

uses
  interfaces.DAO.Cliente,
  entidade.cliente,
  Data.FireDACJSONReflect,
  entidade.query,
  interfaces.query,
  System.SysUtils,
  FireDAC.Comp.Client;

type
  TDAOCliente = class(TInterfacedObject, IDAOCliente)
    constructor create;
    destructor destroy; override;
    function carregarTodos(ATabela: TFDMemTable): Boolean;
    function Cadastrar(ACliente: TCliente): Boolean;
    function Editar(ACliente: TCliente): Boolean;
  end;

implementation

{ TDAOCliente }

function TDAOCliente.Cadastrar(ACliente: TCliente): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.executar('INSERT INTO CLIENTE(NOME, CODIGOCIDADE) VALUES('+quotedStr(ACliente.Nome)+', '+ACliente.Cidade.codigo.ToString+')');
end;

constructor TDAOCliente.create;
begin

end;

destructor TDAOCliente.destroy;
begin

  inherited;
end;

function TDAOCliente.Editar(ACliente: TCliente): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.executar('UPDATE CLIENTE SET NOME = '+quotedStr(ACliente.Nome)+', CODIGOCIDADE = '+ACliente.Cidade.codigo.ToString+' WHERE CODIGO = '+ACliente.codigo.ToString);
end;

function TDAOCliente.carregarTodos(ATabela: TFDMemTable): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.Open(ATabela, 'SELECT C.CODIGO, C.NOME, C.CODIGOCIDADE, CID.CIDADE, CID.UF FROM CLIENTE C LEFT JOIN CIDADE CID ON CID.CODIGO = C.CODIGOCIDADE');
end;

end.
