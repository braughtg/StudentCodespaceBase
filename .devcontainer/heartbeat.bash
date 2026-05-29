#!/bin/bash

# Generate output to the terminal every 5 minutes
# to keep the codespace from timing out while working
# in the fluxbox desktop.
while true; do
  echo "Heartbeat: $(date)"
  sleep 300
done