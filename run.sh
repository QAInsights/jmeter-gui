#!/bin/bash

# author: NaveenKumar Namachivayam
# usage : ./run.sh

# Add -h option to display help
if [ "$1" == "-h" ]; then
  echo "Usage: ./run.sh [OPTION]"
  exit 0
fi

# Check if XQuartz is installed
if ! [ -x "$(command -v xquartz)" ]; then
  echo 'Error: XQuartz is not installed.' >&2
  exit 1
fi

# Check if docker is installed 
if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi

# Check xhost is installed
if ! [ -x "$(command -v xhost)" ]; then
  echo 'Error: xhost is not installed.' >&2
  exit 1
fi

# Get IP address of host
IP=$(ifconfig en1 | grep inet | awk '$1=="inet" {print $2}')

# Allow connections from host
xhost +
xhost + "$IP"

docker run -e DISPLAY="${IP}:0" jmeter-gui
