FROM node:6.3.0
RUN apt-get update
RUN apt-get -y install expect 

RUN npm install -g hubot 
RUN npm install -g coffee-script 
RUN npm install -g yo 
RUN npm install -g generator-hubot

# create hubot user
RUN useradd -d /hubot -m -s /bin/bash -U hubot

# log in as hubot user and change directory
USER	hubot
WORKDIR /hubot

# install hubot
RUN yo hubot --owner="you" --name="botler" --description"chatbot" --defaults

RUN npm install --save hubot-slack && npm install

# run hubot
CMD bin/hubot
