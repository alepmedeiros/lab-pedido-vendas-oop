unit mvclive.model.connection.interfaces;

interface

uses
  Data.DB;

type
  iConnection = interface
    function Connection: TCustomConnection;
  end;

  iQuery = interface
    procedure Query(const Statement: String; Params: Array of Variant); overload;
    function Query(const Statement: Variant; Params: Array of Variant): TDataSet; overload;
  end;

  iConfiguration = interface
    function GetProtocolo: String;
    function SetServidor(const Value: String): iConfiguration;
    function GetServidor: String;
    function SetPorta(const Value: Integer): iConfiguration;
    function GetPorta: Integer;
    function SetUsuario(const Value: String): iConfiguration;
    function GetUsuario: String;
    function SetSenha(const Value: String): iConfiguration;
    function GetSenha: String;
    function SetCaminho(const Value: String): iConfiguration;
    function GetCaminho: String;
    function SetDriverName(const Value: String): iConfiguration;
    function GetDriverName: String;
  end;

implementation

end.
