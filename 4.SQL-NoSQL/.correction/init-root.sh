docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "CREATE USER 'root'@'172.17.0.1' IDENTIFIED BY 'password';"
docker container exec --interactive some-mysqlds mysql --user root -ppassword \
                        --execute "GRANT ALL ON *.* TO 'root'@'172.17.0.1';"
