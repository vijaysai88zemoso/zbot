# Description:
#   Loaded all current environment variables from redis to process.env when bootstrapping hubot

brain_key = "zebot"

module.exports = (robot) ->
  console.log("Inside bootstrap")
  storageLoaded = =>
    loaded = robot.brain.get(brain_key)
    console.log("Loaded" + loaded);
    unless loaded
      console.log "zebot env bootstrap did nothing against empty data in redis"
      return

    for key, value of loaded.env
      process.env[key] = value
      console.log "zebot env bootstrap loaded #{key} => #{value}"

  robot.brain.once "loaded", storageLoaded
