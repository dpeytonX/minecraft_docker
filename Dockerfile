FROM ubuntu:kinetic

ARG MINECRAFT_ARCHIVE=bedrock-server-1.19.72.01.zip
RUN apt update && apt install -y unzip libcurl4 && useradd -mU minecraft

USER 1000:1000
COPY $MINECRAFT_ARCHIVE /home/minecraft/
WORKDIR /home/minecraft
RUN unzip $MINECRAFT_ARCHIVE && rm server.properties \
 && ln -s mnt/server.properties \
 && rm allowlist.json \
 && ln -s mnt/allowlist.json \
 && rm permissions.json \
 && ln -s mnt/permissions.json \
 && ln -s mnt/worlds


EXPOSE 19132
CMD /home/minecraft/bedrock_server
