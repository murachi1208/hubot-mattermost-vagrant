# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot die - End hubot process

child_process = require 'child_process'

module.exports = (robot) ->
  robot.hear /badger/i, (res) ->
    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

  robot.respond /open the pod bay doors/i, (res) ->
    res.reply "I'm afraid I can't let you do that."

  robot.hear /I like pie/i, (res) ->
    res.emote "makes a freshly baked pie"

  robot.respond /PING$/i, (msg) ->
    msg.send "PONG!"

  robot.hear /どこで使い方を習った？$/i, (msg) ->
    msg.send "説明書を読んだのよ"

  robot.hear /ビルドしな$/i, (msg) ->
    @exec = require('child_process').exec
    command = "curl -X POST -u bot:5f9a40a509031b79c2fa6af0d914c873 http://localhost:8080/job/sample/build"
    @exec command, (error, stdout, stderr)->
      if !error
        msg.send "Jenkins先生お願いします！"
      else
        msg.send "Jenkins先生が息をしてないわ"
