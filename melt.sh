#!/bin/bash

echo "how many instanced do you want to create?"
read amount
for i in `seq 1 $amount`;
    do
        echo melting directory $i
        cd God$i
	cat accounts.txt >> ../all.txt
	rm accounts.txt
        cd ..
    done   
exit

