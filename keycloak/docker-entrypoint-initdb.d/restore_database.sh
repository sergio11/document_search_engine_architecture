#!/bin/bash

cd /docker-entrypoint-initdb.d/

export PGPASSWORD=ssanchez00
echo "Restoring Keycloak Database"
psql -U keycloak -p 5432 -d keycloak < "keycloak_db.sql"