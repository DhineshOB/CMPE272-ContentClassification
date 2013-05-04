#!/bin/bash
cd build
count1=1
count4=4
count5=5
NumLinesAll=$(wc -l classify-all.txt | awk '{print $1}')
NumLinesAll=$((NumLinesAll - count1))
echo "Number of lines : $NumLinesAll"
head -1 classify-all.txt | awk -F, 'NR==1 {print $2","$3","$4}' classify-all.txt >> classify-train.txt
head -1 classify-all.txt | awk -F, 'NR==1 {print $2","$3","$4}' classify-all.txt >> classify-test.txt
NumLinesTrain=$((NumLinesAll / count5))
NumLinesTest=$((NumLinesAll - NumLinesTrain))
echo "Number of Entries to train: $NumLinesTrain"
echo "Number of Entries to test : $NumLinesTest"
for (( i = 2; i<=$NumLinesTrain+1; i++))
do
#echo "i: $i"
awk -F, -v var=$i 'NR==var {print $2","}' classify-all.txt >> classify-train.txt
done
for (( i =$NumLinesTrain+2; i<=NumLinesAll+1; i++))
do
#echo "i: $i"
#awk -F, -v var=$i 'NR==var {if($1 > 300) print $2","2","; else print $2","1","}' classify-all.txt >> classify-test.txt
awk -F, -v var=$i 'NR==var {if($2 > 300) print $2","2","; else print $2","1",";}' classify-all.txt >> classify-test.txt
done
