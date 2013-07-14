
RULESET = ['111', '110', '101', '100', '011', '010', '001', '000']

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
    @reset o

  next: ->
    [oldState, pos] = [(i for i in @state), 0]

    while pos < @len
      m = oldState[pos]
      l = if pos > 0 then oldState[pos - 1] else oldState[@len - 1]
      r = if pos < @len - 1 then oldState[pos + 1] else oldState[0]
      @state[pos] = @rule[[l,m,r].join('')]
      pos++

    @state

  reset: (o={}) ->
    if o.seed?
      @len = o.seed.length
      @seed = o.seed
    else
      @len = if o.len? then o.len else @len || 10
      @seed = @_initSeed()

    @_initState()

  setRule: (rule) ->
    rules = rule.split('')
    for ruleKey, i in RULESET
      @rule[ruleKey] = parseInt(rules[i])
    @


  _initState: ->
    @state = []
    @state.push(i) for i in @seed
    @

  _initSeed: ->
    (Math.round(Math.random()) for i in [0...@len])


module?.exports = CASimulator
