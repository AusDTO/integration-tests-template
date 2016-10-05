#!/bin/bash

set -eu # please dont use -x as this will print secrets in the build log

cf apps

cf services
