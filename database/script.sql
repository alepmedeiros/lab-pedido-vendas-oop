-- cliente definition

CREATE TABLE cliente (
	codigo INTEGER PRIMARY KEY AUTOINCREMENT,
	nome varchar(100),
	cidade varchar(60),
	estado varchar(60)
);

-- produtos definition

CREATE TABLE produtos (
	codigo INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao varchar(100),
	precovenda decimal(17,2)
);

-- pedidos definition

CREATE TABLE pedidos (
	numeropedido INTEGER PRIMARY KEY AUTOINCREMENT,
	dataemissao timestamp,
	id_cliente INTEGER,
	valortotal decimal(17,2),
	CONSTRAINT pedidos_FK FOREIGN KEY (id_cliente) REFERENCES cliente(codigo)
);

-- pedidoitens definition

CREATE TABLE pedidoitens (
	codigo INTEGER PRIMARY KEY AUTOINCREMENT,
	id_pedido INTEGER,
	id_produto INTEGER,
	quantidade INTEGER,
	valorunitario decimal(17,2),
	valortotal decimal(17,2),
	CONSTRAINT pedidoitens_FK FOREIGN KEY (id_pedido) REFERENCES pedidos(numeropedido),
	CONSTRAINT pedidoitens_FK_1 FOREIGN KEY (codigo) REFERENCES produtos(codigo)
);