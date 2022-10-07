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

-- Table: produto
DROP TABLE IF EXISTS produto;

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
