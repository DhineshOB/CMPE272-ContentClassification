#!/bin/bash

CL_TYPE=$1
#echo "CL_TYPE is $CL_TYPE"
cd build
cp classify-train.txt classify-train-copy.txt
rm classify-train.txt
head -1 classify-all.txt | awk -F, 'NR==1 {print $2","$3","$4}' classify-all.txt >> classify-train.txt
NumLinesAll=$(wc -l classify-train-copy.txt | awk '{print $1}')
for (( i = 2; i<=$NumLinesAll; i++))
do
  #echo "Line : $i"
if [ "$CL_TYPE" = "atype" ]
then
  awk -F, -v var=$i 'NR==var {if($1 > 300) print $1","2","1; else print $1","1","0;}' classify-train-copy.txt >> classify-train.txt
fi
if [ "$CL_TYPE" = "ftype" ]
then
  awk -F, -v var=$i 'NR==var {if($1 > 310) print $1","2","1; else print $1","1","0;}' classify-train-copy.txt >> classify-train.txt
fi

done
rm classify-train-copy.txt
