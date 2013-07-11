fs     = require 'fs'
{exec} = require 'child_process'
util   = require 'util'


task 'cajs:build', 'Build cajs max Javascript External', ->
  util.log "Building cajs"
  exec "coffee --bare --output patches --compile src/ca.coffee"
    , (err, stdout, stderr) ->
    if err?
      util.log err
    else
      util.log "Compiled cacs"

REPORTER = "min"

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

