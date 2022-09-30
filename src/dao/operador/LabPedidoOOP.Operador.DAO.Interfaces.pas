unit LabPedidoOOP.Operador.DAO.Interfaces;

interface

uses
  LabPedidoOOP.Model.Operador,
  FireDAC.Comp.Client,
  Data.DB;

type
  iOperadorDAO = interface
    procedure Salvar( aValue : TOperadorModel );
    procedure Remover ( aValue : integer);
    procedure EditaOperador( aValue : TOperadorModel );

    function RecuperaPorCodigo( aValue : integer ) : string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos(aValue : TDataSet) : TFDMemTable ;
  end;

implementation

end.
