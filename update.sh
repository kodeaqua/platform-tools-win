#!/bin/bash
# This is script for upstreaming platform-tools version for Windows
# By kodeaqua

if ! [[ -d ./tmp ]];
then
    mkdir -p tmp
fi;

if ! [[ $(command -v wget) ]];
then
    sudo apt update && sudo apt install -y wget;
elif ! [[ $(command -v unzip) ]];
then
    sudo apt update && sudo apt install -y unzip;
fi;

latest="r33.0.1";

wget https://dl.google.com/android/repository/platform-tools_$latest-windows.zip -P ./tmp;

unzip -o ./tmp/platform-tools_$latest-windows.zip && mv -f ./tmp/platform-tools ../..;

rm -r ./tmp;

echo "platform-tools updated! enjoy~";
