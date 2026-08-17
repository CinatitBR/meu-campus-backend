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

### Rotas da API

A documentação completa das rotas pode ser encontrada no arquivo `openapi.yaml`, que utiliza a especificação [OpenAPI](https://swagger.io/docs/specification/v3_0/about/).

Apesar de parecer confuso de le-lo num primeiro momento,
é possível renderiza-lo de forma que as informações sejam apresentadas limpa e intuitivamente, utilizando plataformas como o [Swagger Editor](https://swagger.io/open-source/swagger-editor/).

No VSCode, é possível gerar uma linda visualização do arquivo utilizando a extensão [OpenAPI (Swagger)](https://marketplace.visualstudio.com/items?itemName=42Crunch.vs-openapi).

Abaixo, segue uma breve descrição das rotas (utilizando uma versão improvisada que escrevi do JSON com os tipos do Typescript):

**POST `api/visual-route`**:  
Essa é a rota responsável por criar rotas visuais. Ela é definida pela função `handleCreateVisualRoute()`.

Recebe um formData contendo os dados para a criação da rota visual. Os campos esperados no formData são:

```json
{
    "title": "string",
    "building-id": "string",
    "status": "published" || "hidden",
    "steps_metadata": {
        "step_order": "number",
        "description": "string",
        "lon": "number",
        "lat": "number"
    }[],
    /*
        Representa a imagem associada a steps_metadata[i].

        Portanto, se o tamanho do array steps_metadata for 3,
        devem existir step_image_0, step_image_1, step_image_2.
    */
    "step_image_i": "Blob" // Blob: tipo de dado que representa uma imagem.
}
```
