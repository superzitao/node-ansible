#!/bin/bash
set -e

pwd=`pwd` 

sed  -i 's@\/home\/prometheus.yml@'"$pwd"'\/prometheus.yml@g'  docker-compose.yaml
