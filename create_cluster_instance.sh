#!/bin/sh

set -e
asadmin start-domain
# Crear el clúster
asadmin create-cluster dgsisan

# Crear las instancias
asadmin create-instance --node localhost-domain1 --cluster dgsisan instance1
asadmin create-instance --node localhost-domain1 --cluster dgsisan instance2
asadmin create-instance --node localhost-domain1 --cluster dgsisan instance3
