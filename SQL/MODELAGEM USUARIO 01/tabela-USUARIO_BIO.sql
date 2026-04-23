CREATE TABLE USUARIO_BIO (
    id_usuario_bio_pk INT AUTO_INCREMENT PRIMARY KEY, -- Identificação da TABELA 
    id_usuario_bio_fk INT NOT NULL UNIQUE, -- Um usuário, uma Bio
    
    -- Dados de perfil bio
    foto_perfil_usuario VARCHAR(255) DEFAULT '/img/avatarusuario/avatar_padrao.png', 
    genero_usuario ENUM("Masculino", "Feminino", "Não Informado") DEFAULT "Não Informado",
    altura_usuario DECIMAL(3,2) NULL,
    peso_usuario DECIMAL(6,3) NULL,
    
    -- Redes Sociais e Links
    instagram_usuario VARCHAR(100) NULL UNIQUE,
    facebook_usuario VARCHAR(100) NULL UNIQUE,
    linkedin_usuario VARCHAR(100) NULL UNIQUE,
    github_usuario VARCHAR(100) NULL UNIQUE,
    youtube_chanell_usuario VARCHAR(255) NULL UNIQUE,
    site_usuario VARCHAR(255) NULL UNIQUE, -- Para portfólio ou blog
    
    observacoes_usuario TEXT NULL,  
       
    data_atualizacao_bio TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_id_usuario_bio
    FOREIGN KEY (id_usuario_bio_fk)
    REFERENCES USUARIO(id_usuario_pk)
    ON DELETE CASCADE
);
