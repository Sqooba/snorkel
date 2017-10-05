#!/usr/bin/env bash

MEMORY=8

OS="$(uname -s)"
if [[ $OS == 'Linux' ]]; then
   TOTAL_MEMORY=$(awk '/^MemTotal:/{print $2}' /proc/meminfo)
   MEMORY=$(($TOTAL_MEMORY/1048576))
   CPUS=$(nproc --all)
elif [[ $OS == 'Darwin' ]]; then
   TOTAL_MEMORY=$(sysctl -n hw.memsize)
   MEMORY=$(($TOTAL_MEMORY/1073741824))
   CPUS=$(sysctl -n hw.ncpu)
fi

INTEPRETER_MEMORY=$((MEMORY/2))
ZEPPELIN_INTP_MEMORY=${ZEPPELIN_INTP_MEMORY:--Xmx${INTEPRETER_MEMORY}g}

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ZEPPELIN_ROOT_DIR=${ZEPPELIN_ROOT_DIR:-$SCRIPT_DIR/zeppelin}

export ZEPPELIN_PORT=${ZEPPELIN_PORT:-8080}
export SPARK_UI_PORT=${SPARK_UI_PORT:-4080}