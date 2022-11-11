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