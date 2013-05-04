#!/bin/bash

PROJECT_DIR=$(pwd)
BUILD_DIR=$PROJECT_DIR/build
DATA_DIR=$PROJECT_DIR/data
CLASSIFY_0_DIR=$PROJECT_DIR/$1
CLASSIFY_1_DIR=$PROJECT_DIR/$2

echo "current dir : $PROJECT_DIR" 
echo "build dir : $BUILD_DIR"
echo "data dir : $DATA_DIR"

NumLinesClassify=$(wc -l build/classify-all-output.txt | awk '{print $1}')

for (( i = 2; i<=$NumLinesClassify; i++))
do
  echo $
done
       

