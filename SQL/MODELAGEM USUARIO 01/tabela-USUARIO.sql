CREATE TABLE USUARIO (
    id_usuario_pk INT AUTO_INCREMENT PRIMARY KEY, -- Identificador da chave Primária
    
    -- Dados de login do usuário
	apelido_usuario VARCHAR(25) NOT NULL UNIQUE,
	email_usuario VARCHAR(120) NOT NULL UNIQUE,
	senha_usuario_hash VARCHAR(255) NOT NULL,

-- Identificador de status e nível de acesso do usuário
    status_usuario ENUM ("Ativo", "Inativo", "Bloqueado", "Pendente", "Banido") DEFAULT "Ativo",
    nivel_acesso_usuario ENUM ("Admin", "Gerente", "Suporte1", "Suporte2", "Operador") DEFAULT "Operador", 

 -- Dados de contato direto e autenticação de 2 fatores (futuro)
	celular_auth VARCHAR(18) NOT NULL,
	whatsapp_auth VARCHAR(18) NULL,

	
	uuid_usuario CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE, -- UUID automático interno
   
    -- Registra aniversario do cliente e eventos para Log
    data_nascimento_usuario DATE NOT NULL,
    data_cadastro_usuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao_usuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    data_exclusao_usuario TIMESTAMP NULL DEFAULT NULL
);
