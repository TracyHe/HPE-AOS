#!/bin/bash

#modifies internal_config_for_env.properties file with update host, login, password and action for the services of AOS
#action can be create, create-drop, update, validate
#it is very simple script and ORDER MATTERS

#Example: create.sh myHost myLogin myPassword create
#The above line will change file found in 'accountservice' 'catalog' 'order' service for AOS

for serviceName in MasterCredit SafePay accountservice catalog order
do
    fp="webapps/$serviceName/WEB-INF/classes/properties/internal_config_for_env.properties"

    sed "s/hibernate.db.url.host=.*/hibernate.db.url.host=$1/" $fp |sed "s/hibernate.db.url.port=.*/hibernate.db.url.port=$2/" |sed "s/hibernate.db.login=.*/hibernate.url.login=$3/" | sed "s/hibernate.db.password=.*/hibernate.db.password=$4/" |sed "s/hibernate.db.hbm2ddlAuto=.*/hibernate.db.hbm2ddlAuto=$5/" > "$fp.new"
    mv -f "$fp.new" "$fp"
done
