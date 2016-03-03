#!/bin/sh

HUBOT_OWNER=user@example.com
HUBOT_NAME=matter-bot
HUBOT_DESCRIPTION=sample

# setup node.js(by NVM)
yum upgrade -y
yum groupinstall -y "Development Tools"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
source ~/.bashrc
nvm install stable
nvm alias default stable

# @see https://www.npmjs.com/package/hubot-mattermost
# install hubot
npm install -g yo generator-hubot

# generate hubot
mkdir ${HUBOT_NAME} && cd ${HUBOT_NAME}
yo hubot --adapter mattermost --owner=${HUBOT_OWNER} --name=${HUBOT_NAME} --description=${HUBOT_DESCRIPTION}
cp /vagrant/hubot/scripts/sample.coffee scripts/sample.coffee

# add ~/.bash_profile
cat << MATTERMOST_HUBOT_ENV >> ~/.bash_profile
export PORT=18080
export MATTERMOST_ENDPOINT=/hubot/incoming
export MATTERMOST_TOKEN={YOUR_OUTGOING_WEBHOOKS_TOKEN}
export MATTERMOST_INCOME_URL={YOUR_INCOMING_WEBHOOKS_URL}
export MATTERMOST_HUBOT_USERNAME=matter-bot
export MATTERMOST_ICON_URL=https://s3-eu-west-1.amazonaws.com/renanvicente/toy13.png
MATTERMOST_HUBOT_ENV
source ~/.bash_profile

# run
# bin/hubot -a mattermost

# npm install -g forever
# forever start -c coffee node_modules/.bin/hubot -a mattermost

echo 'complete!!'
