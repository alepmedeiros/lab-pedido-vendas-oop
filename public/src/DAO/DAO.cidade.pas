unit DAO.cidade;

interface

uses
  interfaces.DAO.Cidade,
  entidade.cidade,
  Data.FireDACJSONReflect,
  entidade.query,
  interfaces.query,
  System.SysUtils,
  FireDAC.Comp.Client;

type
  TDAOCidade = class(TInterfacedObject, IDAOCidade)
    constructor create;
    destructor destroy; override;
    function load(ATable: TFDMemTable): Boolean;
    function Cadastrar(ACidade: TCidade): Boolean;
    function editar(ACidade: TCidade): Boolean;
  end;

implementation

{ TDAOCidade }

function TDAOCidade.Cadastrar(ACidade: TCidade): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.executar('INSERT INTO CIDADE (CIDADE, UF) VALUES  ('+quotedStr(ACidade.Cidade)+', '+quotedStr(ACidade.UF)+')');
end;

constructor TDAOCidade.create;
begin

end;

destructor TDAOCidade.destroy;
begin

  inherited;
end;

function TDAOCidade.editar(ACidade: TCidade): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.executar('UPDATE CIDADE SET CIDADE = '+quotedStr(ACidade.Cidade)+', UF = '+quotedStr(ACidade.UF)+' WHERE CODIGO = '+ACidade.codigo.ToString);
end;

function TDAOCidade.load(ATable: TFDMemTable): Boolean;
var
  LQuery : IQuery;
begin
  LQuery := TQuery.create;

  result := LQuery.Open(ATable, 'SELECT C.CODIGO, C.CIDADE, C.UF FROM CIDADE C');
end;

end.
