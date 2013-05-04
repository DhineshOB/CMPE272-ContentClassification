#!/bin/bash

/bin/bash /usr/local/mahout/mahout-distribution-0.7/bin/mahout runlogistic --input /usr/local/project272/build/classify-test.txt --model ./build/model --auc --confusion --scores >> build/classify-test-output.txt
