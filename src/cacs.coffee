
[inlets, outlets] = [1, 1]

ca = new CASimulator len: 19

bang = ->
  outlet 0, (parseInt(i * 255) for i in ca.next())

setlength = (length) ->
  ca.reset len: length