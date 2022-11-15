SELECT COALESCE(count(*), 0) FROM pedido p WHERE p.status = 'A' ;
SELECT * FROM pedido p ;
SELECT * FROM pedido_item pi WHERE pi.codigo = 2 ;
SELECT * FROM pedido p ;

DELETE FROM pedido_item WHERE status_pedido  = 'A' ;
DELETE FROM pedido WHERE status = 'A' ;

SELECT * FROM pedido p ;
SELECT * FROM pedido_item pi ;

SELECT * FROM pedido p WHERE p.status = 'A' ;
SELECT * FROM pedido_item pi WHERE pi.status_pedido = 'A' ;

SELECT * FROM pedido p ;

SELECT * FROM produto p ;
-- exibir status de ativo na tela de listagem de produtos
-- ao excluir um produto, apenas trocar o estatus ativo para false
-- no select de recuperar todos, listar apenas os produtos ativos = true
-- adicionar lógica de verificar se é ativo na venda do item