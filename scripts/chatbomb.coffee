# Description
#   A hubot script that does the things
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   went

# Description:
#   enter leave

module.exports = (robot) ->
  time=3600
  stopflg=0
  startflg=0
  robot.respond /(.*)に進捗報告させて/i, (res) ->
    startflg=1
    run = () ->
      if time > 1 and stopflg is 0
        res.send "#{res.match[1]} 。進捗報告するのれす!"
        time=time/2
        setTimeout(run, 1000*time)
    setTimeout(run, 1000)
    
  robot.respond /止めて/, (res) ->
    if startflg is 1
      stopflg = 1
      res.send "分かったのれす"
      time=3600
    else
      res.send "なんのことれすか?"
