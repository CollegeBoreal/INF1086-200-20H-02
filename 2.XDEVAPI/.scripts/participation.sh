#!/bin/sh

# --------------------------------------
#
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only

   
echo "# Participation au `date +"%d-%m-%Y %H:%M"`"
echo "\n## Légende\n"

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :heavy_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Projet inexistant             |"


echo "\n## Résultat\n"
echo "|:hash:| Boréal :id:                | Execution          | Notation         |"
echo "|------|----------------------------|--------------------|------------------|"

i=1


for id in "${ETUDIANTS[@]}"
do
   FILE=b${id}.py
   OK="| ${i} | [${id}](../${FILE}) | [:heavy_check_mark:](Execution.md#etudiant-${id}) | [:bar_chart:](Notation.md#etudiant-${id}) | "
   KO="| ${i} | [${id}](../${FILE}) | [:x:](Execution.md#etudiant-${id})                | [:x:](Notation.md#etudiant-${id}) | "
   if [ -f "$FILE" ]; then
       echo ${OK}
   else
       echo ${KO}
   fi
   let "i++"
done
