PROGRESS_FILE=/tmp/jeedom/speedtest/dependance
touch ${PROGRESS_FILE}
echo "********************************************************"
echo "*             Installation des dépendances             *"
echo "********************************************************"
echo 0 > ${PROGRESS_FILE}
echo "***** Commande: sudo apt-get update **********"
sudo apt-get update
echo 30 > ${PROGRESS_FILE}
echo "***** Commande: install python-pip**********"
sudo apt-get install -y python-pip
echo "***** Commande: install speedtest-cli **********"
pip install git+https://github.com/sivel/speedtest-cli.git
echo "***** Commande: ajout domaine SpeedTest dans le security.conf d'Apache **********"
sudo sed -i "s/img-src 'self'/& *.speedtest.net/" /etc/apache2/conf-available/security.conf
sudo systemctl restart apache2
echo 100 > ${PROGRESS_FILE}
echo "********************************************************"
echo "*             Installation terminée                    *"
echo "********************************************************"
rm ${PROGRESS_FILE}
