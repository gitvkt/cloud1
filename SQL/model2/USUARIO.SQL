CREATE TABLE USUARIO (
    id_user_pk INT AUTO_INCREMENT PRIMARY KEY, -- Identificador da chave Primária
    uuid_user CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE, -- UUID automático interno
    
    -- Dados de login do usuário
	nick_user VARCHAR(25) NOT NULL UNIQUE,
	mail_user VARCHAR(120) NOT NULL UNIQUE,
	pass_user_hash VARCHAR(255) NOT NULL,

-- Identificador de status e nível de acesso do usuário
    status_user ENUM ("Ativo", "Inativo", "Bloqueado", "Pendente", "Banido") DEFAULT "Ativo",
    perm_user ENUM ("Admin", "Gerente", "Suporte1", "Suporte2", "Operador") DEFAULT "Operador", 

 -- Dados de contato direto e autenticação de 2 fatores (futuro)
	celular_auth VARCHAR(18) NOT NULL,
	whatsapp_auth VARCHAR(18) NULL,

	
	
   
    -- Registra aniversario do cliente e eventos para Log
    dnasce_user DATE NOT NULL,
    dregister_user TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dupdate_user TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dexclude_user TIMESTAMP NULL DEFAULT NULL
);
