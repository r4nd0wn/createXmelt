#!/bin/bash

echo -e "\e[35m Script by r4nd0wn#8056 ${NC}"
#save all the colors to variable
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
echo -e "${ORANGE}Please make sure you have the following dependencies installed and the placed correctly:${NC}"
echo -e "\e[4mDEPENDENCIES\e[24m"
echo "pip install proxybroker"
echo " "
echo "if you have not, please exit the script with STRG+C and restart it if you have installed them."
echo "please type in the absolute path to the GODLY directory (NO ~/ !!!!!)."
read gdlpath
echo -e "${GREEN}your current Path is $gdlpath ${NC}"
#Countrycodes
europe='BE EL LT PT BG ES LU RO CZ FR HU SI DK HR MT SK DE IT NL FI EE CY AT SE IE LV PL UK IS NO LI CH'
asia='AF AM AZ BH BD BT BN KH CN CX CC IO GE HK IN ID IR IQ IL JP JO KZ KW KG LA LB MO MY MV MN MM NP KP OM PK PS PH QA SA SG KR LK SY TW TJ TH TR TM AE UZ VN YE'

#read -r -p "Are you sure? [y/N] " response
#if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
#then
#	echo ""
#else
#    exit
#fi

echo "Type in the Amount of Proxies you want to fetch and use and press Enter. Default = 500"
read amount
if [ -z "$amount" ]
then 
	amount=500
fi

echo -e "${ORANGE}The Proxies will be written to temp.txt if you want to use them any further. The file will be overwritten every time you restart the script.${NC}"
read -r -p "Do you want your Proxies from EU[1] or from ASIA[2]? [1/2] " responsegen
if [[ "$responsegen" =~ ^(1)+$ ]]
then
	echo "getting $amount Proxies from Europe"
   proxybroker find --types HTTP -l $amount --countries $europe |& tee temp.txt
else
	echo "getting $amount Proxies from Asia"
	proxybroker find --types HTTP -l $amount --countries $asia |& tee temp.txt
fi
proxybroker find --types HTTP -l $amount --countries BE BG CZ DK DE EE IE EL ES FR HR IT CY LV LT LU HU MT NL AT PL PT RO SI SK FI SE UK |& tee temp.txt
echo -e "${GREEN}temp writing completed${NC}"
var=($(cat temp.txt | grep -Po [0-9]+.[0-9]+.[0-9]+.[0-9]+:[0-9]+))

echo -e "${GREEN}changing directory and create proxy_list.txt${NC}"
cd $gdlpath

for i in "${var[@]}"
do
	echo "$i" >> GODLY/proxy_list.txt
done


echo -e "${GREEN}proxy_list.txt has been created${NC}"
echo "do you want to start the Generator?"
read -r -p "Do you want to start the Generator? [y/N] " responsegen
if [[ "$responsegen" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    read -r -p "Do you have pm2 installed? [y/N] " responsepm2
	if [[ "$responsepm2" =~ ^([yY][eE][sS]|[yY])+$ ]]
	then
	    echo "starting the Generator with pm2."
	    pm2 start -i 20 GODLY.js
	else
	    npm install pm2
	    pm2 start -i 20 GODLY.js
	fi
else
    exit
fi
