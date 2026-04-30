# 📌 Estrutura do Banco de Dados

<img width="2488" height="1510" alt="diagrama do bd" src="https://github.com/user-attachments/assets/64a73a19-f333-4a7e-a905-fbb092dc4321" />


## USUARIO
| Campo                   | Tipo                | Restrições |
|--------------------------|---------------------|------------|
| id_usuario_pk            | int                 | PK, NN      |
| uuid_usuario             | char(30)            | NN          |
| apelido_usuario          | varchar(50)         |             |
| email_usuario            | varchar(120)        |             |
| senha_usuario_hash       | varchar(120)        |             |
| status_usuario           | enum                |             |
| nivel_acesso_usuario     | enum                |             |
| celular_auth             | varchar(18)         | NN          |
| whatsapp_auth            | varchar(18)         | NN          |
| data_nascimento_usuario  | date                | NN          |
| data_cadastro_usuario    | timestamp           |             |
| data_atualizacao_usuario | timestamp           |             |
| data_exclusao_usuario    | timestamp           |             |

---

## CLIENTE
| Campo                   | Tipo                | Restrições |
|--------------------------|---------------------|------------|
| id_cliente_pk            | int                 | PK, NN      |
| uuid_cliente             | char(30)            | NN          |
| apelido_cliente          | varchar(50)         |             |
| email_cliente            | varchar(120)        |             |
| senha_cliente_hash       | varchar(120)        |             |
| status_cliente           | enum                |             |
| nivel_acesso_cliente     | enum                |             |
| celular_auth             | varchar(18)         | NN          |
| whatsapp_auth            | varchar(18)         | NN          |
| data_nascimento_cliente  | date                | NN          |
| data_cadastro_cliente    | timestamp           |             |
| data_atualizacao_cliente | timestamp           |             |
| data_exclusao_cliente    | timestamp           |             |

---

## ORGANIZACAO
| Campo                      | Tipo                | Restrições |
|-----------------------------|---------------------|------------|
| id_organizacao_pk           | int                 | PK, NN      |
| uuid_organizacao            | char(30)            | NN          |
| cnpj_organizacao            | varchar(20)         | NN          |
| nome_fantasia_organizacao   | varchar(120)        |             |
| razao_social_organizacao    | varchar(120)        |             |
| natureza_juridica           | varchar(50)         |             |
| porte                       | varchar(50)         |             |
| situacao_cadastral          | varchar(50)         |             |
| data_abertura               | date                |             |
| atividade_principal         | varchar(120)        |             |
| atividades_secundarias      | varchar(120)        |             |
| logradouro                  | varchar(150)        |             |
| numero                      | varchar(10)         |             |
| complemento                 | varchar(50)         |             |
| bairro                      | varchar(50)         |             |
| cidade                      | varchar(50)         |             |
| estado                      | char(2)             |             |
| cep                         | varchar(9)          |             |
| telefone                    | varchar(15)         |             |
| email                       | varchar(120)        |             |
| inscricao_estadual          | varchar(50)         |             |
| codigo_suframa              | varchar(50)         |             |
| status_organizacao          | enum                |             |
| nivel_plano_organizacao     | enum                |             |
| data_cadastro_organizacao   | timestamp           |             |
| data_atualizacao_organizacao| timestamp           |             |

---

## CLIENTE_ORGANIZACAO
| Campo                     | Tipo     | Restrições |
|----------------------------|----------|------------|
| id_cliente_organizacao_pk  | int      | PK, NN      |
| uuid_cliente_organizacao   | char(30) | NN          |
| id_cliente_fk              | int      | FK          |
| id_organizacao_fk          | int      | FK          |
