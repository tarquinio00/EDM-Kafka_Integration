export $(grep -v '^#' .env | xargs)


docker exec -it app-mysql-1 bash -c "
mysql -u root -p${MYSQL_ROOT_PASSWORD} --execute \"
USE ${MYSQL_DB_TEST};
    DELETE FROM NoteList WHERE NoteListID='test';
    \"
"