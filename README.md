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

- The following services will be available after docker-compose is running

1. [Sugarfunge Node](https://github.com/SugarFunge/sugarfunge-node): Local blockchain node (Accessible at `ws://localhost:9944`) 
2. [Sugarfunge API](https://github.com/SugarFunge/sugarfunge-api): Blockchain API (API available at http://localhost:4000)
3. [Sugarfunge Status](https://github.com/SugarFunge/sf-front-end): Minimal blockchain information ([Click here to access](http://localhost:8000))
4. [Sugarfunge Explorer](https://github.com/SugarFunge/sugarfunge-explorer): polkadot-js blockchain explorer ([Click here to access](http://localhost:80))
5. [PostgreSQL](https://www.postgresql.org): Powerful, open source object-relational database system (Accessible at http://localhost:5432) (Tip: Change the port number or remove the port section in the docker-compose file if you already have a postgres instance running to avoid port conflicts)
6. [Keycloak](https://www.keycloak.org): Open source identity and access management solution ([Click here to access](http://localhost:8081)) (Tip: The username and password is `keycloak`)
7. [IPFS](https://ipfs.io): Distributed storage ([Click here to access the WebUI](http://localhost:5001/webui)) (API available at http://localhost:8001) 

- If you want update or stop the images
```bash
# Update SugarFunge images (requires to be logged with Docker)
$ docker-compose pull
# Stop the images
$ docker-compose down
# Stop the images and delete the PostgreSQL data
$ docker-compose down --volumes
```
