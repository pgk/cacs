
CASimulator = require './../src/ca'

itShouldOutput = (opts) ->
	output = opts.pattern
	input = opts.forPattern
	it "gives correct pattern for #{input}", ->
		ca = new CASimulator seed: input
		ca.next().should.deep.eq output

describe 'CASimulator', ->

	describe '#constructor', ->

		it 'assigns seed if exists', ->
			(new CASimulator len: 3, seed: [1, 0 ,1]).seed.should.deep.eq [1, 0, 1]

		it 'derives length from seed if exists', ->
			(new CASimulator seed: [1,2,3]).len.should.eq 3

		it 'defaults length to 10 if no len or seed given', ->
			(new CASimulator).len.should.eq 10

		it 'assigns len if given', ->
			(new CASimulator len: 20).len.should.eq 20

	describe '#next with rule 110', ->
		itShouldOutput pattern: [1,1,0], forPattern: [0,1,0]
		itShouldOutput pattern: [1,1,1], forPattern: [1,1,0]
		itShouldOutput pattern: [0,0,0], forPattern: [1,1,1]
		itShouldOutput pattern: [0,0,0], forPattern: [0,0,0]

	describe '#reset', ->

		it 'changes the length if provided', ->
			ca = new CASimulator len: 3
			ca.reset len: 4
			ca.len.should.eq 4

		it 'changes the initial state', ->
			ca = new CASimulator len: 3, seed:[4,8,0]
			ca.reset()
			ca.state.should.not.deep.eq [4,8,0]

		it 'preserves given length', ->
			ca = new CASimulator len: 20
			ca.reset().len.should.eq 20

	describe '#setRule', ->

		it 'uses the new rule to calculate next steps', ->
			ca = new CASimulator len: 3, seed:[0,1,0]
			ca.setRule '00011110'
			ca.next().should.deep.eq [1,1,1]
