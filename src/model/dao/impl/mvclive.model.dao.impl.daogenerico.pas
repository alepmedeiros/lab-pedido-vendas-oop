unit mvclive.model.dao.impl.daogenerico;

interface

uses
  System.Generics.Collections,
  Data.DB,
  mvclive.model.dao.interfaces,
  mvclive.model.connection.interfaces;

type
  TDAO = class(TInterfacedObject, iDAO)
  private
    FParent: IInterface;

    FConexao: iConexao;
    FQuery: iQuery;
    FDataSet: TDataSet;
    FLista: TDictionary<String, Variant>;
  public
    constructor Create(Parent: IInterface);
    destructor Destroy; override;
    class function New(Parent: IInterface): iDAO;
    function Listar: iDAO;
    function ListarPorId: iDAO;
    function Excluir: iDAO;
    function Atualizar: iDAO;
    function Inserir: iDAO;
    function DataSet: TDataSet;
  end;

implementation

uses
  mvclive.utils.impl.utils,
  mvclive.model.connection.impl.firedac,
  mvclive.model.connection.impl.query;

function TDAO.Atualizar: iDAO;
begin
  Result := Self;
end;

constructor TDAO.Create(Parent: IInterface);
begin
  FParent := Parent;
  FConexao := TConnectionFiredac.New;
  FQuery := TQuery.New(FConexao);
  FDataSet := TDataSet.Create(nil);
  FLista:= TDictionary<String, Variant>.Create;
  TUtils.New(FParent).Query.FieldParameter(FLista);
end;

function TDAO.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TDAO.Destroy;
begin

  inherited;
end;

function TDAO.Excluir: iDAO;
begin
  Result := Self;
end;

function TDAO.Inserir: iDAO;
begin
  Result := Self;
  var lQuery := TUtils.New(FParent).Query.Insert;
  FQuery.Query(lQuery, FLista);
end;

function TDAO.Listar: iDAO;
begin
  Result := Self;
end;

function TDAO.ListarPorId: iDAO;
begin
  Result := Self;
end;

class function TDAO.New(Parent: IInterface): iDAO;
begin
  Result := Self.Create(Parent);
end;

end.
