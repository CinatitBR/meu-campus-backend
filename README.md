Este repositório armazena os arquivos relacionados ao Cloudflare Worker que atua no backend do meu-campus.

### `db/`

Contém arquivos SQL utilizados para criar o banco de dados local do Cloudflare, e simular o banco de dados remoto (de produção).

- `schema.sql`: cria o schema que simula o banco de dados de produção.
- `seed.sql`: popula as tabelas do banco de dados local, de forma a simular o banco remoto.
