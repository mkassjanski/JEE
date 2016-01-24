#!/bin/sh

echo 
../glassfish3/glassfish/bin/asadmin undeploy dziennik
echo 
mvn package
echo 
../glassfish3/glassfish/bin/asadmin deploy target/dziennik.war
