#!/bin/bash

#information
COIN_NAME='zelcash'
COIN_DAEMON='zelcashd'
COIN_CLI='zelcash-cli'
COIN_PATH='/usr/local/bin'
#end of required details

# add to path
PATH=$PATH:"$COIN_PATH"
export PATH

#Closing zelcash daemon and purge apt package
sudo systemctl stop "$COIN_NAME" && sleep 3
"$COIN_CLI" stop >/dev/null 2>&1 && sleep 3
sudo killall "$COIN_DAEMON" >/dev/null 2>&1
sudo rm "$COIN_PATH/$COIN_NAME"* >/dev/null 2>&1 && sleep 1
sudo apt-get purge "$COIN_NAME" -y >/dev/null 2>&1 && sleep 1
sudo killall -s SIGKILL zelbenchd >/dev/null 2>&1 && sleep 1
sudo rm /etc/apt/sources.list.d/zelcash.list >/dev/null 2>&1 && sleep 1

#Install zelcash apt package
echo 'deb https://apt.zel.network/ all main' | sudo tee /etc/apt/sources.list.d/zelcash.list
gpg --keyserver keyserver.ubuntu.com --recv 4B69CA27A986265D
gpg --export 4B69CA27A986265D | sudo apt-key add -
sudo apt-get update
sudo apt-get install "$COIN_NAME" -y
sudo chmod 755 "$COIN_PATH/$COIN_NAME"* && sleep 2
if ! gpg --list-keys Zel >/dev/null; then
  gpg --keyserver na.pool.sks-keyservers.net --recv 4B69CA27A986265D
  gpg --export 4B69CA27A986265D | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install "$COIN_NAME" -y
  sudo chmod 755 "$COIN_PATH/$COIN_NAME"* && sleep 2
  if ! gpg --list-keys Zel >/dev/null; then
    gpg --keyserver eu.pool.sks-keyservers.net --recv 4B69CA27A986265D
    gpg --export 4B69CA27A986265D | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install "$COIN_NAME" -y
    sudo chmod 755 "$COIN_PATH/$COIN_NAME"* && sleep 2
    if ! gpg --list-keys Zel >/dev/null; then
      gpg --keyserver pgpkeys.urown.net --recv 4B69CA27A986265D
      gpg --export 4B69CA27A986265D | sudo apt-key add -
      sudo apt-get update
      sudo apt-get install "$COIN_NAME" -y
      sudo chmod 755 "$COIN_PATH/$COIN_NAME"* && sleep 2
      if ! gpg --list-keys Zel >/dev/null; then
        gpg --keyserver keys.gnupg.net --recv 4B69CA27A986265D
        gpg --export 4B69CA27A986265D | sudo apt-key add -
        sudo apt-get update
        sudo apt-get install "$COIN_NAME" -y
        sudo chmod 755 "$COIN_PATH/$COIN_NAME"* && sleep 2
      fi
    fi
  fi
fi

if sudo systemctl list-units --full --no-legend --no-pager --plain --all --type service "$COIN_NAME.service" | grep -Foq "$COIN_NAME.service"; then
  sudo systemctl start "$COIN_NAME"
else
  "$COIN_DAEMON"
fi
