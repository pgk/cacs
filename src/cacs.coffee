
[inlets, outlets] = [1, 1]

ca = new CASimulator len: 3

bang = ->
  outlet 0, ca.next()