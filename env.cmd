@echo off

pushd %~dp0
set SCRIPT_DIR=%CD%
popd

:: find available RAM
for /f "skip=1" %%p in ('wmic os get freephysicalmemory') do (
  set /a memory=%%p/1048576
  goto :done
)
:done

set /a ZEPPELIN_INTP_MEMORY=%memory%/2
set ZEPPELIN_ROOT_DIR=%SCRIPT_DIR%\zeppelin
set ZEPPELIN_PORT=8080
set SPARK_UI_PORT=4080
