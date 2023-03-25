#!/bin/bash

HOST_MOUNT="$1"
wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.72.01.zip
./build.sh "$HOST_MOUNT"
