FROM mysql:8.0.28

COPY ./01-databases.sh /docker-entrypoint-initdb.d
COPY ../dumps/SA_KAUTH_Dump20240624.sql /docker-entrypoint-initdb.d
