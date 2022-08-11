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
ufw allow 22 comment "SSH"
ufw allow 80 comment "HTTP"
ufw allow 443 comment "HTTPS"
ufw allow 8080 comment "HTTP - OnlyOffice"
ufw allow 8443 comment "HTTPS - OnlyOffice"
ufw allow 4300 comment "HTTPS - Shell in a box"
ufw allow 3478/tcp comment "COTURN"
ufw allow 3478/ud comment "COTURN"


echo "Enabling Firewall"
echo -e "=====\n"
yes | sudo ufw enable
sudo ufw status verbose

echo "Done"
echo -e "=====\n"
