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