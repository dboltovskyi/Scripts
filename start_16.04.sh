#!/usr/bin/env bash
HOST_SRC_FOLDER=~/workspace/0
HOST_WORK_FOLDER=~/workspace/$1
CONTAINER_WORK_FOLDER=/home/developer/sdl
REPORT_FOLDER=~/ramdrv/TestingReports

if [ ! -d $REPORT_FOLDER/WS_$1 ] ; then
  mkdir $REPORT_FOLDER/WS_$1
fi

docker run \
  -it \
  --rm \
  --cap-add NET_ADMIN \
  -e LOCAL_USER_ID=$(id -u) \
  -v $HOST_WORK_FOLDER:$CONTAINER_WORK_FOLDER \
  -v $HOST_SRC_FOLDER/sdl_core:$CONTAINER_WORK_FOLDER/sdl_core \
  -v ~/workspace/0/3rd_party:$CONTAINER_WORK_FOLDER/3rd_party \
  -v $REPORT_FOLDER/WS_$1:$CONTAINER_WORK_FOLDER/TestingReports \
  -v $HOST_SRC_FOLDER/sdl_atf_test_scripts:$CONTAINER_WORK_FOLDER/sdl_atf_test_scripts \
  ubuntu_16.04:01
