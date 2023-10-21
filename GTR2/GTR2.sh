#!/usr/bin/env bash

set -eo pipefail

# TODO:
# Find out which wheel/joystick is connected - DONE
# , and copy over given PLR - DONE
# , and probably start oversteer as well - DONE ? ToBeTested

# Check connected stuff

test_usb() {
  IS_G29=$(lsusb | grep "Logitech, Inc. G29 Driving Force" || true | wc -l)
  IS_JOY=$(lsusb | grep "GreenAsia Inc." || true | wc -l)
  if [ ${IS_G29} == 1 ]; then
    USB="G29"
  elif [ ${IS_JOY} == 1 ]; then
    USB="JOY"
  else
    USB="KEY"
  fi
  
}

adapt_controller() {
  awk 'NR < 0 { next } { print } NR == 537 { exit }' ${INSTALLDIR}/UserData/${USER}/${USER}.PLR > ${CONTROLLERS}/GENERATED.PLR
  awk 'NR < 538 { next } { print } NR == 10000 { exit }' ${CONTROLLERS}/${USB}.PLR >> ${CONTROLLERS}/GENERATED.PLR
  cp ${INSTALLDIR}/UserData/${USER}/${USER}.PLR.bck2 ${INSTALLDIR}/UserData/${USER}/${USER}.PLR.bck3
  cp ${INSTALLDIR}/UserData/${USER}/${USER}.PLR.bck ${INSTALLDIR}/UserData/${USER}/${USER}.PLR.bck2
  cp ${INSTALLDIR}/UserData/${USER}/${USER}.PLR ${INSTALLDIR}/UserData/${USER}/${USER}.PLR.bck
  cp ${CONTROLLERS}/GENERATED.PLR ${INSTALLDIR}/UserData/${USER}/${USER}.PLR
}

run() {
  cd $HOME/Software/GTR2CC
  if [ $"{USB}" == "G29" ]; then
    sudo oversteer
  fi
  wine GTR2.exe
}

get_controller() {
  cp ${CONTROLLERS}/${USB}.PLR ${CONTROLLERS}/${USB}.PLR.ORIG
  awk 'NR < 538 { next } { print } NR == 10000 { exit }' ${INSTALLDIR}/UserData/${USER}/${USER}.PLR > ${CONTROLLERS}/${USB}.PLR
}


source ./env
CONTROLLERS="${AUXDIR}/controllers"
test_usb
adapt_controller
run
get_controller
