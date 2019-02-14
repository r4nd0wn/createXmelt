#!/bin/bash

echo "milking 20 instances"
oldQty=0
qty=($(wc -l all.txt))
oldQty=qty
for i in `seq 1 20`;
    do
        echo milking directory $i
        cd God$i
	cat username_password.txt >> ../all.txt
	rm username_password.txt
        cd ..
    done
newQty=($(wc -l all.txt))
difference=$((newQty - oldQty))
echo you milked $difference accounts.
echo Your all.txt now contains $newQty accounts.
exit

