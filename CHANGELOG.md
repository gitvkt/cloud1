# 📌 Changelog

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
- Primeira versão funcional do cadastro de usuários.

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

## [v1.3.0] - Melhorias e automações
- Reposicionamento do **CEP** acima dos campos de endereço no formulário.
- Implementação da **formatação automática do CEP** (`00000-000`).
- Integração com **ViaCEP** para preenchimento automático de endereço.
- Ajuste no **email padrão** → `"sememail@vktcloud.com.br"` quando não houver email disponível.
- Inclusão de **botões de consulta**:
  - **Inscrição Estadual (SINTEGRA RJ)** → link gerado automaticamente com o CNPJ digitado.
  - **Código SUFRAMA** → link direto para o portal oficial.
- Remoção do campo **Inscrição Municipal** do formulário e do PHP.
- Ajuste no **INSERT SQL** e `bind_param` para refletir apenas os campos ativos.
- Melhoria nas mensagens de alerta quando dados não são encontrados.
- Estrutura final consolidada em **três partes (PHP, HTML, JS)**, pronta para rodar sem warnings.

---
