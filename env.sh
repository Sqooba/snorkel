#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ZEPPELIN_ROOT_DIR=${ZEPPELIN_ROOT_DIR:-$SCRIPT_DIR/zeppelin}

export ZEPPELIN_PORT=${ZEPPELIN_PORT:-8080}
export SPARK_UI_PORT=${SPARK_UI_PORT:-4080}