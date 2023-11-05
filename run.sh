#!/bin/bash

IP=$(ifconfig en1 | grep inet | awk '$1=="inet" {print $2}')
xhost +
xhost + "$IP"

docker run -e DISPLAY="${IP}:0" jmeter-gui
