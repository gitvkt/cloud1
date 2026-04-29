CREATE TABLE USUARIO_BIO (
	-- Identificação da TABELA 
    id_usuario_bio_pk INT AUTO_INCREMENT PRIMARY KEY,
	-- Um usuário, uma Bio
    id_usuario_fk INT NOT NULL UNIQUE, 
    
    -- Dados de perfil bio
    foto_perfil_usuario VARCHAR(255) DEFAULT 'avatar_usuario.png',
    genero_usuario ENUM("Masculino", "Feminino", "Não Informado") DEFAULT "Não Informado",
	altura_usuario DECIMAL(3,2) NULL,
    peso_usuario DECIMAL(6,3) NULL,
    observacoes_usuario TEXT NULL,  
       
    data_atualizacao_bio TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_id_usuario_bio
    FOREIGN KEY (id_usuario_fk)
    REFERENCES USUARIO(id_usuario_pk)
    ON DELETE CASCADE
);