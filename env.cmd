pushd %~dp0
set SCRIPT_DIR=%CD%
popd

set ZEPPELIN_INTP_MEMORY=4
set ZEPPELIN_ROOT_DIR=%SCRIPT_DIR%\zeppelin

set ZEPPELIN_PORT=8080
set SPARK_UI_PORT=4080
