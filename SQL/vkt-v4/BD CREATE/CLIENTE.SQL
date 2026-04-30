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