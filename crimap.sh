#!/bin/bash

echo "please make shure your domain is in that scheme: subsub[raisingNumber.subdomain.sag.tools"
echo " "
read -r -p "Type in the absolute path to the installed directory " path

read -r -p "Whats the name of your first sag.tools subdomain? " sub
read -r -p "Whats the name of your subsub domain? " subsub
read -r -p "Whats the name of your E-Mail Prefix " Prefix
read -r -p "Type in your password " password
read -r -p "Type in your api key " apikey
read -r -p "Type in the totalAccount to Create " totalAccount
read -r -p "how many instances do you want to create? " amount
cd $path
mkdir ../instances


for i in `seq 0 $amount`;
	do
		cd ../instances/
		mkdir gen$i
		cp -r $path/* gen$i/
		cd gen$i/
		echo "{
        \"email\": {
                \"domain\": \"$subsub$i.$sub.sag.tools\",
                \"inbox\": \"$Prefix@$subsub$i.$sub.sag.tools\",
                \"password\": \"$password\",
                \"port\": 143,
                \"tls\": false,
                \"method\": \"imap\",
                \"httpService\": {
                        \"domain\": \"aio.email\"
                }
        },
        \"captcha\": {
                \"apikey\": \"$apikey\",
                \"version\": \"v2\"
        },
        \"proxy\": {
                \"enabled\": true,
                \"getproxylist\": {
                        \"apikey\": \"606736640e23ae7fd80e3d26dce1c548940951a2\",
                        \"countryCodes\": [\"AX\", \"AR\", \"AU\", \"AT\", \"BH\", \"BE\", \"BR\", \"CM\", \"CA\", \"CN\", \"CR\", \"CU\"]
                },
                \"threshold\": 5,
                \"method\": \"custom\",
                \"fileName\": \"proxy_list.txt\"
        },
        \"account\": {
                \"free_licenses\": [730, 570],
                \"create_login_batch\": false
        },
        \"totalAccountToBeCreate\": 100000,
        \"usernamePasswordFile\": \"username_password.txt\"
	}" > GODLY/pCFG.json
		pm2 start GODLY20.js --cron '30 * * * *'
		cd $path
	done   
exit
