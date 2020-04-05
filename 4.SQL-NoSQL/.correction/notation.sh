#!/bin/sh

# --------------------------------------
# Grader
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only

echo "# Correction au `date +"%d-%m-%Y %H:%M"`"

for id in "${ETUDIANTS[@]}"
do

   echo "\n## Etudiant ${id} "
   echo "###  =[BEGIN]============== Correction du script ${id} =============== "

   python .scripts/b${id}.spec.py

   echo "###  =[END]============== Correction du script ${id} =============== "
   
   
done
