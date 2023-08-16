unit mvclive.model.dao.interfaces;

interface

uses
  Data.DB;

type
  iDAO = interface
    function Listar: iDAO;
    function ListarPorId: iDAO;
    function Excluir: iDAO;
    function Atualizar: iDAO;
    function Inserir: iDAO;
    function DataSet: TDataSet;
  end;

implementation

end.
