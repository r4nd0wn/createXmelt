#!bin/bash

echo "please make shure your domain is in that scheme: subsub[raisingNumber.subdomain.sag.tools"


read -r -p "Type in the absolute path to the installed directory" path

read -r -p "Whats the name of your first sag.tools subdomain?" sub
read -r -p "Whats the name of your subsub domain?" subsub
read -r -p "Whats the name of your E-Mail Prefix" Prefix
read -r -p "Type in your password" password
read -r -p "Type in your api key" apikey
read -r -p "Type in the totalAccount to Create" totalAccount
cd $path


