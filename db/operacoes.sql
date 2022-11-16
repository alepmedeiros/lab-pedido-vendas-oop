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
/*
 * Exibir status de ativo na tela de listagem de produtos ou só listar os ativos?
   (criar uma listagem de produtos inativos para pode reativa-los)
 * Ao excluir um produto, apenas trocar o estatus ativo para false
 * No select de recuperar todos, listar apenas os produtos ativos = true
 * Adicionar lógica de verificar se é ativo na venda do item
*/
 
SELECT
  p.codigo,
  p.descricao,
  PRINTF("R$ %.2f", preco_venda) as preco_venda,
  CASE 
    WHEN p.ativo = TRUE THEN 'Ativo'
    ELSE 'Inativo'
  END AS status
FROM produto p
-- WHERE p.ativo = TRUE
ORDER BY descricao, status ;

-- excluir/inativar produto
UPDATE produto SET ativo = FALSE WHERE codigo = :codigo ;

-- excluir/reaativar produto
UPDATE produto SET ativo = TRUE WHERE codigo = :codigo ;