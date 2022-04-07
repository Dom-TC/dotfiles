#!/usr/bin/env zsh

# I never remember the screen command to connect to serial devices.
# This is a nicer way of connecting

# Command Prefix
  prefix="[Serial] "

# Colours
  RED="\033[1;31m"
  GREEN="\033[1;32m"
  YELLOW="\033[1;33m"
  NOCOLOR="\033[0m"

# List available devices
  # devices=$(ls /dev/tty.*)
  # devices=$(ls)
  devices=(${(f)"$(ls /dev/tty.*)"})

  echo $GREEN$prefix"Pick a device"$NOCOLOR

  deviceNum=0
  for device in $devices
  do
      (( deviceNum = deviceNum + 1 ))
      echo $NOCOLOR$deviceNum" "$device$YELLOW
  done

  # echo $YELLOW
  read "deviceID?"$prefix"Which device would you like to use? (1-"$deviceNum") "

  if [[ ! $deviceID =~ [0-9] ]]; then
    echo $RED$prefix$deviceID" must be a number."$NOCOLOR
    exit
  fi

  if [[ $deviceID -gt $deviceNum || $deviceID -lt 1 ]]; then
    echo $RED$prefix$deviceID" must be between 1 and $deviceNum."$NOCOLOR
    exit
  fi

#  Get selected device
  selectedDevice=$devices[$deviceID]

  echo $NOCOLOR$prefix"Connecting to "$selectedDevice"..."$NOCOLOR
  echo $NOCOLOR$prefix"To exit, press \`CTRL+a+k\` to exit."$NOCOLOR

  sleep 2

  screen $selectedDevice 9600
