-- Codigo necessario para as tabelas da imagem em postgres
-- Campos em vermelho sao PK e em azul as FK
CREATE TABLE IF NOT EXISTS "Clientes" (
    "id" serial NOT NULL UNIQUE,
    "Nome" varchar(255) NOT NULL,
    "estado" bigint NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Telefones" (
    "id" serial NOT NULL UNIQUE,
    "telefone" varchar(255) NOT NULL,
    "ddd" bigint NOT NULL,
    "id_cliente" bigint NOT NULL,
    "id_tipo" bigint NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Tipos_telefones" (
    "id" serial NOT NULL UNIQUE,
    "descricao" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Estados" (
    "id" serial NOT NULL UNIQUE,
    "codigo" varchar(255) NOT NULL,
    "nome" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

ALTER TABLE
    "Clientes"
ADD
    CONSTRAINT "Clientes_fk2" FOREIGN KEY ("estado") REFERENCES "Estados"("id");

ALTER TABLE
    "Telefones"
ADD
    CONSTRAINT "Telefones_fk3" FOREIGN KEY ("id_cliente") REFERENCES "Clientes"("id");

ALTER TABLE
    "Telefones"
ADD
    CONSTRAINT "Telefones_fk4" FOREIGN KEY ("id_tipo") REFERENCES "Tipos_telefones"("id");

-- Fazendo a busca dos telefones  de clieentes do estado

SELECT 
    e.codigo, 
    c.nome, 
    CONCAT('(', t.ddd, ')', t.telefone) AS telefone_formatado,
    tt.descricao AS tipo_telefone
FROM 
    estados e 
    INNER JOIN clientes c ON c.estado = e.id 
    INNER JOIN telefones t ON c.id = t.id_cliente
    INNER JOIN Tipos_telefones tt ON tt.id = t.id_tipo
where e.codigo = 'SP'