
| **Tabela** | **Chave Estrangeira (FK)** | **Relação** | **Objetivo Técnico** |
| --- | --- | --- | --- |
| **USUARIO** | - | Pai | Centralizar autenticação e controle de acesso do sistema. |
| **USUARIO_BIO** | ``id_usuario_fk`` | 1:1 | Armazenar dados biométricos e informações pessoais únicas do usuário. |
| **CLIENTE** | - | Pai | Gerenciar credenciais, status e autenticação dos clientes. |
| **CLIENTE_BIO** | ``id_cliente_fk`` | 1:1 | Registrar perfil biométrico e observações individuais do cliente. |
| **ORGANIZACAO** | - | Pai | Representar entidades empresariais ou grupos vinculados aos clientes. |
| **CLIENTE_ORGANIZACAO** | ``id_cliente_fk``, ``id_organizacao_fk`` | N:N | Relacionar múltiplos clientes a múltiplas organizações, garantindo unicidade dos vínculos. |

<img width="1975" height="1468" alt="DIAGRAMA MODELO-3" src="https://github.com/user-attachments/assets/01095781-fbeb-4561-95b3-22a50741ff46" />
