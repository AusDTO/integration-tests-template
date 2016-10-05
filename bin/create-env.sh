#!/bin/bash

set -eu

DATE_STAMP=`date +%s`
git submodule sync
git submodule update --recursive --init

cf create-service dto-shared-pgsql shared-psql int-tests-cf-pgsql-sample-app-db-$DATE_STAMP

sed -e "s/DATE_STAMP_TOKEN/$DATE_STAMP/" manifest.yml > manifest-deployment.yml

cf push -f manifest-deployment.yml -no-start
cf bind-service int-tests-cf-pgsql-sample-app-$DATE_STAMP int-tests-cf-pgsql-sample-app-db-$DATE_STAMP
cf push -f manifest-deployment.yml
