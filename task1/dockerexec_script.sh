#!/bin/bash

cd db
docker build -t my-postgres-db ./
cid=$(docker run -d --name my-postgresdb-container -p 5432:5432 my-postgres-db)
docker exec -it  my-postgresdb-container bash -c "psql -h localhost -U postgres < rates.sql"

docip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $cid)

export DIP=$docip

cd ../rates
docker build -t my_gunicorn_app ./
docker run -d --name my-gunicorn-container -p 3000:3000 my_gunicorn_app