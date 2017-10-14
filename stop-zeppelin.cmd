@ECHO OFF

pushd %~dp0
call env.cmd
docker-compose stop
popd

echo "Zeppelin stopped"

@pause
