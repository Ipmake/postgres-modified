#!/bin/bash
set -e

# If the command is 'postgres', append our default parameters
if [ "$1" = 'postgres' ]; then
    shift
    # Ensure pg_cron is loaded and configured for the correct database
    exec docker-entrypoint.sh postgres -c shared_preload_libraries=pg_cron -c cron.database_name="${POSTGRES_DB:-postgres}" "$@"
fi

# Fallback to standard entrypoint behavior
exec docker-entrypoint.sh "$@"
