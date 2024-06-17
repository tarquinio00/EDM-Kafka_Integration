#!/bin/bash


mysqld --user=root --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --require_secure_transport=ON --ssl-ca=/etc/certs/ca.crt --ssl-cert=/etc/certs/domain.crt --ssl-key=/etc/certs/domain.key --default_authentication_plugin=mysql_native_password --innodb-buffer-pool-size=1G
