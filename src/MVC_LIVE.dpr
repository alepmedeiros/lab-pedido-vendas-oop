program MVC_LIVE;

uses
  Vcl.Forms,
  mvclive.view.principal in 'view\mvclive.view.principal.pas' {Form1},
  mvclive.model.entity.interfaces in 'model\entity\mvclive.model.entity.interfaces.pas',
  mvclive.model.entity.impl.cliente in 'model\entity\impl\mvclive.model.entity.impl.cliente.pas',
  mvclive.model.entity.impl.produtos in 'model\entity\impl\mvclive.model.entity.impl.produtos.pas',
  mvclive.model.entity.impl.pedidos in 'model\entity\impl\mvclive.model.entity.impl.pedidos.pas',
  mvclive.model.entity.impl.pedidoitens in 'model\entity\impl\mvclive.model.entity.impl.pedidoitens.pas',
  mvclive.model.entity.impl.entity in 'model\entity\impl\mvclive.model.entity.impl.entity.pas',
  mvclive.model.connection.interfaces in 'model\connection\mvclive.model.connection.interfaces.pas',
  mvclive.model.connection.impl.firedac in 'model\connection\impl\mvclive.model.connection.impl.firedac.pas',
  mvclive.model.connection.impl.query in 'model\connection\impl\mvclive.model.connection.impl.query.pas',
  mvclive.model.connection.impl.configuration in 'model\connection\impl\mvclive.model.connection.impl.configuration.pas',
  mvclive.model.dao.interfaces in 'model\dao\mvclive.model.dao.interfaces.pas',
  mvclive.model.dao.impl.daogenerico in 'model\dao\impl\mvclive.model.dao.impl.daogenerico.pas',
  mvclive.utils.interfaces in 'utils\mvclive.utils.interfaces.pas',
  mvclive.utils.impl.query in 'utils\impl\mvclive.utils.impl.query.pas',
  mvclive.utils.impl.rtthelper in 'utils\impl\mvclive.utils.impl.rtthelper.pas',
  mvclive.utils.impl.atributos in 'utils\impl\mvclive.utils.impl.atributos.pas',
  mvclive.utils.impl.utils in 'utils\impl\mvclive.utils.impl.utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
