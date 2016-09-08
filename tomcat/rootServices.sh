#!/bin/bash

#modifies $CATALINA_HOME/webapps/services.properties file with update host and port
#it is very simple script and ORDER MATTERS

#Example: rootServices.sh myHost myPort

fp="$CATALINA_HOME/webapps/ROOT/services.properties"

sed "s/url.host=.*/url.host=$1/" $fp |sed "s/url.port=.*/url.port=$2/" > "$fp.new"
mv -f "$fp.new" "$fp"

for serviceName in MasterCredit SafePay accountservice catalog order
do
    fp="webapps/$serviceName/WEB-INF/classes/properties/services.properties"

    sed "s/url.host=.*/url.host=$1/" $fp |sed "s/url.port=.*/url.port=$2/" > "$fp.new"
    mv -f "$fp.new" "$fp"
done

