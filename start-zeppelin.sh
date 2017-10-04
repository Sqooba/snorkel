#!/usr/bin/env bash

source ./env.sh

docker-compose up -d

echo
echo "========== Sqooba Snorkeling Toolset =========="
echo
echo "Zeppelin and Spark are starting ... might take some time ..."
echo
echo "Zeppelin: http://localhost:${ZEPPELIN_PORT}"
echo "Spark:    http://localhost:${SPARK_UI_PORT} -- after you run your first notebook."
echo
echo "Upload your data in ${ZEPPELIN_ROOT_DIR}/data"
echo "Spark logs are stored in ${ZEPPELIN_ROOT_DIR}/logs"
echo "Your notebooks are stored in ${ZEPPELIN_ROOT_DIR}/notebooks"
echo
echo "Run $(dirname $0)/refresh.sh to update js/css/python dependencies"
echo
echo "========== Happy Snorkeling ! =========="
