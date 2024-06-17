

echo "** Creating default DB and users"


mysql -u root -p$MYSQL_ROOT_PASSWORD --execute \
"CREATE DATABASE IF NOT EXISTS $MYSQL_COUNTERS_DB_NAME; CREATE USER '$MYSQL_COUNTERS_USR_NAME'@'%' IDENTIFIED BY '$MYSQL_COUNTERS_USR_PWD'; GRANT ALL PRIVILEGES ON $MYSQL_COUNTERS_DB_NAME.* TO '$MYSQL_COUNTERS_USR_NAME'@'%';"

mysql -u root -p$MYSQL_ROOT_PASSWORD --execute \
"CREATE USER '$MYSQL_READER_USR_NAME'@'%' IDENTIFIED BY '$MYSQL_READER_USR_PWD'; GRANT SELECT ON $MYSQL_COUNTERS_DB_NAME.* TO '$MYSQL_READER_USR_NAME'@'%';"

#creazione dell'utente Debezium con i permessi necessari
echo "** Creating Debezium User"
mysql -u root -p$MYSQL_ROOT_PASSWORD --execute \
"CREATE USER '$MYSQL_DBZ_USR_NAME'@'%' IDENTIFIED BY '$MYSQL_DBZ_USR_PWD'; GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO '$MYSQL_DBZ_USR_NAME'@'%';"

#Nella buona pratica questo DB non dovrebbe esserci, non dovrebbe essere creato in questo modo. 
#Viene creato solo per consentire il test dell'applicazione. 
echo "** Creating Traceability DB for testing"
mysql -u root -p$MYSQL_ROOT_PASSWORD < /docker-entrypoint-initdb.d/appData_Sql_Dump20240604.sql
