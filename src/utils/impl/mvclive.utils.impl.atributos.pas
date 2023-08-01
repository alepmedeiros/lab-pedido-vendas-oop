unit mvclive.utils.impl.atributos;

interface

uses
  System.Rtti;

type
  Campo = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName;
  end;

  Tabela = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName;
  end;

implementation

{ Campo }

constructor Campo.Create(aName: String);
begin
  FName := aName;
end;

{ Tabela }

constructor Tabela.Create(aName: String);
begin
  FName := aName;
end;

end.
