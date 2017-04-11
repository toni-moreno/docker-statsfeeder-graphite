#!/bin/bash

set -e -x
[ -d ./statsfeeder ] || mkdir statsfeeder
unzip  StatsFeeder-4.1.697.zip -d statsfeeder
docker build --rm -t tonimoreno/statsfeeder-graphite:latest -t tonimoreno/statsfeeder-graphite:4.1 .
rm -rf statsfeeder 

