#!/usr/bin/env bash

# NAME
#    zeppelin.sh - controls snorkel-zeppelin docker image
#
# SYNOPSIS
#    zeppelin.sh [-]
#
# DESCRIPTION
#    zeppelin.sh controls the zeppelin docker image in snorkel
#    the script takes exactly one argument
#
# ARGUMENTS
#    -h/-?  | --help    Displays help
#    -r     | --start   Starts zeppelin
#    -s     | --stop    Stops zeppelin
#    -f     | --refresh Refresh dependencies


function start {

echo "Starting snorkel..."

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

echo "Stopping snorkel..."
docker-compose stop
echo "Snorkel stopped"

}

function refresh {

echo "Refreshing javascript dependencies"
docker exec -it zeppelinstarter_zeppelin-starter_1 install-js.sh

echo "Refreshing python dependencies"
docker exec -it zeppelinstarter_zeppelin-starter_1 install-python.sh

echo "Finished!!!"

}

function help {
echo "Usage: ${0} arg"
echo "  Where arg is exactly one argument."
echo
echo "Arguments:"
echo "  -h/-?  | --help    Displays help"
echo "  -r     | --start   Starts zeppelin"
echo "  -s     | --stop    Stops zeppelin "
echo "  -f     | --refresh Refresh dependencies"

}

if [ ! $# -eq 1 ]; then
    echo "${0} takes exactly 1 argument."
    help
    exit 1
fi

source ./env.sh

# Parse long options
for arg in "$@"; do
  shift
  case "$arg" in
    "--help") set -- "$@" "-h" ;;
    "--start")set -- "$@" "-r" ;;
    "--stop") set -- "$@" "-s" ;;
    "--refresh") set -- "$@" "-f" ;;
    "?") set -- "$@" "-?" ;;
    *)        set -- "$@" "$arg"
  esac
done

# Parse short options
OPTIND=1
while getopts "fhrs?" opt; do
  case "$opt" in
    "h") help; exit 0 ;;
    "r") start ;;
    "s") stop ;;
    "f") refresh ;;
    "?") help exit 0 ;;
  esac
done
shift $(expr $OPTIND - 1) # remove options from positional parameters



