unit mvclive.utils.query;

interface

uses
  mvclive.utils.interfaces;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FParent: TObject;

    constructor Create(Parent: IInterface);
    function TableName: String;
  public
    class function New(Parent: IInterface): iQuery;
    function Fields: String;
    function Params: String;
    function Update: String;
    function Insert: String;
    function Where: String;
  end;

implementation

uses
  System.SysUtils,
  System.Rtti,
  System.TypInfo,
  mvclive.utils.rttihelper,
  mvclive.utils.attributes;

constructor TQuery.Create(Parent: IInterface);
begin
  FParent := TObject(Parent);
end;

function TQuery.Fields: String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  lContexto := TRttiContext.Create;
  try
    lTipo := lContexto.GetType(FParent.ClassInfo);

    for var I in lTipo.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      Result := Result + I.GetAttribute<Campo>.Name + ', ';
    end;
  finally
    Result := Copy(Result, 0, Result.Length-2);
    lContexto.Free;
  end;
end;

function TQuery.Insert: String;
begin
  Result := 'INSERT INTO ' + TableName;
  Result := Result + '('+ Fields + ') ';
  Result := Result + ' VALUES (' + Params + ');';
end;

class function TQuery.New(Parent: IInterface): iQuery;
begin
  Result := Self.Create(Parent);
end;

function TQuery.Params: String;
var
  ctxRtti   : TRttiContext;
  typRtti   : TRttiType;
begin
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(FParent.ClassInfo);
    for var I in typRtti.GetFields do
    begin
      if not I.Tem<Campo> then
        Break;

      if not I.GetValue(FParent).IsEmpty then
        Result  := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 2) + ' ';
    ctxRtti.Free;
  end;
end;

function TQuery.TableName: String;
var
  vCtxRtti: TRttiContext;
  vTypRtti: TRttiType;
  Info     : PTypeInfo;
begin
  vCtxRtti := TRttiContext.Create;
  try
    vTypRtti := vCtxRtti.GetType(FParent.ClassInfo);
    if vTypRtti.Tem<Tabela> then
      Result := vTypRtti.GetAttribute<Tabela>.Name;
  finally
    vCtxRtti.Free;
  end;
end;

function TQuery.Update: String;
begin

end;

function TQuery.Where: String;
begin

end;

end.
