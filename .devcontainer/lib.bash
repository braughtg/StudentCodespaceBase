# A collection of functions that check if the
# services that make up the FarmData2 development
# environment are up and running.
#
# Each of the functions returns:
#  - 1 if the service is running.
#  - 0 if the service is not running.
#
# A typical use will be something like:
#   checkPostgres; POSTGRES=$?
#   checkFarmOS; FARMOS=$?
#   checkDocs; DOCS=$?
#   checkNoVNC; NOVNC=$?
#   READY=$(( POSTGRES && FARMOS && DOCS && NOVNC ))
#   if (( ! READY )); then
#     echo "Servers are running."
#   fi

function checkService {
  SERVICE_NAME=$1
  CHECK_COMMAND=$2
  OK_RESULT=$3
  MAX_TRIES=$4
  TRIES=0

  echo -n "Checking for $SERVICE_NAME "
  echo -n "."
  RESP=$(eval "$CHECK_COMMAND 2> /dev/null" | grep "$OK_RESULT")
  while [ "$RESP" == "" ] && [ $TRIES -lt "$MAX_TRIES" ]; do
    sleep 1
    echo -n "."
    RESP=$(eval "$CHECK_COMMAND 2> /dev/null" | grep -E "$OK_RESULT")
    ((TRIES++))
  done

  if [ "$RESP" == "" ]; then
    echo " not found."
    return 0
  else
    echo " running."
    return 1
  fi
}

function checkDocker {
  checkService docker "docker ps" "CONTAINER ID" 30
  return $?
}

function checkNoVNC {
  checkService noVNC "curl -Is localhost:6901" "HTTP/1.1 200 OK" 30
  return $?
}