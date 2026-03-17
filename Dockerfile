FROM postgres:18.1

RUN apt-get update \
    && apt-get install -y postgresql-18-cron \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint-wrapper.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint-wrapper.sh

COPY 001-setup-pgcron.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/001-setup-pgcron.sh

ENTRYPOINT ["entrypoint-wrapper.sh"]
CMD ["postgres"]
