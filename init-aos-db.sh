#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE adv_account;
    CREATE DATABASE adv_catalog;
    CREATE DATABASE adv_order;
EOSQL
