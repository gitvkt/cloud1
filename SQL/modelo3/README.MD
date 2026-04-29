                ┌───────────────┐
                │   USUARIO     │
                │ id_usuario_pk │
                └───────┬───────┘
                        │ 1:1
                        │
                ┌───────────────┐
                │ USUARIO_BIO   │
                │ id_usuario_fk │
                └───────────────┘


                ┌───────────────┐
                │   CLIENTE     │
                │ id_cliente_pk │
                └───────┬───────┘
                        │ 1:1
                        │
                ┌───────────────┐
                │ CLIENTE_BIO   │
                │ id_cliente_fk │
                └───────────────┘


                ┌───────────────┐
                │ ORGANIZACAO   │
                │ id_organizacao│
                └───────┬───────┘
                        │ N:N
                        │
                ┌────────────────────┐
                │CLIENTE_ORGANIZACAO │
                │ id_cliente_fk      │───► CLIENTE
                │ id_org_fk          │───► ORGANIZACAO
                └────────────────────┘
