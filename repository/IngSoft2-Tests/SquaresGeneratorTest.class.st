Class {
	#name : 'SquaresGeneratorTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test001WhenRandomFallsInNoEffectRangeThenAllGeneratedSquaresAreNoEffectSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 5
		random: 0.1
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
.

	squares := generator generate.

	self assert: squares size equals: 5.

	squares do: [ :square |
		self assert: square class equals: NoEffectSquare
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test002WhenRandomFallsInWormHoleRangeThenAllGeneratedSquaresAreWormHoleSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 4
		random: 0.5
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
.

	squares := generator generate.

	self assert: squares size equals: 4.

	squares do: [ :square |
		self assert: square class equals: WormHoleSquare
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test003WhenRandomFallsInSpeedUpRangeThenAllGeneratedSquaresAreSpeedUpSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 3
		random: 0.7
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
		.

	squares := generator generate.

	self assert: squares size equals: 3.

	squares do: [ :square |
		self assert: square class equals: SpeedUpSquare
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test004WhenRandomFallsInMoonWalkRangeThenAllGeneratedMoonWalkSquaresUseGivenN [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 2
		random: 0.85
		moonWalkN: 4
		hyperJumpParsecs: #(10 8 6 4)
		.

	squares := generator generate.

	self assert: squares size equals: 2.

	squares do: [ :square |
		self assert: square class equals: MoonWalkSquare.
		self assert: square distance equals: 4
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test005WhenRandomFallsInHyperJumpRangeThenAllGeneratedHyperJumpSquaresUseGivenParsecs [

	| generator squares parsecs |
	
	parsecs := { Parsec withValue:10 . Parsec withValue:8 .Parsec withValue:6 .Parsec withValue:4 } asOrderedCollection .

	generator := FixedSquaresGenerator
		withNumberOfSquares: 2
		random: 0.95
		moonWalkN: 3
		hyperJumpParsecs: parsecs
		.

	squares := generator generate.

	self assert: squares size equals: 2.

	squares do: [ :square |
		self assert: square class equals: HyperJumpSquare.
		self assert: square parsecs equals: {10 . 8 . 6 . 4}asOrderedCollection .

	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test006WhenRandomFallsInAtomicBombRangeThenAllGeneratedSquaresAreAtomicBombSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 3
		random: 0.99
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
		.

	squares := generator generate.

	self assert: squares size equals: 3.

	squares do: [ :square |
		self assert: square class equals: AtomicBombSquare
	].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test007WhenCreatingGeneratorWithNegativeNumberOfSquaresThenTheSquaresCannotBeCreated [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: -1
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Number of squares cannot be negative'
		].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test008WhenCreatingGeneratorWithRandomLowerThanZeroThenTheSquaresCannotBeCreated [

	self
		should: [
			FixedSquaresGenerator
				withNumberOfSquares: 10
				random: -0.1
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Random number must be between 0 and 1'
		].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test009WhenCreatingGeneratorWithRandomGreaterThanOneThenTheSquaresCannotBeCreated [

	self
		should: [
			FixedSquaresGenerator
				withNumberOfSquares: 10
				random: 1.1
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Random number must be between 0 and 1'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test010WhenCreatingGeneratorWithZeroMoonWalkNThenTheSquaresCannotBeCreated [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: 10
				moonWalkN: 0
				hyperJumpParsecs: #(10 8 6 4)
				
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'MoonWalk N must be positive'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test011WhenCreatingGeneratorWithNegativeMoonWalkNThenTheSquaresCannotBeCreated [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: 10
				moonWalkN: -3
				hyperJumpParsecs: #(10 8 6 4)
				
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'MoonWalk N must be positive'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test015WhenCreatingGeneratorWithValidValuesThenGeneratorIsCreatedSuccesfully [

	| generator |

	generator := SquaresGenerator
		withNumberOfSquares: 10
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
	.

	self assert: generator class equals: SquaresGenerator.
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test016WhenRandomFallsInCardGeneratorSquareRangeThenAllGeneratedSquaresCardsGeneratorSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 4
		random: 0.35
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
.

	squares := generator generate.

	self assert: squares size equals: 4.

	squares do: [ :square |
		self assert: square class equals: CardGeneratorSquare 
	].
]
