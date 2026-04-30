# 📌 Changelog Técnico

## 🗄️ Banco de Dados
- Estrutura criada em **MySQL** com tabelas para usuários, clientes e organizações.
- Evolução incremental: primeiro `USUARIO`, depois `CLIENTE`, e por fim `ORGANIZACAO` e tabelas auxiliares (`*_BIO`, `*_CONTATO`, `CLIENTE_ORGANIZACAO`).
- Relacionamentos definidos com **chaves primárias e estrangeiras** para garantir integridade entre entidades.

---

## [v1.0.0] - Estrutura inicial
- Criação da tabela **USUARIO** com dados básicos de autenticação e perfil.
- Inclusão de tabelas auxiliares:
  - `USUARIO_BIO` para informações adicionais (altura, peso, gênero, observações).
  - `USUARIO_CONTATO` para endereços e contatos secundários.

---

## [v1.1.0] - Expansão para clientes
- Criação da tabela **CLIENTE** com estrutura semelhante à de usuários.
- Inclusão de tabelas auxiliares:
  - `CLIENTE_BIO` para dados adicionais de perfil.
  - `CLIENTE_CONTATO` para endereços e contatos secundários.
- Implementação da tabela **CLIENTE_ORGANIZACAO** para vincular clientes às organizações.

---

## [v1.2.0] - Organização e integração
- Criação da tabela **ORGANIZACAO** com campos completos:
  - Dados cadastrais (CNPJ, razão social, nome fantasia, natureza jurídica, porte).
  - Endereço e contatos.
  - Inscrições (estadual, municipal, SUFRAMA).
  - Status e nível de plano.
- Integração inicial com páginas PHP para cadastro de organizações.

---

## [v1.3.0] - Refinamento da base de dados
- **UUID automático**: `CHAR(36) DEFAULT (UUID()) NOT NULL UNIQUE` em todas as tabelas principais.
- **Campos de login**: apelido e email agora `NOT NULL UNIQUE`.
- **Senha**: ampliada para `VARCHAR(255)` para suportar algoritmos modernos de hash.
- **Enums**: ampliados com novos valores (`Bloqueado`, `Pendente`, `Banido`, `Suporte1..3`, `Operador`, `Administrador`).
- **BIO**:
  - Foto de perfil com default (`avatar_usuario.png` / `avatar_cliente.png`).
  - Gênero com opção `'Não Informado'`.
  - Observações agora `TEXT`.
  - `ON DELETE CASCADE` para integridade referencial.
- **CONTATO**:
  - Complemento ampliado para `VARCHAR(100)`.
  - Campos de endereço expandidos para até 150 caracteres.
  - `ON DELETE CASCADE` para exclusão automática junto ao usuário/cliente.
- **ORGANIZACAO**:
  - CNPJ `NOT NULL UNIQUE`.
  - Atividades secundárias agora `TEXT`.
  - Inscrição municipal mantida como opcional.
  - Defaults em status (`Ativa`) e plano (`Nivel1`).
- **CLIENTE_ORGANIZACAO**:
  - `ON DELETE RESTRICT` para proteger vínculos.
  - `UNIQUE (id_cliente_fk, id_organizacao_fk)` para evitar duplicidade de associação.

---
