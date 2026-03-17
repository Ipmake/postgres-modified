#!/bin/bash
set -e

# Automatically create the pg_cron extension in the primary database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "${POSTGRES_DB:-postgres}" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS pg_cron;
EOSQL
