FROM ubuntu:14.04
RUN apt-get update
RUN apt-get -y install expect nodejs npm
run ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g coffee-script
RUN npm install -g yo generator-hubot

# create hubot user
RUN useradd -d /hubot -m -s /bin/bash -U hubot

# log in as hubot user and change directory
USER	hubot
WORKDIR /hubot

# install hubot
RUN yo hubot --owner="trriplejay" --name="botler" --description"imperialchat's counterpart" --defaults

# run hubot
CMD bin/hubot
