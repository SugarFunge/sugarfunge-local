# sugarfunge-local

## Software requirements

- Install [Docker](https://docs.docker.com/engine/install/ubuntu)

- Install [Docker-Compose](https://docs.docker.com/compose/install)

- Install [Ngrok](https://ngrok.com/download)

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

- Check the postgres container ID 
```
docker ps
```

- Copy the hasura.sql file into the docker container
```
docker cp hasura.sql <container-id>:/.
```

- Access the postgres docker container
```
docker exec -it <container-id> sh
```

- Set the database structure
```
psql -U hasura -d hasura < hasura.sql
```

- Access [Hasura](http://localhost:8080), data section and hit 'Track all' button for the tables/views and foreign-key relationships

- Access Hasura's settings in the metadata actions section and import the metadata json file

- Host the sf-API with ngrok for it to be accessible from appsmith (this step must be done everytime you start the containers): 
```
ngrok http http://localhost:4000
```

- Access [Appsmith](http://localhost:81) and create a local account (You can skip the tutorial)

- On the Appsmith main menu, import the app using the 'Admin Panel' json file

- Update the 'SugarFunge' datasource using the url given by ngrok (this step must be done everytime you start the containers)

- Update the 'Hasura' datasource using:
```
http://graphql-engine:8080
```

- Click on the Deploy button at top right to try the app out.


- The following services will be available after docker-compose is running

1. [Sugarfunge Node](https://github.com/SugarFunge/sugarfunge-node): Local blockchain node (Accessible at `ws://localhost:9944`) 
2. [Sugarfunge API](https://github.com/SugarFunge/sugarfunge-api): Blockchain API (API available at http://localhost:4000)
3. [Sugarfunge Status](https://github.com/SugarFunge/sf-front-end): Minimal blockchain information ([Click here to access](http://localhost:8000))
4. [Sugarfunge Explorer](https://github.com/SugarFunge/sugarfunge-explorer): polkadot-js blockchain explorer ([Click here to access](http://localhost:80))
5. [PostgreSQL](https://www.postgresql.org): Powerful, open source object-relational database system (Accessible at http://localhost:5432) (Tip: Change the port number or remove the port section in the docker-compose file if you already have a postgres instance running to avoid port conflicts)
6. [Hasura](https://hasura.io/): Instant GraphQL & REST APIs on new & existing data sources. ([Click here to access](http://localhost:8080))
7. [Keycloak](https://www.keycloak.org): Open source identity and access management solution ([Click here to access](http://localhost:8081)) (Tip: The username and password is `keycloak`)
8. [IPFS](https://ipfs.io): Distributed storage ([Click here to access the WebUI](http://localhost:5001/webui)) (API available at http://localhost:8001) 
9. [AppSmith](https://www.appsmith.com/): Powerful open source framework to build internal tools ([Click here to access](http://localhost:81))

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
