# 📌 Roadmap de Evolução

## [v1.4.0] - Validações e usabilidade
- Adicionar **máscara de telefone** para padronizar entrada (ex: `(99) 99999-9999`).
- Implementar validação de **CNPJ** e **CEP** antes de enviar ao backend.
- Mensagens de feedback mais amigáveis em caso de erro de API.
- Botão de "Limpar formulário" para reiniciar cadastro rapidamente.

---

## [v1.5.0] - Integrações externas
- Integração com **APIs estaduais** para consulta de Inscrição Estadual além do SINTEGRA RJ.
- Consulta automática de **status cadastral na Receita Federal**.
- Possibilidade de verificar habilitação SUFRAMA diretamente via API (quando disponível).

---

## [v1.6.0] - Segurança e autenticação
- Criptografia de senhas com algoritmo atualizado (ex: bcrypt).
- Implementação de **tokens de sessão** para maior segurança.
- Logs de auditoria para acompanhar alterações em cadastros.

---

## [v1.7.0] - Experiência do usuário
- Interface responsiva para dispositivos móveis.
- Adição de **autocomplete** em campos de cidade e estado.
- Melhorias visuais com ícones nos botões de consulta (IE, SUFRAMA).
- Dashboard inicial mostrando estatísticas de organizações cadastradas.

---

## [v2.0.0] - Expansão funcional
- Criação de módulo de **relatórios** (exportação em PDF/Excel).
- Implementação de **multiusuário** com níveis de acesso diferenciados.
- Integração com sistemas de terceiros (ex: ERP, CRM).
- API própria para permitir que outros sistemas consultem os dados de organizações.
