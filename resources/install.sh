PROGRESS_FILE=/tmp/jeedom/speedtest/dependance
touch ${PROGRESS_FILE}
echo "********************************************************"
echo "*             Installation des dépendances             *"
echo "********************************************************"
echo 0 > ${PROGRESS_FILE}
echo "***** Commande: ajout domaine SpeedTest dans le security.conf d'Apache **********"
cp /etc/apache2/conf-available/security.conf /etc/apache2/conf-available/security.conf.old
sudo sed -i "s/img-src 'self'/& *.speedtest.net/" /etc/apache2/conf-available/security.conf
sudo systemctl restart apache2
echo 100 > ${PROGRESS_FILE}
echo "********************************************************"
echo "*             Installation terminée                    *"
echo "********************************************************"
rm ${PROGRESS_FILE}
