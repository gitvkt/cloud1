| **Tabela** | **FK** | **Relação** | **Objetivo Técnico** |
| --- | --- | --- | --- |
| **USUARIO** | - | Pai | Centralizar login, status e autenticação. |
| **USUARIO_BIO** | ``id_usuario_fk`` | 1:1 | Perfil biométrico único (altura, peso, observações). |
| **USUARIO_CONTATO** | ``id_usuario_fk`` | 1:N | Gerenciar múltiplos endereços e meios de contato. |
| **CLIENTE** | - | Pai | Gerenciar credenciais e status dos clientes. |
| **CLIENTE_BIO** | ``id_cliente_fk`` | 1:1 | Perfil biométrico único do cliente. |
| **ORGANIZACAO** | - | Pai | Representar empresas ou grupos vinculados. |
| **CLIENTE_ORGANIZACAO** | ``id_cliente_fk``, ``id_organizacao_fk`` | N:N | Relacionar clientes a organizações, garantindo unicidade dos vínculos. |

<img width="1295" height="1834" alt="DIAGRAMA MODELO-3" src="https://github.com/user-attachments/assets/fb7f1fe0-29cb-4318-9123-d813b4a40c3f" />

