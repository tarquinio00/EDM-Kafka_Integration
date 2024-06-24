

echo "** Creating default DB and users"

mysql -u root -p$MYSQL_ROOT_PASSWORD --execute \
"CREATE DATABASE IF NOT EXISTS $MYSQL_KEYCLOAK_DB_NAME; CREATE USER '$MYSQL_KEYCLOAK_USR_NAME'@'%' IDENTIFIED BY '$MYSQL_KEYCLOAK_USR_PWD'; GRANT ALL PRIVILEGES ON $MYSQL_KEYCLOAK_DB_NAME.* TO '$MYSQL_KEYCLOAK_USR_NAME'@'%';"

#add sql dump
echo "** Loading Keycloak dump "
mysql -u root -p$MYSQL_ROOT_PASSWORD < /docker-entrypoint-initdb.d/SA_KAUTH_Dump20240624.sql
