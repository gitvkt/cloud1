CREATE TABLE CLIENTE_CONTATO (
    id_cliente_contato_pk INT AUTO_INCREMENT PRIMARY KEY, -- Chave Primária
    id_cliente_fk INT NOT NULL, -- Chave Estrangeira (N:1 - Um cliente pode ter vários endereços/contatos)

    -- Identificação do tipo de contato
    tipo_contato ENUM('Residencial','Comercial','Entrega','Outro') DEFAULT 'Residencial',

    -- Dados de localização
    cep_cliente CHAR(9) NULL, -- Ex: 00000-000
    logradouro_cliente VARCHAR(150) NULL,
    numero_cliente VARCHAR(10) NULL,
    complemento_cliente VARCHAR(100) NULL,
    bairro_cliente VARCHAR(150) NULL,
    cidade_cliente VARCHAR(150) NULL,
    estado_cliente CHAR(2) NULL, -- UF

    -- Contatos Adicionais (opcional, já que o principal está na CLIENTE)
    telefone_fixo_cliente VARCHAR(15) NULL,
    email_secundario_cliente VARCHAR(120) NULL,

    data_cadastro_contato TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao_contato TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Regra de integridade: Se o cliente for deletado, os contatos também serão.
    CONSTRAINT fk_cliente_contato
    FOREIGN KEY (id_cliente_fk)
    REFERENCES CLIENTE(id_cliente_pk)
    ON DELETE CASCADE
);
