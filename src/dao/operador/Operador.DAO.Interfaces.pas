unit Operador.DAO.Interfaces;

interface

uses
  Model.Operador,
  FireDAC.Comp.Client,
  Data.DB;

type
  iOperadorDAO = interface
    procedure Salvar( aValue : TOperadorModel );
    procedure Remover ( aValue : integer);
    procedure Editar( aValue : TOperadorModel );

    function RecuperaPorCodigo( aValue : integer ) : string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;
  end;

implementation

end.
