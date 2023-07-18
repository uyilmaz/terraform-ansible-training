#! /bin/bash -x
sudo apt-get update
sudo apt-get install -y default-jre-headless wget
java --version
mkdir solr-installation && cd solr-installation
wget -O solr-9.2.1.tgz https://www.apache.org/dyn/closer.lua/solr/solr/9.2.1/solr-9.2.1.tgz?action=download
tar xzf solr-9.2.1.tgz solr-9.2.1/bin/install_solr_service.sh --strip-components=2
sudo bash ./install_solr_service.sh solr-9.2.1.tgz -i /opt -d /var/solr-data -u solr -s solr -p 8983 -n
sudo mv /etc/default/solr.in.sh ./solr.in.sh.backup


echo -e \
'SOLR_PID_DIR="/var/solr-data"\n'\
'SOLR_HOME="/var/solr-data/data"\n'\
'LOG4J_PROPS="/var/solr-data/log4j2.xml"\n'\
'SOLR_LOGS_DIR="/var/solr-data/logs"\n'\
'SOLR_OPTS="$SOLR_OPTS -Dlog4j2.formatMsgNoLookups=true"\n'\
'SOLR_JAVA_MEM="-Xms512m -Xmx512m"\n'\
'SOLR_PORT="8983"\n'\
'SOLR_TIMEZONE="UTC"\n'\
'SOLR_JETTY_HOST="0.0.0.0"\n'\
>> solr.in.sh

sudo mv ./solr.in.sh /etc/default/solr.in.sh
sudo chmod 0644 /etc/default/solr.in.sh

sudo swapoff -a
#echo 1 > /proc/sys/vm/swappiness
sudo service solr start