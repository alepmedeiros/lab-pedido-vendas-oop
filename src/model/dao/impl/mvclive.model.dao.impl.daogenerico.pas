unit mvclive.model.dao.impl.daogenerico;

interface

uses
  Data.DB,
  mvclive.model.dao.interfaces;

type
  TDAO<T: IInterface> = class(TInterfacedObject, iDAO<T>)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAO<T>;
    function Listar: iDAO<T>;
    function ListarPorId(Id: Variant): iDAO<T>;
    function Excluir: iDAO<T>;
    function Atualizar: iDAO<T>;
    function Inserir: iDAO<T>;
    function DataSet: TDataSet;
  end;

implementation

function TDAO<T>.Atualizar: iDAO<T>;
begin

end;

constructor TDAO<T>.Create;
begin

end;

function TDAO<T>.DataSet: TDataSet;
begin

end;

destructor TDAO<T>.Destroy;
begin

  inherited;
end;

function TDAO<T>.Excluir: iDAO<T>;
begin

end;

function TDAO<T>.Inserir: iDAO<T>;
begin

end;

function TDAO<T>.Listar: iDAO<T>;
begin

end;

function TDAO<T>.ListarPorId(Id: Variant): iDAO<T>;
begin

end;

class function TDAO<T>.New: iDAO<T>;
begin
  Result := Self.Create;
end;

end.
