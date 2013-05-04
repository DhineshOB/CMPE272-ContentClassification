#!/bin/bash

if [ "$1" = "clean" ]
then
cd Data
DATAPATH=$(pwd)
echo "Removing all Files in $DATAPATH" 
rm -f *.*
else
FILECOUNT="$1"
cd Data
DATAPATH=$(pwd)
echo "Generating $FILECOUNT Files in $DATAPATH" 

for (( i = 1; i<=$FILECOUNT; i++))
do
  echo "" > IndCmpe202_$i.pdf
done

for (( i = 1; i<=$FILECOUNT; i++))
do
  echo "" > IndCmpe202_$i.doc
done

for (( i = 1; i<=$FILECOUNT; i++))
do
  echo "" > ExtCmpe202_$i.pdf
done

for (( i = 1; i<=$FILECOUNT; i++))
do
  echo "" > ExtCmpe202_$i.doc
done
fi
