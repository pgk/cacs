
CASimulator = require './../src/ca'

console.log global.should

describe 'CASimulator', ->

	describe '#new', ->

		it 'assigns seed if exists', ->
			(new CASimulator len: 3, seed: [1, 0 ,1]).seed.should.deep.eq [1, 0, 1]

	describe '#next with rule 110', ->

		it 'gives correct pattern for [0,1,0]', ->
			ca = new CASimulator len: 3, seed: [0,1,0]
			ca.next().should.deep.eq [1,1,0]

		it 'gives correct pattern for [1,1,0]', ->
			ca = new CASimulator len: 3, seed: [1,1,0]
			ca.next().should.deep.eq [1,1,1]

	describe '#reset', ->

		it 'changes the length if provided', ->
			ca = new CASimulator len: 3
			ca.reset len: 4
			ca.len.should.eq 4

		it 'changes the initial state', ->
			ca = new CASimulator len: 3, seed:[4,8,0]
			ca.reset()
			ca.state.should.not.deep.eq [4,8,0]

	describe '#setRule', ->

		it 'uses the new rule to calculate next steps', ->
			ca = new CASimulator len: 3, seed:[0,1,0]
			ca.setRule '00011110'
			ca.next().should.deep.eq [1,1,1]
