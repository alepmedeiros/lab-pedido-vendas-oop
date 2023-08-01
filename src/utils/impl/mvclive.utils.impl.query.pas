unit mvclive.utils.impl.query;

interface

uses
  mvclive.utils.interfaces;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FParent: TObject;

    function Fields: String;
    function Params: String;
    function NomeTabela: String;

    constructor Create(Parent: IInterface);
    destructor Destroy; override;
  public
    class function New(Parent: IInterface): iQuery;
    function Insert: String;
    function Update: String;
    function Delete: String;
    function Select: String;
  end;

implementation

uses
  System.SysUtils,
  System.Rtti,
  mvclive.utils.impl.rtthelper,
  mvclive.utils.impl.atributos;


constructor TQuery.Create(Parent: IInterface);
begin
  FParent := TObject(Parent);
end;

function TQuery.Delete: String;
begin

end;

destructor TQuery.Destroy;
begin

  inherited;
end;

function TQuery.Fields: String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  lContexto:= TRttiContext.Create;
  try
    lTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;
      Result := Result + I.GetAttibute<Campo>.Name + ', ';
    end;
  finally
    Result := Copy(Result, 0, Result.Length-2);
    lContexto.Free;
  end;
end;

function TQuery.Insert: String;
begin
  Result :=  'INSERT INTO ' + NomeTabela;
  Result := Result + ' (' + Fields + ') ';
  Result := Result + ' Values (' + Params + ');';
end;

class function TQuery.New(Parent: IInterface): iQuery;
begin
  Result := Self.Create(Parent);
end;

function TQuery.Params: String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  Result := EmptyStr;

  lContexto:= TRttiContext.Create;
  try
    lTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;
      Result := Result + ':' + I.GetAttibute<Campo>.Name + ', ';
    end;
  finally
    Result := Copy(Result, 0, Result.Length-2) + ' ';
    lContexto.Free
  end;
end;

function TQuery.Select: String;
begin

end;

function TQuery.NomeTabela: String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  lContexto:= TRttiContext.Create;
  try
    lTipo := lContexto.GetType(FParent.ClassInfo);
    if lTipo.Tem<Tabela> then
       Result := lTipo.GetAttibute<Tabela>.Name;
  finally
    lContexto.Free
  end;
end;

function TQuery.Update: String;
begin

end;

end.
