#!/bin/bash

apt install -qqy libpq-dev wget apt-transport-https

wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

apt install ./packages-microsoft-prod.deb
apt-get update
apt-get install -qqy dotnet-sdk-3.1
rm -rf ./*.deb
