unit mvclive.utils.interfaces;

interface

type
  iQuery = interface
    function Insert: String;
    function Update: String;
    function Delete: String;
    function Select: String;
  end;

  iUtils = interface
    function Query: iQuery;
  end;

implementation

end.
