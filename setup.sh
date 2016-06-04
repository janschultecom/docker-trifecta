#!/bin/bash
if [ -z ${ZK_HOST+x} ];
then
  echo "Zookeeper host not set, using localhost";
  sed -i -e s/{{ZK_HOST}}/localhost/ config.properties
else
  echo "Using Zookeeper host: '$ZK_HOST'";
  sed -i -e s/{{ZK_HOST}}/${ZK_HOST}/ config.properties
fi
