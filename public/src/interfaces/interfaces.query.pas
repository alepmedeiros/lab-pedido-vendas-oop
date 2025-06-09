unit interfaces.query;

interface

uses
  FireDAC.Comp.Client;

type
  IQuery = interface
    ['{FDFC5D16-78AE-437B-8755-7FA8B325D5C4}']
    function getQuery : TFDQuery;
    function newquery: IQuery;
    procedure destroyQuery;
    function Open(ATable: TFDMemTable; Ascript: string): Boolean;
    function executar(Ascript: string): Boolean;
  end;

implementation

end.
