CREATE TABLE USUARIO_CONTATO (
    id_usuario_contato_pk INT AUTO_INCREMENT PRIMARY KEY, -- Chave Primária
    id_usuario_fk INT NOT NULL, -- Chave Estrangeira (N:1 - Um usuário pode ter vários endereços/contatos)

    -- Identificação do tipo de contato
    tipo_contato ENUM('Residencial','Comercial','Entrega','Outro') DEFAULT 'Residencial',

    -- Dados de localização
    cep_usuario CHAR(9) NULL, -- Ex: 00000-000
    logradouro_usuario VARCHAR(150) NULL,
    numero_usuario VARCHAR(10) NULL,
    complemento_usuario VARCHAR(100) NULL,
    bairro_usuario VARCHAR(150) NULL,
    cidade_usuario VARCHAR(150) NULL,
    estado_usuario CHAR(2) NULL, -- UF

    -- Contatos Adicionais (opcional, já que o principal está na USUARIO)
    telefone_fixo_usuario VARCHAR(15) NULL,
    email_secundario_usuario VARCHAR(120) NULL,

    data_cadastro_contato TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao_contato TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Regra de integridade: Se o usuário for deletado, os contatos também serão.
    CONSTRAINT fk_usuario_contato
    FOREIGN KEY (id_usuario_fk)
    REFERENCES USUARIO(id_usuario_pk)
    ON DELETE CASCADE
);
