#!bin/bash

echo "please make shure your domain is in that scheme: subsub[raisingNumber.subdomain.sag.tools"

read -r -p "Type in the absolute path to the installed directory" path

read -r -p "Whats the name of your first sag.tools subdomain?" sub
read -r -p "Whats the name of your subsub domain?" subsub
read -r -p "Whats the name of your E-Mail Prefix" Prefix
read -r -p "Type in your password" password
read -r -p "Type in your api key" apikey
read -r -p "Type in the totalAccount to Create" totalAccount
read -r -p "how many instances do you want to create?" amount
cd $path
mkdir ../instances


for i in `seq 0 $amount`;
    do
    	mkdir ../instances/$i
    	cp -r ./* ../instances/$i
    	cd ../instances/$i/
    	echo "{
    		\"email\": {
				\"domain\": \"$sub.sag.tools\",
				\"inbox\": \"$Prefix@$subsub$i$sub.sag.tools\",
				\"password\": \"$password\",
				\"port\": 143,
				\"tls\": false,
				\"method\": \"imap\",
				\"httpService\": {
					\"domain\": \"inboxkitten.com\"
				}
			},
			\"captcha\": {
				\"apikey\": \"$apikey\",
				\"version\": \"v2\"
			},
			\"proxy\": {
				\"enabled\": true,
				\"getproxylist\": {
					\"apikey\": \"606736640e23ae7fd80e3d26dce1c548940951a2\"
					},
				\"threshold\": 5,
				\"method\": \"api\",
				\"fileName\": \"proxy_list.txt\"
			},
			\"account\": {
				\"free_licenses\": [730, 570],
				\"create_login_batch\": false
			},
			\"totalAccountToBeCreate\": 2000,
			\"usernamePasswordFile\": \"username_password.txt\"
		}" > GODLY/pCFG.json
    done   
exit
