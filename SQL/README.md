# cloud1
Primeiro Projeto da Faculdade

Resumo da Estrutura Consolidada:

-------------------------------------------------------------------------------------------
Tabela ORGANIZACAO - concentração de daos empresariais do operador
(Pai 1:1)

-------------------------------------------------------------------------------------------
Tabela Chave Estrangeira (FK)RelaçãoObjetivo Técnico

USUARIO - (Pai 1:) Centralizar status e autenticação.

USUARIO_BIO - (1:N) id_usuario_bio_fk - 1:1 - Perfil biométrico único e Social.

USUARIO_CONTATO - (1:N) id_cliente_usuario_fk - 1:N - Gerenciar múltiplos meios de comunicação.

USUARIO_ENDERECO - (1:N) id_cliente_endereco_fk - 1:N - Armazenar localizações do usuário e operadores.

-------------------------------------------------------------------------------------------
Tabela Chave Estrangeira (FK)RelaçãoObjetivo Técnico

CLIENTE - (Pai 1:) Centralizar status e autenticação.

CLIENTE_BIO - (1:N) id_cliente_bio_fk - 1:1 - Perfil biométrico único (Peso/Altura).

CLIENTE_CONTATO - (1:N) id_cliente_contato_fk - 1:N - Gerenciar múltiplos meios de comunicação.

CLIENTE_ENDERECO - (1:N) id_cliente_endereco_fk - 1:N - Armazenar localizações para faturamento.

![](https://github.com/gitvkt/cloud1/blob/main/BD%20TABELAS%201.drawio.png?raw=true)

-------------------------------------------------------------------------------------------
