unit Model.Connections.Interfaces;

interface

uses
  System.Classes,
  Data.DB;

type
  iModelConnectionQuery = interface
    ['{E755F57F-073D-46DA-BC6A-0ED00ECC8623}']
    function SQL : TStrings;
    function ExecSQl : iModelConnectionQuery;
    function Open : iModelConnectionQuery;
    function DataSource (aValue : TDataSource) : iModelConnectionQuery;

  end;

  iModelConnectionGeneric = interface
    ['{015FF994-BE14-46D5-AFCF-F45773764B88}']
    function Component : TComponent;
  end;

  iModelConnections = interface
    ['{DC100164-1AFD-4169-A4FD-BD6DC2CCE35A}']
    function Firedac : iModelConnectionQuery;
  end;

implementation

end.
