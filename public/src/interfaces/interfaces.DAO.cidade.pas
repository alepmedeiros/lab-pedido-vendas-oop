unit interfaces.DAO.cidade;

interface

uses
  entidade.cidade,
  FireDAC.Comp.Client;

type
  IDAOcidade = interface
  ['{B086275F-81E4-4753-A2F1-D54C3D3715E6}']
    function load(ATable: TFDMemTable): Boolean;
    function Cadastrar(ACidade: TCidade): Boolean;
  end;

implementation

end.
