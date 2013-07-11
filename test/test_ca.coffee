
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
