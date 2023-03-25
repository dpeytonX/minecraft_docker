#!/bin/bash
export MINECRAFT_PORT=19132
export MINECRAFT_VERSION='1.19.72'

HOST_PORT=19132
HOST_MOUNT_DIR=${1:-"`pwd`/mnt"}

docker image build -t minecraft:$MINECRAFT_VERSION .
docker container stop minecraft-container
docker container rm minecraft-container
docker container create --name minecraft-container -p$MINECRAFT_PORT:$HOST_PORT/udp -v"$HOST_MOUNT_DIR":/home/minecraft/mnt  minecraft:$MINECRAFT_VERSION
