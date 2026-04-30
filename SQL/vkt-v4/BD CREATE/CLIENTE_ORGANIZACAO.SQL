CREATE TABLE CLIENTE_ORGANIZACAO (
    id_cliente_organizacao INT AUTO_INCREMENT PRIMARY KEY,
    uuid_cliente_organizacao CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE,

    id_cliente_fk INT NOT NULL,
    id_organizacao_fk INT NOT NULL,

    CONSTRAINT fk_cliente_organizacao_cliente
    FOREIGN KEY (id_cliente_fk)
    REFERENCES CLIENTE(id_cliente_pk)
    ON DELETE RESTRICT,

    CONSTRAINT fk_cliente_organizacao_organizacao
    FOREIGN KEY (id_organizacao_fk)
    REFERENCES ORGANIZACAO(id_organizacao_pk)
    ON DELETE RESTRICT,

    CONSTRAINT uq_cliente_organizacao UNIQUE (id_cliente_fk, id_organizacao_fk)
);
