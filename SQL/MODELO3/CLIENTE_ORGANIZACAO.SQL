CREATE TABLE CLIENTE_ORGANIZACAO(
    id_cliente_organizacao INT AUTO_INCREMENT PRIMARY KEY,
    uuid_cliente_organizacao CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE,

    id_cliente_fk INT NOT NULL ,
    id_organizacao_fk INT NOT NULL,

CONSTRAINT fk_cliente_organizacao_id_cliente
FOREIGN (id_cliente_fk)
REFERENCES CLIENTE(id_cliente)
ON DELETE RESTRICT  

CONSTRAINT fk_cliente_organizacao_id_organizacao
FOREIGN (id_organizacao_fk)
REFERENCES ORGANIZACAO(id_organizacao)
ON DELETE RESTRICT  

);