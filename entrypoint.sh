#!/bin/bash

TRIFECTA_CONFIG="$1"

# Setup trifecta configuration
if [ -z ${ZK_HOST+x} ];
then
  echo "Zookeeper host not set, using localhost";
  sed -i -e s/{{ZK_HOST}}/localhost/ "$TRIFECTA_CONFIG"
else
  echo "Using Zookeeper host: '$ZK_HOST'";
  sed -i -e s/{{ZK_HOST}}/${ZK_HOST}/ "$TRIFECTA_CONFIG"
fi

# Start ui
/home/trifecta/trifecta_ui/bin/trifecta_ui
