#!/bin/sh

# --------------------------------------
# Spec (test) specific file
# Use this to customize the testing files
# code: Binary Search 
# --------------------------------------

generate_spec () {
   echo "import sys; sys.path.append('.') # Rajouter le repertoire courant" > .scripts/b${id}.spec.py
  
   echo "from b${id} import rightTriangle" >> .scripts/b${id}.spec.py
   echo "test = rightTriangle(11) == [(8, 6, 10)] " >> .scripts/b${id}.spec.py
   echo "if  test:" >> .scripts/b${id}.spec.py
   echo "     print('--------------------')" >> .scripts/b${id}.spec.py
   echo "     print(':tada: :tada: :tada:')" >> .scripts/b${id}.spec.py
   echo "else:" >> .scripts/b${id}.spec.py
   echo "     print('--------------------')" >> .scripts/b${id}.spec.py
   echo "     print(':no_entry: :no_entry: :interrobang:')" >> .scripts/b${id}.spec.py
}

