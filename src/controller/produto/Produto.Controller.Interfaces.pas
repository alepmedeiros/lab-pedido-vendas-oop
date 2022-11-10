unit Produto.Controller.Interfaces;

interface

uses
  Model.Produto,
  FireDAC.Comp.Client;

type
  iProdutoController = interface
    procedure Salvar( aValue : TProdutoModel ); overload;
    procedure Salvar( aDescricao, aValor : string ); overload;

    procedure Remover ( aValue : integer);

    procedure Editar( aValue : TProdutoModel ); overload;
    procedure Editar( aCodigo, aDescricao, aValor : string ); overload;

    function RecuperaPorCodigo(aValue: integer; aColuna: string): Variant;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;
  end;

implementation

end.
