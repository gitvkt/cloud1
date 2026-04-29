CREATE TABLE ORGANIZACAO (
    id_organizacao_pk INT AUTO_INCREMENT PRIMARY KEY, -- chave primaria
    uuid_organizacao CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE, -- UUID automático
    
    

    cnpj_organizacao VARCHAR(20) NOT NULL UNIQUE,
    nome_fantasia_organizacao VARCHAR(100) NOT NULL,
    razao_social_organizacao VARCHAR(100) NOT NULL,
    
    status_organizacao ENUM("Ativa", "Inativa", "Suspensa", "Bloqueada") DEFAULT "Ativa",
     nivel_acesso_cliente ENUM ("Administrador", "Nivel1", "Nivel2", "Nivel3") DEFAULT "Nivel1", 
    
    data_cadastro_organizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao_organizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  
);