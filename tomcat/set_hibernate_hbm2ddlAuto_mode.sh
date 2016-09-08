#!/bin/bash

#modifies internal_config_for_env.properties file with update action for the services of AOS
#action can be create, create-drop, update, validate

#Example: set_hibernate_hbm2ddlAuto_mode.sh action
#The above line will change file found in 'accountservice' 'catalog' 'order' service for AOS

for serviceName in MasterCredit SafePay accountservice catalog order
do
    fp="webapps/$serviceName/WEB-INF/classes/properties/internal_config_for_env.properties"

    sed "s/db.hbm2ddlAuto=.*/db.hbm2ddlAuto=$1/" $fp > "$fp.new"
    mv -f "$fp.new" "$fp"
done


