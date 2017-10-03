#!/usr/bin/env bash

echo "Refreshing javascript dependencies"
docker exec zeppelin install-js.sh

echo "Refreshing python dependencies"
docker exec zeppelin install-python.sh

echo "Please restart your zeppelin interpreters"