-- Table: cliente
-- DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    nome VARCHAR (60) NOT NULL,
    cidade VARCHAR (60) NOT NULL,
    uf VARCHAR (10) NOT NULL
);

INSERT INTO cliente ( nome, cidade, uf )
VALUES ( 'Bruno Borges da Silva', 'Caicó', 'RN' );

-- Table: operador
-- DROP TABLE IF EXISTS operador;

CREATE TABLE operador (
    codigo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ON CONFLICT ROLLBACK,
    nome VARCHAR (60) NOT NULL
);

INSERT INTO operador (nome)
VALUES ('Operador Padrão');

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

SELECT * FROM pedido_item pi ;

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
-- ==========================================

SELECT * FROM pedido_item pi ORDER BY pi.codigo ;
SELECT * FROM pedido p ;

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

