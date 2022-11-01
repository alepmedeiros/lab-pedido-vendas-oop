unit Produto.Controller.Interfaces;

interface

uses
  Model.Produto,
  FireDAC.Comp.Client;

type
  iProdutoController = interface
    procedure Salvar( aValue : TProdutoModel );
    procedure Remover ( aValue : integer);
    procedure Editar( aValue : TProdutoModel  );

    function RecuperaPorCodigo(aValue: integer; aColuna: string): Variant;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;
  end;

implementation

end.
