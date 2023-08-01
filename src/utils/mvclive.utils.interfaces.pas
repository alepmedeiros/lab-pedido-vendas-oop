unit mvclive.utils.interfaces;

interface

type
  iQuery = interface;

  iUtils = interface
    function Query: iQuery;
  end;

  iQuery = interface
    function Fields: String;
    function Params: String;
    function Update: String;
    function Insert: String;
    function Where: String;
  end;

implementation

end.
