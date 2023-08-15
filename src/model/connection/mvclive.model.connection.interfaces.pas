unit mvclive.model.connection.interfaces;

interface

uses
  System.Generics.Collections,
  Data.DB;

type
  iConexao = interface
    function Connection: TCustomConnection;
  end;

  iQuery = interface
    procedure Query(const Statement: String; const Params: Array of Variant); overload;
    function OneAll(const Statement: Variant; const Params: Array of Variant): TDataSet; overload;
    procedure Query(const Statement: String; const Params: TDictionary<String, Variant>); overload;
    function OneAll(const Statement: String; const Params: TDictionary<String, Variant>): TDataSet; overload;
  end;

  iConfiguracao = interface
    function GetProtocolo: String;
    function SetServidor(Value: String): iConfiguracao;
    function GetServidor: String;
    function SetPorta(Value: Integer): iConfiguracao;
    function GetPorta: Integer;
    function SetUsuario(Value: String): iConfiguracao;
    function GetUsuario: String;
    function SetSenha(Value: String): iConfiguracao;
    function GetSenha: String;
    function SetCaminho(Value: String): iConfiguracao;
    function GetCaminho: String;
    function SetDriverName(Value: String): iConfiguracao;
    function GetDriverName: String;
  end;

implementation

end.
