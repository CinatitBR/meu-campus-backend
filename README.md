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

**POST `api/visual-route`**:  
Essa é a rota responsável por criar rotas visuais. Ela é definida pela função `handleCreateVisualRoute()`.

Recebe um formData contendo os dados para a criação da rota visual. Os campos esperados no formData são:

```json
{
	"openapi": "3.0.3",
	"info": {
		"title": "Visual Route API",
		"version": "1.0.0",
		"description": "API para criação de rotas visuais estruturadas com metadados e imagens geolocalizadas por etapa."
	},
	"paths": {
		"/api/visual-route": {
			"post": {
				"summary": "Criar Rota Visual",
				"description": "Cria uma nova rota visual a partir de metadados das etapas e imagens associadas dinamicamente via FormData.",
				"operationId": "handleCreateVisualRoute",
				"requestBody": {
					"required": true,
					"content": {
						"multipart/form-data": {
							"schema": {
								"type": "object",
								"properties": {
									"title": {
										"type": "string",
										"description": "Título descritivo da rota visual."
									},
									"building-id": {
										"type": "string",
										"description": "Identificador único do edifício associado."
									},
									"status": {
										"type": "string",
										"enum": ["published", "hidden"],
										"description": "Estado de visibilidade da rota."
									},
									"steps_metadata": {
										"type": "array",
										"description": "Lista de metadados das etapas estruturada em formato JSON stringificado (ou múltiplos campos indexados dependendo do parser).",
										"items": {
											"type": "object",
											"properties": {
												"step_order": {
													"type": "integer",
													"description": "Ordem sequencial da etapa."
												},
												"description": {
													"type": "string",
													"description": "Descrição textual da etapa."
												},
												"lon": {
													"type": "number",
													"format": "float",
													"description": "Longitude para geolocalização."
												},
												"lat": {
													"type": "number",
													"format": "float",
													"description": "Latitude para geolocalização."
												}
											},
											"required": ["step_order", "description", "lon", "lat"]
										}
									}
								},
								"required": ["title", "building-id", "status", "steps_metadata"],
								"additionalProperties": {
									"type": "string",
									"format": "binary",
									"description": "Campos dinâmicos no formato `step_image_i` (ex: step_image_0, step_image_1) contendo o arquivo de imagem correspondente ao índice da etapa em `steps_metadata`."
								}
							}
						}
					}
				},
				"responses": {
					"201": {
						"description": "Rota visual criada com sucesso."
					},
					"400": {
						"description": "Dados de requisição inválidos ou ausência de arquivos de imagem obrigatórios."
					}
				}
			}
		}
	}
}
```
