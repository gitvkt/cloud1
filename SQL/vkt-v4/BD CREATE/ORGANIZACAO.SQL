CREATE TABLE ORGANIZACAO (
    id_organizacao_pk INT AUTO_INCREMENT PRIMARY KEY, -- chave primaria
    uuid_organizacao CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE, -- UUID automático
    
    cnpj_organizacao VARCHAR(20) NOT NULL UNIQUE,
    nome_fantasia_organizacao VARCHAR(100) NOT NULL,
    razao_social_organizacao VARCHAR(100) NOT NULL,

    natureza_juridica VARCHAR(100),
    porte VARCHAR(50),
    situacao_cadastral VARCHAR(50),
    data_abertura DATE,
    atividade_principal VARCHAR(200),
    atividades_secundarias TEXT,

    logradouro VARCHAR(100),
    numero VARCHAR(20),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10),
    telefone VARCHAR(20),
    email VARCHAR(100),

    inscricao_estadual VARCHAR(30) NULL,   -- opcional
    inscricao_municipal VARCHAR(30) NULL,  -- opcional
    codigo_suframa VARCHAR(30) NULL,       -- opcional

    status_organizacao ENUM('Ativa','Inativa','Suspensa','Bloqueada') DEFAULT 'Ativa',
    nivel_plano_organizacao ENUM('Master','Nivel1','Nivel2','Nivel3') DEFAULT 'Nivel1',

    data_cadastro_organizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao_organizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
