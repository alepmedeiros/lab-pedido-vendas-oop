-- Table: cliente
-- DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    nome VARCHAR (60) NOT NULL,
    cidade VARCHAR (60) NOT NULL,
    uf VARCHAR (10) NOT NULL
);

-- Table: operador
-- DROP TABLE IF EXISTS operador;

CREATE TABLE operador (
    codigo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ON CONFLICT ROLLBACK,
    nome VARCHAR (60) NOT NULL
);

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

ALTER TABLE pedido_item ADD COLUMN status_pedido char DEFAULT 'A' ;

-- Table: produto
-- DROP TABLE IF EXISTS produto;

CREATE TABLE produto (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    preco_venda DECIMAL (18, 2) NOT NULL
);

ALTER TABLE produto ADD COLUMN ativo boolean DEFAULT TRUE;

-- Table: estoque produto
-- DROP TABLE IF EXISTS estoque_produto 

CREATE TABLE estoque_produto (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    codigo_produto INTEGER REFERENCES produto (codigo) ON DELETE SET NULL NOT NULL,
    quantidade INTEGER NOT NULL,
    modificado DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: entrada produto
-- DROP TABLE IF EXISTS entrada_produto

CREATE TABLE entrada_produto (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    codigo_produto INTEGER REFERENCES produto (codigo) ON DELETE SET NULL NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_unitario DECIMAL (18, 2) NOT NULL,
    data_entrada DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: saida produto
-- DROP TABLE IF EXISTS saida_produto

CREATE TABLE saida_produto (
    codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT NOT NULL,
    codigo_produto INTEGER REFERENCES produto (codigo) ON DELETE SET NULL NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_unitario DECIMAL (18, 2) NOT NULL,
    data_entrada DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);