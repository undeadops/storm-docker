#!/bin/bash

docker build -t="undeadops/storm" storm
docker build -t="undeadops/storm-nimbus" storm-nimbus
docker build -t="undeadops/storm-supervisor" storm-supervisor
docker build -t="undeadops/storm-ui" storm-ui
