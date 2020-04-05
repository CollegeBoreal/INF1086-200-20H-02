#!/bin/bash

FOLDER=.correction

sh $FOLDER/participation.sh > $FOLDER/Participation.md 2>&1
sh $FOLDER/execution.sh > $FOLDER/Execution.md 2>&1
sh $FOLDER/notation.sh > $FOLDER/Notation.md 2>&1
