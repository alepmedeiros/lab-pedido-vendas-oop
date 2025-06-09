unit interfaces.configuracao;

interface

type
  IConfiguracao = interface
    ['{C5A9B80A-A031-4CB2-AD44-487EF1E2159D}']
    function carregarConfiguracoes : IConfiguracao;
    function getPathExe : string;
    function getPathDB: string;
    function getDriverID: string;
  end;

implementation

end.
