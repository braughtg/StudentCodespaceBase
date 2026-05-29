#!/bin/bash

source "/workspaces/StudentCodespaceBase/.devcontainer/lib.bash"

checkNoVNC
NOVNC=$?
if ((!NOVNC)); then
  echo ""
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo "The noVNC server is not running."
  echo ""
  echo "You will not be able to access the GUI Desktop."
  echo "Try stopping and restarting the codespace."
  echo "If that does not work try creating a new one."
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo ""
else
  echo "noVNC: http://localhost:6901"
  echo ""
  echo "*******************"
  echo "Codespace is ready!"
  echo "*******************"

  # Generate output to the terminal every 5 minutes
  # to keep the codespace from timing out while working
  # in the fluxbox desktop.
  while true; do
    sleep 300
    echo "Heartbeat: $(date)"
  done
fi