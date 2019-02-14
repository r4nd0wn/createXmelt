#!/bin/bash

echo "how many instanced do you want to create?"
for i in `seq 1 20`;
    do
        echo Creating directory $i
        mkdir God$i
        cp -r mul/* God$i
        cd God$i
        pm2 start GODLY.js
        cd ..
    done   
echo "succesfully created and started 20 instances"
exit

