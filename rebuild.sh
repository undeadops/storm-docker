#!/bin/bash

docker build -t="undeadops/storm:0.9.4" storm
docker build -t="undeadops/storm-nimbus:0.9.4" storm-nimbus
docker build -t="undeadops/storm-supervisor:0.9.4" storm-supervisor
docker build -t="undeadops/storm-ui:0.9.4" storm-ui
