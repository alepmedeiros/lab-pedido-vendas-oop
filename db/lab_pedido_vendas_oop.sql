-- Table: cliente
-- DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    nome VARCHAR (60) NOT NULL,
    cidade VARCHAR (60) NOT NULL,
    uf VARCHAR (10) NOT NULL
);

INSERT INTO cliente ( nome, cidade, uf )
VALUES ( 'Bruno Borges da Silva', 'Caic√≥', 'RN' );

-- Table: operador
-- DROP TABLE IF EXISTS operador;

CREATE TABLE operador (
    codigo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ON CONFLICT ROLLBACK,
    nome VARCHAR (60) NOT NULL
);

INSERT INTO operador (nome)
VALUES ('Operador Padr√£o');

-- Table: pedido
-- DROP TABLE IF EXISTS pedido;

CREATE TABLE pedido (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT  NOT NULL,
    codigo_cliente  INTEGER CONSTRAINT fk_codigo_cliente REFERENCES cliente (codigo) ON DELETE SET NULL NOT NULL,
    codigo_operador INTEGER REFERENCES operador (codigo) ON DELETE SET NULL NOT NULL,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL (18, 2) NOT NULL
);

ALTER TABLE pedido ADD COLUMN status char DEFAULT 'A' ;
ALTER TABLE pedido DROP COLUMN codigo_operador ;

SELECT * FROM pedido p ;

-- Table: pedido_item
-- DROP TABLE IF EXISTS pedido_item;

CREATE TABLE pedido_item (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    codigo_pedido INTEGER REFERENCES pedido (codigo) ON DELETE SET NULL NOT NULL,
    codigo_produto INTEGER REFERENCES produto (codigo) ON DELETE SET NULL NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_unitario DECIMAL (18, 2) NOT NULL,
    valor_total DECIMAL (18, 2) NOT NULL
);

-- Add status column in pedido_item
ALTER TABLE pedido_item ADD COLUMN status_pedido char DEFAULT 'A' ;

-- Insert in pedido_item
INSERT INTO pedido_item (codigo_pedido, codigo_produto, quantidade, valor_unitario, valor_total)
VALUES (1,1,1,4.3,4.3);

-- Update status after cofirm pedido
/*
 * A: ANDAMENTO.
 * E: EFETUADO.
 * C: CANCELADO.
 *
 * */
UPDATE pedido_item SET status_pedido = 'E' WHERE status_pedido = 'A' ;

-- Table: produto
-- DROP TABLE IF EXISTS produto;

CREATE TABLE produto (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    preco_venda DECIMAL (18, 2) NOT NULL
);

-- Table: estoque produto
-- DROP TABLE IF EXISTS estoque_produto ;

CREATE TABLE estoque_produto (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    codigo_produto INTEGER REFERENCES produto (codigo) ON DELETE SET NULL NOT NULL,
    quantidade INTEGER NOT NULL,
    modificado DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO estoque_produto ( codigo_produto, quantidade ) VALUES ( 1, 300 ) ;

SELECT *, strftime('%d/%m/%Y', ep.modificado) AS data FROM estoque_produto ep ;

INSERT INTO produto ( descricao, preco_venda ) VALUES ( 'Computador Lenovo 3i', 4300 );
INSERT INTO produto ( descricao, preco_venda ) VALUES ( 'Mouse Gamer Fortrek', 40 );
INSERT INTO produto ( descricao, preco_venda ) VALUES ( 'Mesa Gamer 1Mx2m', 390 );
INSERT INTO produto ( descricao, preco_venda ) VALUES ( 'Xiaomi Redmi Note 9S 4Gb 128Gb', 1599.99 );
INSERT INTO produto ( descricao, preco_venda ) VALUES ( 'Teclado Redragon Draconic k530', 350 );
INSERT INTO produto ( descricao, preco_venda ) VALUES ( 'Alexa 3Gen', 189.9 );

SELECT * FROM operador o ;
SELECT * FROM cliente c ;
SELECT * FROM produto p ;
SELECT * FROM pedido p ;
SELECT * FROM pedido_item pi ;

INSERT INTO produto (descricao, preco_venda) VALUES (:descricao, :precovenda);

-- insert/remove de pedido
INSERT INTO pedido (codigo_cliente, data_emissao, valor_total) VALUES (1, '2022-10-22', 200);
DELETE FROM pedido WHERE codigo_cliente = :codigo AND status = 'A';

-- ==========================================

-- insert/remove item pedido
INSERT INTO pedido_item
(codigo, codigo_pedido, codigo_produto, quantidade, valor_unitario, valor_total, status_pedido)
VALUES(6, 1, 1, 1, 4.3, 4.3, 'A');
INSERT INTO pedido_item
(codigo, codigo_pedido, codigo_produto, quantidade, valor_unitario, valor_total, status_pedido)
VALUES(7, 1, 2, 4, 40, 4.3, 'A');
INSERT INTO pedido_item
(codigo, codigo_pedido, codigo_produto, quantidade, valor_unitario, valor_total, status_pedido)
VALUES(8, 1, 3, 1, 390, 4.3, 'A');
INSERT INTO pedido_item
(codigo, codigo_pedido, codigo_produto, quantidade, valor_unitario, valor_total, status_pedido)
VALUES(9, 1, 5, 5, 350, 4.3, 'A');

-- select da tabela de pedido
SELECT
  p.codigo    AS codigo_pedido,
  p.descricao AS produto,
  pi.quantidade,
  pi.valor_unitario,
  ( pi.quantidade * pi.valor_unitario ) AS total
FROM pedido_item pi
LEFT JOIN produto p ON (pi.codigo_produto = p.codigo) ;

SELECT * FROM pedido_item pi ORDER BY pi.codigo ;

-- Novo select para itens de produto que considera as entradas individuais dos produtos no carrinho

SELECT * FROM pedido_item pi ORDER BY pi.codigo ;

SELECT
  p.codigo               AS codigo_produto,
  p.descricao            AS descricao,
  sum(pi.quantidade)     AS quantidade,
  pi.valor_unitario      AS valor,
  sum(pi.valor_unitario) AS total
FROM
  pedido_item pi
LEFT JOIN
  produto p ON (pi.codigo_produto = p.codigo)
WHERE
  pi.codigo_pedido = 1
GROUP BY
  pi.codigo_produto ;

-- insert de pedido item para o projeto

INSERT INTO pedido_item
( codigo_pedido, codigo_produto, quantidade, valor_unitario, valor_total )
VALUES
( :codigo_pedido, :codigo_produto, :quantidade, :valor_unitario, :valor_total );

-- TESTES DE PEDIDO ITEM

SELECT
  SUM(total) AS total_pedido
FROM
  (
    SELECT
      p.codigo               AS codigo_produto,
      p.descricao            AS descricao,
      sum(pi.quantidade)     AS quantidade,
      pi.valor_unitario      AS valor,
      sum(pi.valor_unitario) AS total
    FROM
      pedido_item pi
    LEFT JOIN
      produto p ON (pi.codigo_produto = p.codigo)
    GROUP BY
      pi.codigo_produto
  ) ;

-- RECUPERANDO CODIGO DO PEDIDO
-- pedido default
INSERT INTO pedido ( codigo, codigo_cliente, data_emissao, valor_total, status ) VALUES ( 0, , '', 0, 'D' );
INSERT INTO pedido
(codigo, codigo_cliente, data_emissao, valor_total, status)
VALUES(0, 0, '1999-01-01', 0, 'D');

-- REMOVENDO PEDIDO E ITEM PEDIDO

DELETE FROM pedido WHERE codigo_cliente = :codigo AND status = 'A';

DELETE FROM pedido_item  WHERE codigo_pedido = :codigo_pedido AND status_pedido = 'A' ;

-- PEDIDO RECUPERADO
SELECT
  pi.codigo              AS cod,
  p.codigo               AS codigo_produto,
  p.descricao            AS descricao,
  sum(pi.quantidade)     AS quantidade,
  pi.valor_unitario      AS valor,
  sum(pi.valor_unitario) AS total
FROM
  pedido_item pi
LEFT JOIN
  produto p ON (pi.codigo_produto = p.codigo)
WHERE
  pi.codigo_pedido = :codigo_pedido AND p.codigo = :coodigo_cliente
GROUP BY
  pi.codigo_produto ;

SELECT * FROM pedido p ;
SELECT * FROM pedido_item pi ;

-- PEDIDO COALESCE

SELECT
  COALESCE (
    max(codigo) + 1,
    1) AS novo_codigo_pedido
FROM
  pedido p ;

-- ATUALIZA TOTAL PEDIDO

UPDATE pedido SET valor_total = :valor_total_pedido WHERE codigo = :codido_pedido ;

-- FINALIZANDO UM PEDIDO
-- trocando status do pedido para 'C' de CONCLUÕDO

UPDATE pedido_item SET status_pedido = 'C' WHERE codigo_pedido = :codigo_pedido ;
UPDATE pedido SET status = 'C' WHERE codigo = :codigo_pedido ;

SELECT * FROM pedido p WHERE p.status = 'A' ;
SELECT * FROM pedido_item pi WHERE pi.status_pedido = 'C';

-- TESTE REMOVER ITEM DO PEDIDO

SELECT * FROM pedido_item pi ;

DELETE FROM pedido_item WHERE codigo_pedido = :codigo_pedido AND codigo_produto = :codigo_produto ;

SELECT p.codigo, p.descricao, PRINTF("R$ %.2f", preco_venda) as preco_venda FROM produto p ORDER BY codigo ;

DELETE FROM pedido_item WHERE codigo_pedido = :codigo_pedido AND codigo = :codigo_entrada ;

SELECT
  pi.codigo AS '#',
  p.codigo AS codigo_produto ,
  p.descricao AS descricao,
  pi.quantidade AS quantidade,
  PRINTF("R$ %.2f",
    pi.valor_unitario
  ) AS valor ,
  PRINTF("R$ %.2f",
    (pi.valor_unitario * pi.quantidade)
  ) AS total
FROM
  pedido_item pi
LEFT JOIN produto p ON
  ( p.codigo = pi.codigo_produto )
WHERE
  codigo_pedido = 1 ;

-- TOTAL DO PEDIDO
SELECT
  COALESCE(
    SUM(pedido.total),
    0
  ) AS total_pedido
FROM
  (
    SELECT
      (pi.valor_unitario * pi.quantidade) AS total
    FROM
      pedido_item pi
    LEFT JOIN produto p ON
      ( p.codigo = pi.codigo_produto )
    WHERE
      codigo_pedido = 1
  ) AS pedido ;

-- RESET DATABASE

DELETE FROM cliente ;
DELETE FROM operador ;
DELETE FROM pedido ;
DELETE FROM pedido_item ;
DELETE FROM produto ;

UPDATE `sqlite_sequence` SET `seq` = 0 WHERE `name` = 'cliente';
UPDATE `sqlite_sequence` SET `seq` = 0 WHERE `name` = 'operador';
UPDATE `sqlite_sequence` SET `seq` = 0 WHERE `name` = 'pedido';
UPDATE `sqlite_sequence` SET `seq` = 0 WHERE `name` = 'pedido_item';
UPDATE `sqlite_sequence` SET `seq` = 0 WHERE `name` = 'produto';

SELECT * FROM operador o ;

INSERT INTO operador (nome) VALUES ('Operador Bruno');

SELECT * FROM pedido p ;
SELECT * FROM pedido_item pi ;

-- PEDIDOS FEITOS

SELECT
  p.codigo,
  c.nome,
  p.data_emissao,
  PRINTF("R$ %.2f",
    p.valor_total
  ) AS valor_total
FROM
  pedido p
LEFT JOIN cliente c ON
  ( c.codigo = p.codigo_cliente )
WHERE
  p.status = 'C';

-- PRODUTOS DO PEDIDO SELECIONADO

SELECT
  p.codigo,
  p.descricao,
  pi.quantidade,
  PRINTF("R$ %.2f", p.preco_venda) AS preco_venda,
  PRINTF("R$ %.2f", pi.valor_total) AS valor_total
FROM
  pedido_item pi
LEFT JOIN produto p ON ( p.codigo = pi.codigo_produto )
WHERE
  codigo_pedido = :codigo_pedido ;

-- EDITANDO ENTRADA DE ITEM DE UM PEDIDO
-- Valores de quantidade e valor unit·rio
UPDATE
  pedido_item
SET
  quantidade     = :quantidade,
  valor_unitario = :valor_unitario
WHERE
  codigo_pedido  = :codigo_pedido
  AND codigo     = :codigo_entrada ;

-- Valores de total
UPDATE
  pedido_item
SET
  valor_total    = quantidade * valor_unitario
WHERE
  codigo_pedido  = :codigo_pedido
  AND codigo     = :codigo_entrada ;

-- VERIFICANDO SE EXISTE PEDIDO EM ANDAMENTO

SELECT COALESCE(count(*), 0) FROM pedido p WHERE p.status = 'A' ;

