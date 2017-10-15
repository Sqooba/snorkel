pushd %~dp0/zeppelin
docker build . -t sqooba/zeppelin-starter && (
  echo "image sqooba/zeppelin-starter built."
) || (
  echo "Building image failed."
  echo "A common problem is that you checked out the directory"
  echo "with CRLF (i.e. windows) line-ending."
  echo "Ensure that the scripts in zeppelin/bin have LF line-ending."
  echo.
  echo "If the problem persists, open an issue on the github repo."
)
popd



@pause
