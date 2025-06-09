unit interfaces.controller.produto;

interface

uses
  FireDAC.Comp.Client,
  entidade.produto;

type
  IControllerProduto = interface
    ['{FEC0A4AF-E856-43AE-AFF7-1E46C070995A}']
    function carregartodos(out ATabela: TFDMemTable): Boolean;
    function Cadastrar(AProduto: TProduto): Boolean;
    function Editar(AProduto: TProduto): Boolean;
  end;

implementation

end.
