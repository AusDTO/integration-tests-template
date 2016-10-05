#!/bin/bash

set -eu # please dont use -x as this will print secrets in the build log

echo "deleting apps"
cf apps |grep -oE 'int-tests-.*-[0-9]{10}'

for cf_application in `cf apps |grep -oE 'int-tests-.*-[0-9]{10}' |awk '{print $1}'`
do
  cf delete $cf_application -f
done

echo "deleting services"
cf services | grep -oE 'int-tests-.*-[0-9]{10}'

for cf_service in `cf services | grep -oE 'int-tests-.*-[0-9]{10}' |awk '{print $1}'`
do
  cf delete-service $cf_service -f
  sleep 3
done
