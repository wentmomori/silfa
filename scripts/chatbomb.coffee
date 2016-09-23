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
  time=0
  robot.respond /(.*)に進捗報告させて/i, (res) ->
    time=10
    bye = false
    res.send "#{res.match[1]} 。進捗報告するのれす!"
    run = () ->
      if time > 1 
        res.send "#{res.match[1]} 。進捗報告するのれす!"
        time=time/2
        setTimeout(run , 1000*time)
      else 
        bye = true
        return
    if bye is false 
      setTimeout(run , 1000*time)
  robot.respond /止めて/, (res) ->
    if time > 1 
      res.send "分かったのれす!"
      time =0
    else
      res.send "なんのことれすか?"
