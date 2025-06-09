unit interfaces.controller.cidade;

interface

uses
  entidade.cidade,
  FireDAC.Comp.Client;


type
  IControllerCidade = interface
  ['{4D30E6AD-10EE-4012-88B8-2775B3B67EBA}']
    function Load(out ATable: TFDMemTable): Boolean;
    function Cadastrar(ACidade: TCidade): Boolean;
  end;

implementation

end.
