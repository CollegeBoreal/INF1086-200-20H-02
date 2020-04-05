#!/bin/sh

# --------------------------------------
#
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only

source .correction/databases.sh --source-only

echo "# Execution au `date +"%d-%m-%Y %H:%M"`"

i=0

> .correction/create-dbs.sh
for id in "${ETUDIANTS[@]}"
do

   SQL="'exec mysql --user root --password=password --execute \"CREATE DATABASE '${DATABASES[i]}';\" '"
   echo "docker container exec --interactive some-mysqlds sh -c ${SQL}"
   echo "docker container exec --interactive some-mysqlds sh -c ${SQL}" >> .correction/create-dbs.sh
   i=$((i+1))
   
done
sh .correction/create-dbs.sh

i=0

for id in "${ETUDIANTS[@]}"
do

   echo "\n## Etudiant ${id} "
   echo "###  =[BEGIN]============== Exécution du script ${DATABASES[i]} pour ${id} =============== "
   echo "\`\`\`"


   docker container exec --interactive some-mysqlds mysql --user root -ppassword \
             ${DATABASES[i]} < ~/Developer/INF1086-200-20H-02/4.SQL-NoSQL/${id}/${id}-dump.sql

   echo "\`\`\`"
   echo "###  =[END]============== Exécution du script ${DATABASES[i]} pour ${id} =============== "

   i=$((i+1))
   
done
