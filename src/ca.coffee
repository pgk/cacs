


class CASimulator

  rule:
    '111': 0
    '110': 1
    '101': 1
    '100': 0
    '011': 1
    '010': 1
    '001': 1
    '000': 0

  constructor: (o={}) ->
    @len =  if o.len? then o.len else 10
    @seed = if o.seed? then o.seed else @_initSeed()
    @_initState()

  next: ->
    [oldState, pos] = [(i for i in @state), 0]

    while pos < @len
      m = oldState[pos]
      l = if pos > 0 then oldState[pos - 1] else oldState[@len - 1]
      r = if pos < @len - 1 then oldState[pos + 1] else oldState[0]
      @state[pos] = @rule[[l,m,r].join('')]
      pos++

    @state

  _initState: ->
    @state = []
    @state.push(i) for i in @seed
    @

  _initSeed: ->
    (Math.round(Math.random()) for i in [0...@len])


module?.exports = CASimulator
