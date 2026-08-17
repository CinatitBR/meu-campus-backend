Este repositório armazena os arquivos relacionados ao Cloudflare Worker que atua no backend do meu-campus.

Os arquivos que verdadeiramente importam são:

**`wrangler.jsonc`**:

- É o arquivo de configuração da Cloudflare. Ele define quais serviços estamos usando.
- No momento, há dois serviços cadastrados: um banco de dados D1 (armazenar dados gerais) e um object storage R2 (armazenar imagens).
- O database_name e o bucket_name são nomes que eu cadastrei na minha conta Cloudflare para poder usa-los. Quando eu executo o projeto, eu tenho que estar logado na minha conta para funcionar. Tudo isso é feito no terminal usando `npx wrangler` (a CLI da cloudflare para adminstrar os projetos dela)

**`src/index.ts`**:

- O código fonte que define as rotas fica aqui. Ele utiliza os serviços cadastrados no wrangler.jsonc. Se eu quiser colocar dados no banco de dados, vou usar o banco D1 que cadastrei.

### Outros arquivos

**`db/`**:

Pasta que contém arquivos SQL utilizados para criar o banco de dados local do Cloudflare, e simular o banco de dados remoto (de produção).

- `schema.sql`: cria o schema que simula o banco de dados de produção.
- `seed.sql`: popula as tabelas do banco de dados local, de forma a simular o banco remoto.
