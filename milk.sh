#!/bin/bash

echo "Script by r4nd0wn#8056"
echo "Idea with the account counter by Kewaii#3167"
echo "how many instances do you want to milk?"
read amount
echo "milking $amount instances"
oldQty=0
qty=($(wc -l all.txt))
oldQty=qty
for i in `seq 1 $amount`;
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
