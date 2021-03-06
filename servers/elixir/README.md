# Elixir Phoenix HTTP Server

## Dependências

* Elixir `brew install elixir`
* Node `brew install npm`
* Postgres `brew install postgres`
* Heroku `brew install heroku`

## Desenvolvimento

```bash
mix deps.get
mix ecto.create && mix ecto.migrate
npm install
mix phoenix.server
```

Visite [`localhost:4000`](http://localhost:4000) no seu browser.

## Produção

Vamos fazer o deploy da aplicação para o [Heroku](https://www.heroku.com/). Para maiores detalhes verifique a [Documentação do Phoenix](http://www.phoenixframework.org/docs/heroku). Antes de começar, crie uma conta no [Heroku](https://www.heroku.com/).

### Configuração

```bash
heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"
heroku apps:rename <YOUR_APP_NAME> --app OLD_NAME
heroku git:remote -a <YOUR_APP_NAME>
heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
heroku addons:create heroku-postgresql:hobby-dev
heroku config:set POOL_SIZE=18
```

Modifique seu arquivo de configuração `config/prod.exs` com o endereço correto da sua aplicação:

```elixir
url: [host: "<YOUR_APP_NAME>.herokuapp.com", port: 80],
```

Ou caso você queira usar SSL:

```elixir
url: [scheme: "https", host: "<YOUR_APP_NAME>.herokuapp.com", port: 443],
force_ssl: [rewrite_on: [:x_forwarded_proto]],
```

> ALERTA: Caso você escolha usar SSL no seu servidor, lembre-se de realizar as requisições a partir do cliente ESP8266 usando o mesmo protocolo. Para fins didáticos recomendamos não usar SSL.

Crie a chave `SECRET_KEY_BASE` e adicione ela nas configurações do Heroku:

```bash
mix phoenix.gen.secret
heroku config:set SECRET_KEY_BASE="<SECRET_KEY_BASE>"
```

### Deploy

Rode as migrações de banco:

```bash
heroku run "POOL_SIZE=2 mix ecto.migrate"
```

No diretório raiz execute:

```
git subtree push --prefix servers/elixir heroku master
heroku open
```


### Docker Dev

#### Cria a imagem docker do servidor elixir
docker build -t fablab_iot_server .

#### Inicia o container docker com o banco de dados postgres
docker run --name iot_db_server -e POSTGRES_USER=postgres -e  POSTGRES_PASSWORD=postgres -e POSTGRES_DB=iot_server_dev -d postgres

#### Criar banco de dados
docker run -d -p 4000:4000 -e MIX_ENV=dev --link iot_db_server:iot_db_server fablab_iot_server /bin/bash -c "cd /srv/iot; mix ecto.create; mix ecto.migrate; mix phoenix.server"

#### Inicia o container docker para conecao com o banco (apenas para manutenção)
docker run -it --rm --link iot_db_server:iot_db_server postgres psql -h postgres -U postgres



