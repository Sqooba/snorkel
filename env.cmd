@echo off

pushd %~dp0
set SCRIPT_DIR=%CD%
popd

:: find available RAM
set memory=4
for /f "skip=1" %%p in ('wmic os get freephysicalmemory') do (
  set /a memory=%%p/1048576/2
  goto :done
)
:done

set ZEPPELIN_INTP_MEMORY=-Xmx%memory%g
set ZEPPELIN_ROOT_DIR=%SCRIPT_DIR%\zeppelin
set ZEPPELIN_PORT=8080
set SPARK_UI_PORT=4080
