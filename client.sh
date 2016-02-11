#!/bin/sh
docker run -i -t --link stormdocker_nimbus_1:nimbus  undeadops/storm /bin/bash
