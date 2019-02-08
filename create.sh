#!/bin/bash

echo "how many instanced do you want to create?"
read amount
for i in `seq 1 $amount`;
    do
        echo Creating directory $i
        mkdir God$i
        cp -r God/* God$i
        cd God$i
        pm2 start GODLY.js
        cd ..
    done   
echo "succesfully created and started $amount instances"
exit

