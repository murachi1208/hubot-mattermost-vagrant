# hubot-mattermost-vagrant
Hubot + Mattermost Sample for Vagrant (VirtualBox + CentOS 7.2.x)

# Usage

## start

```
vagrant up
```

## edit your settings and apply

```
$ vi ~/.bash_profile
---
export MATTERMOST_TOKEN={YOUR_OUTGOING_WEBHOOKS_TOKEN}
export MATTERMOST_INCOME_URL={YOUR_INCOMING_WEBHOOKS_URL}
---

$ source ~/.bash_profileb            # DONT forget!!
```

## run

```
$ cd matter-bot
$ bin/hubot -a mattermost
```
