#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE adv_account;
    CREATE DATABASE adv_catalog;
    CREATE DATABASE adv_order;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "adv_account" -f /creproc--adv_account--get_all_countries_with_sleep.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "adv_account" -f /creproc--adv_account--truncate_account_service_tables.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "adv_catalog" -f /creproc--adv_catalog--truncate_catalog_tables.sql

