CREATE TABLE ORGANIZACAO (
    id_organizacao_pk INT AUTO_INCREMENT PRIMARY KEY, -- chave primaria
    uuid_organizacao CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE, -- UUID automático
    
    -- Chave Estrangeira
    id_usuario_fk INT NOT NULL,

    cnpj_organizacao VARCHAR(20) NOT NULL UNIQUE,
    nome_fantasia_organizacao VARCHAR(100) NOT NULL,
    razao_social_organizacao VARCHAR(100) NOT NULL,
    
    status_organizacao ENUM("Ativa", "Inativa", "Suspensa", "Bloqueada") DEFAULT "Ativa",
    
    data_cadastro_organizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao_organizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Regra nomeada com chave estrangeira apontada para tabela USUARIO e seu respectivo id
    CONSTRAINT fk_organizacao_usuario
    FOREIGN KEY (id_usuario_fk)
    REFERENCES USUARIO(id_usuario_pk)
    ON DELETE RESTRICT
);
