# sugarfunge-local

## Software requirements

- Install [Docker](https://docs.docker.com/engine/install/ubuntu)

- Install [Docker-Compose](https://docs.docker.com/compose/install)

## Usage

- Clone the project
```
git clone https://github.com/SugarFunge/sugarfunge-local.git
```

- Copy the environment file as **.env**
```
cp .env.example .env
```


- Login with Docker or build the SugarFunge docker images and configure the docker-compose file with those images
```
docker login -u (username) -p (password) sugarfunge.azurecr.io
```

- Run with docker-compose
```
docker-compose up -d
```
- Access [Appsmith](http://localhost:7000) and create a local account (You can skip the tutorial)

- On the Appsmith main menu, import the app using a fork of the following ([git repo](https://github.com/SugarFunge/sugarfunge-admin-panel)) and follow the steps provided by appsmith.

- Update the 'SugarFunge' datasource using:
```
http://host.docker.internal:4000
```

- Update the 'Hasura' datasource using:
```
http://graphql-engine:8080
```

- Go to the main menu and launch the app to start using the admin panel.


- The following services will be available after docker-compose is running

1. [Sugarfunge Node](https://github.com/SugarFunge/sugarfunge-node): Local blockchain node (Accessible at `ws://localhost:9944`) 
2. [Sugarfunge API](https://github.com/SugarFunge/sugarfunge-api): Blockchain API (API available at http://localhost:4000)
3. [Sugarfunge Status](https://github.com/SugarFunge/sf-front-end): Minimal blockchain information ([Click here to access](http://localhost:8000))
4. [Sugarfunge Explorer](https://github.com/SugarFunge/sugarfunge-explorer): polkadot-js blockchain explorer ([Click here to access](http://localhost:80))
5. [PostgreSQL](https://www.postgresql.org): Powerful, open source object-relational database system (Accessible at http://localhost:5432) (Tip: Change the port number or remove the port section in the docker-compose file if you already have a postgres instance running to avoid port conflicts)
6. [Hasura](https://hasura.io/): Instant GraphQL & REST APIs on new & existing data sources. ([Click here to access](http://localhost:8080))
7. [Keycloak](https://www.keycloak.org): Open source identity and access management solution ([Click here to access](http://localhost:8081)) (Tip: The username and password is `keycloak`)
8. [IPFS](https://ipfs.io): Distributed storage ([Click here to access the WebUI](http://localhost:5001/webui)) (API available at http://localhost:8001) 
9. [AppSmith](https://www.appsmith.com/): Powerful open source framework to build internal tools ([Click here to access](http://localhost:7000))

- If you want update or stop the images
```bash
# Update SugarFunge images (requires to be logged with Docker)
$ docker-compose pull
# Stop the images
$ docker-compose down
# Stop the images and delete the PostgreSQL data
$ docker-compose down --volumes
```

## Environment configuration

- Default environment file: **.env**
- Example environment file: **.env.example**

| Variable Name               | Description                             |
| --------------------------- | --------------------------------------- |
| DATABASE_HOST               | Postgres database host                  |
| POSTGRES_USER               | Postgres default user                   |
| POSTGRES_PASSWORD           | Postgres default password               |
| POSTGRES_DB                 | Postgres default database name          |
| DB_VENDOR                   | Database management vendor              |
| DB_ADDR                     | Address of postgres server for Keycloak |
| DB_DATABASE                 | Keycloak postgres database name         |
| DB_SCHEMA                   | Keycloak postgres schema name           |
| DB_USER                     | Keycloak postgres database user         |
| DB_PASSWORD                 | Keycloak postgres database password     |
| KEYCLOAK_USER               | Keycloak default username               |
| KEYCLOAK_PASSWORD           | Keycloak default password               |
| PORT                        | Port (sf-status)                        |
| REACT_APP_PROVIDER_SOCKET   | Node WebSocket url (sf-status)          |
| WS_URL                      | Node WebSocket url (sf-explorer)        |
| HASURA_GRAPHQL_DATABASE_URL | Postgres database url                   |
| HASURA_GRAPHQL_ADMIN_SECRET | Hasura admin secret Key                 |

## Local Configuration

It's possible to build the images locally if you don't have access or don't want to use the azure pre-built containers, start docker compose using the following command to get started:

```bash
docker compose -f docker-compose-local.yaml up -d
```

> NOTE: The sugarfunge-node code is pulled directly from github, using the main branch, change to a different one if needed on `docker-compose-local.yaml` file.

## Sugarfunge ERC1155 Integration

We have 6 (six) graphql actions on hasura that maps directly to the `sugarfunge-integration` api, these actions aim to act as a bridge for asset conversion between the sugarfunge and ethereum networks.

To get these actions running you will need to setup the sugarfunge-integration repository on your local machine and configure the API address inside the docker-compose environment settings for graphql-engine:

```yaml
graphql-engine:
    image: 'hasura/graphql-engine:v2.6.0.cli-migrations-v3'
    ports:
      - '8080:8080'
    depends_on:
      - postgres
    restart: always
    volumes:
      - ./hasura/migrations:/hasura-migrations
      - ./hasura/metadata:/hasura-metadata
      - ./hasura/seeds:/hasura-seeds
    environment:
      HASURA_GRAPHQL_DATABASE_URL: ${HASURA_GRAPHQL_DATABASE_URL}
      HASURA_GRAPHQL_ENABLE_CONSOLE: "false"
      HASURA_GRAPHQL_DEV_MODE: "true"
      HASURA_GRAPHQL_ADMIN_SECRET: ${HASURA_GRAPHQL_ADMIN_SECRET}
      HASURA_GRAPHQL_ENABLED_LOG_TYPES: "startup, http-log, webhook-log, websocket-log, query-log"
      ACTION_BASE_URL: "http://127.0.0.1:3000"
      # Replace this environment variable with the sugarfunge-integration api address
      ACTION_RESOLVER_API_ENDPOINT: "http://172.17.0.1:9000"
```