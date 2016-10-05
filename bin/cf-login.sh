#!/bin/bash

set -eu # please dont use -x as this will print secrets in the build log


# these env vars can be overridden by circle
CF_API=${CF_API_STAGING:-https://api.system.staging.digital.gov.au}
CF_ORG=${CF_ORG_STAGING:-dto}
CF_SPACE=${CF_SPACE_STAGING:-michaeltest}

cf api ${CF_API_STAGING}
cf auth ${CF_USER_STAGING} ${CF_PASSWORD_STAGING}
cf target -o ${CF_ORG_STAGING} -s ${CF_SPACE_STAGING}
