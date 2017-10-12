#!/usr/bin/env bash

function start {

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

}

function stop {

docker-compose stop

}

function help {
echo "help"
}


source ./env.sh

# Parse long options
for arg in "$@"; do
  shift
  case "$arg" in
    "--help") set -- "$@" "-h" ;;
    "--start")set -- "$@" "-r" ;;
    "--stop") set -- "$@" "-s" ;;
    "?") set -- "$@" "-?" ;;
    *)        set -- "$@" "$arg"
  esac
done

# Parse short options
OPTIND=1
while getopts "hrs?" opt; do
  case "$opt" in
    "h") help; exit 0 ;;
    "r") start ;;
    "s") stop ;;
    "?") help exit 0 ;;
  esac
done
shift $(expr $OPTIND - 1) # remove options from positional parameters



