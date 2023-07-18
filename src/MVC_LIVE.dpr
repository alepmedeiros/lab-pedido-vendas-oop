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
  mvclive.model.connection.impl.configuration in 'model\connection\impl\mvclive.model.connection.impl.configuration.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
