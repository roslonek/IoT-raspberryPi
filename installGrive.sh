#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git cmake build-essential libgcrypt11-dev libjson0-dev libcurl4-openssl-dev libexpat1-dev libboost-filesystem-dev libboost-program-options-dev binutils-dev libboost-test-dev libqt4-dev libyajl-dev


echo "--------getting Grive source code"
cd ~
git clone git://github.com/Grive/grive.git


echo "-------Compile grive"
cd grive
cmake .
make

echo "-------Make dir for Grive"
mkdir ~/google_drive


#In order to make grive work it needs to be in your google drive, so copy the grive executable to the google drive directory:

cp ~/grive/grive/grive ~/google_drive



echo "Authenticate grive to work with your Google Drive account, it will generate access code"

cd ~/google_drive
./grive -a



#Grive can be run in a test mode, which will do everything other than uploading / downloading.

./grive --dry-run


#Run

./grive