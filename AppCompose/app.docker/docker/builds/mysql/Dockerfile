FROM mysql:8.0.28

COPY ./01-databases.sh /docker-entrypoint-initdb.d
COPY ./appData_Sql_Dump20240604.sql /docker-entrypoint-initdb.d
