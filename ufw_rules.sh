#!/bin/bash

echo "Updating Firewall rules"
echo -e "=====\n"


echo "Clearing current rules"
echo -e "=====\n"
sudo ufw disable
yes | sudo ufw reset


echo "Adding default Rules"
echo -e "=====\n"
sudo ufw default deny incoming
sudo ufw default allow outgoing


echo "Adding External Rules"
echo -e "=====\n"

#Anpassen
sudo ufw allow 22 comment "SSH"
sudo ufw allow 80 comment "HTTP"
sudo ufw allow 443 comment "HTTPS"
sudo ufw allow 1080 comment "HTTP - OnlyOffice"
sudo ufw allow 1443 comment "HTTPS - OnlyOffice"


echo "Enabling Firewall"
echo -e "=====\n"
yes | sudo ufw enable
sudo ufw status verbose

echo "Done"
echo -e "=====\n"
