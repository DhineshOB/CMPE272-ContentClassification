#!/bin/bash
cd build

# Remove the first 2 lines (with tail) and the last 3 lines ( with head) of the Mahout output as it contains program statistics which will not be required for parsing the output.
tail -n +3 < classify-test-output.txt | head -n -3  >> classify-test-output-copy.txt


#copy all the lines from classify-train.txt to classify-all-output.txt 
NumLinesAll=$(wc -l classify-train.txt | awk '{print $1}')
for (( i = 1; i<=$NumLinesAll; i++))
do
#echo "i: $i"
awk -F, -v var=$i 'NR==var {print $1","$2","$3}' classify-train.txt >> classify-all-output.txt
done

#copy all the lines from classify-train.txt to classify-all-output.txt
NumLinesOut=$(wc -l classify-test-output-copy.txt | awk '{print $1}')
for (( i = 2; i<=$NumLinesOut; i++))
do
#echo "i: $i"
printf "%s" "$(awk -F, -v var=$i 'NR==var {print $1","$2","}' classify-test.txt)" >> classify-all-output.txt
printf "%s\n" "$(awk -F, -v var=$i 'NR==var {if($2 > 0) print 1; else print 0;}' classify-test-output-copy.txt)" >> classify-all-output.txt
done

# copy first line from classify-all-output.txt to classify-all-final-output.txt
awk -F, 'NR==1 {print $1","$2","$3","$4}' classify-all.txt >> classify-all-final-output.txt

#Merge lines 2 to end of file from classify-all-output.txt and classify-all.txt to classify-all-final-output.txt
NumLinesFinal=$(wc -l classify-all.txt | awk '{print $1}')
for (( i = 2; i<=$NumLinesFinal; i++))
do
#echo "i: $i"
printf "%s" "$(awk -F, -v var=$i 'NR==var {print $1","$2","}' classify-all.txt)" >> classify-all-final-output.txt
printf "%s\n" "$(awk -F, -v var=$i 'NR==var {print $2","$3}' classify-all-output.txt)" >> classify-all-final-output.txt
done

mkdir MahoutOutput
mv classify-all-output.txt MahoutOutput/classify-output.txt
mv classify-test-output.txt MahoutOutput/Mahout-output.txt
mv classify-all-final-output.txt classify-all-output.txt
rm classify-test-output-copy.txt



