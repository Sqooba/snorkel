#!/usr/bin/env bash

echo "Refreshing javascript dependencies"
docker exec -it zeppelinstarter_zeppelin-starter_1 install-js.sh

echo "Refreshing python dependencies"
docker exec -it zeppelinstarter_zeppelin-starter_1 install-python.sh

echo "Finished!!!"