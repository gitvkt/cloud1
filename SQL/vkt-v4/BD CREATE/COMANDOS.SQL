CREATE TABLE USUARIO (
    id_usuario_pk INT AUTO_INCREMENT PRIMARY KEY, -- Identificador da chave Primária
    uuid_usuario CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE, -- UUID automático interno
    
    -- Dados de login do usuário
	apelido_usuario VARCHAR(100) NOT NULL UNIQUE,
	email_usuario VARCHAR(120) NOT NULL UNIQUE,
	senha_usuario_hash VARCHAR(255) NOT NULL,

-- Identificador de status e nível de acesso do usuário
    status_usuario ENUM ('Ativo', 'Inativo', 'Bloqueado', 'Pendente', 'Banido') DEFAULT 'Ativo',
    nivel_acesso_usuario ENUM ('Admin', 'Gerente', 'Suporte1', 'Suporte2', 'Suporte3', 'Operador') DEFAULT 'Operador',

 -- Dados de contato direto e autenticação de 2 fatores (futuro)
	celular_auth VARCHAR(18) NOT NULL,
	whatsapp_auth VARCHAR(18) NULL,

	
	
   
    -- Registra aniversario do cliente e eventos para Log
    data_nascimento_usuario DATE NOT NULL,
    data_cadastro_usuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao_usuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    data_exclusao_usuario TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE USUARIO_BIO (
    id_usuario_bio_pk INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_fk INT NOT NULL UNIQUE, -- FK para USUARIO

    -- Dados de perfil bio
    foto_perfil_usuario VARCHAR(255) DEFAULT 'avatar_usuario.png',
    genero_usuario ENUM('Masculino','Feminino','Não Informado') DEFAULT 'Não Informado',
    altura_usuario DECIMAL(3,2) NULL,
    peso_usuario DECIMAL(6,3) NULL,
    observacoes_usuario TEXT NULL,

    data_atualizacao_bio TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_id_usuario_bio
    FOREIGN KEY (id_usuario_fk)
    REFERENCES USUARIO(id_usuario_pk)
    ON DELETE CASCADE
);

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

CREATE TABLE CLIENTE (
    id_cliente_pk INT AUTO_INCREMENT PRIMARY KEY, -- Identificador da chave Primária
    uuid_cliente CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE, -- UUID automático interno
    
    -- Dados de login do usuário
	apelido_cliente VARCHAR(100) NOT NULL UNIQUE,
	email_cliente VARCHAR(120) NOT NULL UNIQUE,
	senha_cliente_hash VARCHAR(255) NOT NULL,

-- Identificador de status e nível de acesso do usuário
   status_cliente ENUM ('Ativo','Inativo','Bloqueado','Pendente','Banido') DEFAULT 'Ativo',
    nivel_acesso_cliente ENUM ('Administrador','Nivel1','Nivel2','Nivel3') DEFAULT 'Nivel1',



 -- Dados de contato direto e autenticação de 2 fatores (futuro)
	celular_auth VARCHAR(18) NOT NULL,
	whatsapp_auth VARCHAR(18) NULL,

	
	
   
    -- Registra aniversario do cliente e eventos para Log
    data_nascimento_cliente DATE NOT NULL,
    data_cadastro_cliente TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao_cliente TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    data_exclusao_cliente TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE CLIENTE_BIO (
	-- Identificação da TABELA 
    id_cliente_bio_pk INT AUTO_INCREMENT PRIMARY KEY,
	-- Um usuário, uma Bio
    id_cliente_fk INT NOT NULL UNIQUE, 
    
    -- Dados de perfil bio
    foto_perfil_cliente VARCHAR(255) DEFAULT 'avatar_cliente.png',
    genero_cliente ENUM('Masculino','Feminino','Não Informado') DEFAULT 'Não Informado',
	altura_cliente DECIMAL(3,2) NULL,
    peso_cliente DECIMAL(6,3) NULL,
    observacoes_cliente TEXT NULL,  
       
    data_atualizacao_bio TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_id_cliente_bio
    FOREIGN KEY (id_cliente_fk)
    REFERENCES CLIENTE(id_cliente_pk)
    ON DELETE CASCADE
);

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


