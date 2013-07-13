fs     = require 'fs'
{exec} = require 'child_process'
util   = require 'util'

OUTDIR = 'patches'

task 'build', 'Build cajs max Javascript External', ->
  util.log "Building cajs"
  exec "coffee --compile --bare --join cacs.js --output patches src/ca.coffee src/cacs.coffee"
    , (err, stdout, stderr) ->
      console.log stderr, stdout, err
      if err?
        util.log err
      else
        util.log "Compiled cacs"

REPORTER = "min"

task "clean", "Clean all build products", ->
  util.log "Cleaning cacs"
  i = exec "ls -alF"

  i.on 'close', (p)->
    util.log p 

task "test", "run tests", ->
  exec "NODE_ENV=test 
    ./node_modules/.bin/mocha 
    --compilers coffee:coffee-script
    --reporter min
    --require coffee-script 
    --require test/test_helper.coffee
    --colors
  ", (err, output) ->
    throw err if err
    console.log output

