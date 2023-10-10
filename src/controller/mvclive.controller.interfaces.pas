unit mvclive.controller.interfaces;

interface

uses
  mvclive.model.entity.interfaces,
  mvclive.model.dao.interfaces;

type
  iController = interface
    function entity: iEntity;
    function dao(Value: IInterface): iDao;
  end;

implementation

end.
