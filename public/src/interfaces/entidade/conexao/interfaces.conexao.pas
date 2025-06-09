unit interfaces.conexao;

interface

uses
  FireDAC.Comp.Client;

type
  IConexao = interface
    ['{EAF1CD83-CAEC-4896-B812-9C4C49FC22AA}']
    function Conectar: Boolean;
    procedure Desconectar;
    function getConexao: TFDConnection;
  end;

implementation

end.
