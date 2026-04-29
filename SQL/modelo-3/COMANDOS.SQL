INSERT INTO USUARIO (
    apelido_usuario, 
    email_usuario, 
    senha_usuario_hash, 
    status_usuario, 
    nivel_acesso_usuario, 
    celular_auth, 
    whatsapp_auth, 
    data_nascimento_usuario
) VALUES (
    'admin', 
    'admin@admin.com', 
    '$2y$10$81XZVRDdQe0FvxBqLrYazuQYD0k2jyTm0cjyGhM/sMj6hC9WfY5/i', 
    'Ativo', 
    'Admin', 
    '552299999999', 
    '552299999999', 
    '1986-10-10'
);

---------------------------------------------

INSERT INTO ORGANIZACAO (
    id_usuario_fk, 
    cnpj_organizacao, 
    nome_fantasia_organizacao, 
    razao_social_organizacao, 
    status_organizacao
) VALUES (
    1, 
    '00.000.000/0000-00', 
    'Empresa Fantasia', 
    'Empresa Razão', 
    'Ativa'
);

---------------------------------------------
INSERT INTO USUARIO_BIO (
    id_usuario_bio_fk, 
    foto_perfil_usuario, 
    genero_usuario, 
    altura_usuario, 
    peso_usuario, 
    observacoes_usuario
    ) 
VALUES 
(
    1, 
    '/img/avatarusuario/logo.png', 
    'Masculino', 
    1.63, 
    85.500, 
NULL
);