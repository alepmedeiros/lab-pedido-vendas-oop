DROP TABLE IF EXISTS operador;

CREATE TABLE IF NOT EXISTS operador (
  codigo INTEGER PRIMARY KEY ON CONFLICT ROLLBACK AUTOINCREMENT,
  nome VARCHAR NOT NULL
);

SELECT * FROM operador;

INSERT INTO operador (nome) VALUES ('Operador Padrão');

DELETE FROM operador WHERE codigo = :codigoOperador ;