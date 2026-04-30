# 📌 Estrutura do Banco de Dados

<img width="2488" height="1510" alt="diagrama do bd" src="https://github.com/user-attachments/assets/64a73a19-f333-4a7e-a905-fbb092dc4321" />

# 📌 Estrutura Organizacional do Banco de Dados

## 🧑 USUARIO
- **Finalidade**: Gerenciar dados de autenticação e perfil dos usuários internos do sistema.
- **Relacionamentos**:
  - 1:1 → `USUARIO_BIO`
  - 1:N → `USUARIO_CONTATO`

---

## 🧬 USUARIO_BIO
- **Finalidade**: Armazenar informações biográficas e físicas do usuário.
- **Relacionamento**:
  - FK → `USUARIO (id_usuario_pk)`  
  - Regra: `ON DELETE CASCADE`

---

## 📞 USUARIO_CONTATO
- **Finalidade**: Armazenar endereços e contatos adicionais do usuário.
- **Relacionamento**:
  - FK → `USUARIO (id_usuario_pk)`  
  - Regra: `ON DELETE CASCADE`

---

## 👤 CLIENTE
- **Finalidade**: Gerenciar dados de autenticação e perfil dos clientes externos.
- **Relacionamentos**:
  - 1:1 → `CLIENTE_BIO`
  - 1:N → `CLIENTE_CONTATO`
  - N:N → `ORGANIZACAO` (via `CLIENTE_ORGANIZACAO`)

---

## 🧬 CLIENTE_BIO
- **Finalidade**: Armazenar informações biográficas e físicas do cliente.
- **Relacionamento**:
  - FK → `CLIENTE (id_cliente_pk)`  
  - Regra: `ON DELETE CASCADE`

---

## 📞 CLIENTE_CONTATO
- **Finalidade**: Armazenar endereços e contatos adicionais do cliente.
- **Relacionamento**:
  - FK → `CLIENTE (id_cliente_pk)`  
  - Regra: `ON DELETE CASCADE`

---

## 🏢 ORGANIZACAO
- **Finalidade**: Cadastro de organizações vinculadas a clientes.
- **Campos principais**: CNPJ, razão social, nome fantasia, natureza jurídica, porte, endereço, contatos, inscrições (estadual, municipal, SUFRAMA).
- **Relacionamentos**:
  - N:N → `CLIENTE` (via `CLIENTE_ORGANIZACAO`)

---

## 🔗 CLIENTE_ORGANIZACAO
- **Finalidade**: Relacionar clientes às organizações.
- **Relacionamentos**:
  - FK → `CLIENTE (id_cliente_pk)`
  - FK → `ORGANIZACAO (id_organizacao_pk)`
- **Regras**:
  - `ON DELETE RESTRICT` → protege vínculos.
  - `UNIQUE (id_cliente_fk, id_organizacao_fk)` → evita duplicidade de associação.

---

---

# 📌 Estrutura do Banco de Dados

## 🧑 USUARIO
| Campo                   | Tipo        | Restrições/Default |
|--------------------------|-------------|---------------------|
| id_usuario_pk            | INT         | PK, AUTO_INCREMENT |
| uuid_usuario             | CHAR(36)    | DEFAULT UUID(), UNIQUE, NN |
| apelido_usuario          | VARCHAR(100)| UNIQUE, NN |
| email_usuario            | VARCHAR(120)| UNIQUE, NN |
| senha_usuario_hash       | VARCHAR(255)| NN |
| status_usuario           | ENUM(...)   | DEFAULT 'Ativo' |
| nivel_acesso_usuario     | ENUM(...)   | DEFAULT 'Operador' |
| celular_auth             | VARCHAR(18) | NN |
| whatsapp_auth            | VARCHAR(18) | NULL |
| data_nascimento_usuario  | DATE        | NN |
| data_cadastro_usuario    | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP |
| data_atualizacao_usuario | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP ON UPDATE |
| data_exclusao_usuario    | TIMESTAMP   | NULL |

---

## 🧬 USUARIO_BIO
| Campo                  | Tipo        | Restrições/Default |
|-------------------------|-------------|---------------------|
| id_usuario_bio_pk       | INT         | PK, AUTO_INCREMENT |
| id_usuario_fk           | INT         | UNIQUE, FK → USUARIO |
| foto_perfil_usuario     | VARCHAR(255)| DEFAULT 'avatar_usuario.png' |
| genero_usuario          | ENUM(...)   | DEFAULT 'Não Informado' |
| altura_usuario          | DECIMAL(3,2)| NULL |
| peso_usuario            | DECIMAL(6,3)| NULL |
| observacoes_usuario     | TEXT        | NULL |
| data_atualizacao_bio    | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP ON UPDATE |

---

## 📞 USUARIO_CONTATO
| Campo                   | Tipo        | Restrições/Default |
|--------------------------|-------------|---------------------|
| id_usuario_contato_pk    | INT         | PK, AUTO_INCREMENT |
| id_usuario_fk            | INT         | FK → USUARIO |
| tipo_contato             | ENUM(...)   | DEFAULT 'Residencial' |
| cep_usuario              | CHAR(9)     | NULL |
| logradouro_usuario       | VARCHAR(150)| NULL |
| numero_usuario           | VARCHAR(10) | NULL |
| complemento_usuario      | VARCHAR(100)| NULL |
| bairro_usuario           | VARCHAR(150)| NULL |
| cidade_usuario           | VARCHAR(150)| NULL |
| estado_usuario           | CHAR(2)     | NULL |
| telefone_fixo_usuario    | VARCHAR(15) | NULL |
| email_secundario_usuario | VARCHAR(120)| NULL |
| data_cadastro_contato    | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP |
| data_atualizacao_contato | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP ON UPDATE |

---

## 👤 CLIENTE
| Campo                   | Tipo        | Restrições/Default |
|--------------------------|-------------|---------------------|
| id_cliente_pk            | INT         | PK, AUTO_INCREMENT |
| uuid_cliente             | CHAR(36)    | DEFAULT UUID(), UNIQUE, NN |
| apelido_cliente          | VARCHAR(100)| UNIQUE, NN |
| email_cliente            | VARCHAR(120)| UNIQUE, NN |
| senha_cliente_hash       | VARCHAR(255)| NN |
| status_cliente           | ENUM(...)   | DEFAULT 'Ativo' |
| nivel_acesso_cliente     | ENUM(...)   | DEFAULT 'Nivel1' |
| celular_auth             | VARCHAR(18) | NN |
| whatsapp_auth            | VARCHAR(18) | NULL |
| data_nascimento_cliente  | DATE        | NN |
| data_cadastro_cliente    | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP |
| data_atualizacao_cliente | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP ON UPDATE |
| data_exclusao_cliente    | TIMESTAMP   | NULL |

---

## 🧬 CLIENTE_BIO
| Campo                  | Tipo        | Restrições/Default |
|-------------------------|-------------|---------------------|
| id_cliente_bio_pk       | INT         | PK, AUTO_INCREMENT |
| id_cliente_fk           | INT         | UNIQUE, FK → CLIENTE |
| foto_perfil_cliente     | VARCHAR(255)| DEFAULT 'avatar_cliente.png' |
| genero_cliente          | ENUM(...)   | DEFAULT 'Não Informado' |
| altura_cliente          | DECIMAL(3,2)| NULL |
| peso_cliente            | DECIMAL(6,3)| NULL |
| observacoes_cliente     | TEXT        | NULL |
| data_atualizacao_bio    | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP ON UPDATE |

---

## 📞 CLIENTE_CONTATO
| Campo                   | Tipo        | Restrições/Default |
|--------------------------|-------------|---------------------|
| id_cliente_contato_pk    | INT         | PK, AUTO_INCREMENT |
| id_cliente_fk            | INT         | FK → CLIENTE |
| tipo_contato             | ENUM(...)   | DEFAULT 'Residencial' |
| cep_cliente              | CHAR(9)     | NULL |
| logradouro_cliente       | VARCHAR(150)| NULL |
| numero_cliente           | VARCHAR(10) | NULL |
| complemento_cliente      | VARCHAR(100)| NULL |
| bairro_cliente           | VARCHAR(150)| NULL |
| cidade_cliente           | VARCHAR(150)| NULL |
| estado_cliente           | CHAR(2)     | NULL |
| telefone_fixo_cliente    | VARCHAR(15) | NULL |
| email_secundario_cliente | VARCHAR(120)| NULL |
| data_cadastro_contato    | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP |
| data_atualizacao_contato | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP ON UPDATE |

---

## 🏢 ORGANIZACAO
| Campo                      | Tipo        | Restrições/Default |
|-----------------------------|-------------|---------------------|
| id_organizacao_pk           | INT         | PK, AUTO_INCREMENT |
| uuid_organizacao            | CHAR(36)    | DEFAULT UUID(), UNIQUE, NN |
| cnpj_organizacao            | VARCHAR(20) | UNIQUE, NN |
| nome_fantasia_organizacao   | VARCHAR(100)| NN |
| razao_social_organizacao    | VARCHAR(100)| NN |
| natureza_juridica           | VARCHAR(100)| NULL |
| porte                       | VARCHAR(50) | NULL |
| situacao_cadastral          | VARCHAR(50) | NULL |
| data_abertura               | DATE        | NULL |
| atividade_principal         | VARCHAR(200)| NULL |
| atividades_secundarias      | TEXT        | NULL |
| logradouro                  | VARCHAR(100)| NULL |
| numero                      | VARCHAR(20) | NULL |
| complemento                 | VARCHAR(50) | NULL |
| bairro                      | VARCHAR(50) | NULL |
| cidade                      | VARCHAR(50) | NULL |
| estado                      | VARCHAR(2)  | NULL |
| cep                         | VARCHAR(10) | NULL |
| telefone                    | VARCHAR(20) | NULL |
| email                       | VARCHAR(100)| NULL |
| inscricao_estadual          | VARCHAR(30) | NULL |
| inscricao_municipal         | VARCHAR(30) | NULL |
| codigo_suframa              | VARCHAR(30) | NULL |
| status_organizacao          | ENUM(...)   | DEFAULT 'Ativa' |
| nivel_plano_organizacao     | ENUM(...)   | DEFAULT 'Nivel1' |
| data_cadastro_organizacao   | TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP |
| data_atualizacao_organizacao| TIMESTAMP   | DEFAULT CURRENT_TIMESTAMP ON UPDATE |

---

## 🔗 CLIENTE_ORGANIZACAO
| Campo                   | Tipo     | Restrições/Default |
|--------------------------|----------|---------------------|
| id_cliente_organizacao   | INT      | PK, AUTO_INCREMENT |
| uuid_cliente_organizacao | CHAR(36) | DEFAULT UUID(), UNIQUE, NN |
| id_cliente_fk            | INT      | FK → CLIENTE |
| id_organizacao_fk        | INT      | FK → ORGANIZACAO |
| UNIQUE                   | (id_cliente_fk, id_organizacao_fk) |


# 📌 Diagrama Organizacional do Banco de Dados

                ┌───────────────┐
                │    USUARIO    │
                └───────┬───────┘
                        │ 1:1
                        ▼
                ┌───────────────┐
                │  USUARIO_BIO  │
                └───────────────┘
                        │ 1:N
                        ▼
                ┌───────────────┐
                │USUARIO_CONTATO│
                └───────────────┘


                ┌───────────────┐
                │    CLIENTE    │
                └───────┬───────┘
                        │ 1:1
                        ▼
                ┌───────────────┐
                │  CLIENTE_BIO  │
                └───────────────┘
                        │ 1:N
                        ▼
                ┌───────────────┐
                │CLIENTE_CONTATO│
                └───────┬───────┘
                        │ N:N
                        ▼
                ┌───────────────┐
                │CLIENTE_ORGANIZ│
                └───────┬───────┘
                        │ N:1
                        ▼
                ┌───────────────┐
                │ ORGANIZACAO   │
                └───────────────┘
