Class {
	#name : 'SquaresGeneratorTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test001GenerateCreatesOnlyNoEffectSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 5
		random: 0.1
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
		hyperJumpRelation: 2.

	squares := generator generate.

	self assert: squares size equals: 5.

	squares do: [ :square |
		self assert: square class equals: NoEffectSquare
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test002GenerateCreatesOnlyWormHoleSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 4
		random: 0.5
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
		hyperJumpRelation: 2.

	squares := generator generate.

	self assert: squares size equals: 4.

	squares do: [ :square |
		self assert: square class equals: WormHoleSquare
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test003GenerateCreatesOnlySpeedUpSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 3
		random: 0.7
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
		hyperJumpRelation: 2.

	squares := generator generate.

	self assert: squares size equals: 3.

	squares do: [ :square |
		self assert: square class equals: SpeedUpSquare
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test004GenerateCreatesMoonWalkSquaresWithGivenN [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 2
		random: 0.85
		moonWalkN: 4
		hyperJumpParsecs: #(10 8 6 4)
		hyperJumpRelation: 2.

	squares := generator generate.

	self assert: squares size equals: 2.

	squares do: [ :square |
		self assert: square class equals: MoonWalkSquare.
		self assert: square distance equals: 4
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test005GenerateCreatesHyperJumpSquaresWithGivenParsecsAndRelation [

	| generator squares parsecs |

	parsecs := #(10 8 6 4).

	generator := FixedSquaresGenerator
		withNumberOfSquares: 2
		random: 0.95
		moonWalkN: 3
		hyperJumpParsecs: parsecs
		hyperJumpRelation: 2.

	squares := generator generate.

	self assert: squares size equals: 2.

	squares do: [ :square |
		self assert: square class equals: HyperJumpSquare.
		self assert: square parsecs equals: parsecs.
		self assert: square relation equals: 2
	].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test006GenerateCreatesOnlyAtomicBombSquares [

	| generator squares |

	generator := FixedSquaresGenerator
		withNumberOfSquares: 3
		random: 0.99
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
		hyperJumpRelation: 2.

	squares := generator generate.

	self assert: squares size equals: 3.

	squares do: [ :square |
		self assert: square class equals: AtomicBombSquare
	].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test007CannotCreateGeneratorWithNegativeNumberOfSquares [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: -1
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				hyperJumpRelation: 2
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Number of squares cannot be negative'
		].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test008CannotCreateGeneratorWithRandomLowerThanZero [

	self
		should: [
			FixedSquaresGenerator
				withNumberOfSquares: 10
				random: -0.1
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				hyperJumpRelation: 2
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Random number must be between 0 and 1'
		].
]

{ #category : 'testing fixed' }
SquaresGeneratorTest >> test009CannotCreateGeneratorWithRandomGreaterThanOne [

	self
		should: [
			FixedSquaresGenerator
				withNumberOfSquares: 10
				random: 1.1
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				hyperJumpRelation: 2
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Random number must be between 0 and 1'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test010CannotCreateGeneratorWithZeroMoonWalkN [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: 10
				moonWalkN: 0
				hyperJumpParsecs: #(10 8 6 4)
				hyperJumpRelation: 2
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'MoonWalk N must be positive'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test011CannotCreateGeneratorWithNegativeMoonWalkN [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: 10
				moonWalkN: -3
				hyperJumpParsecs: #(10 8 6 4)
				hyperJumpRelation: 2
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'MoonWalk N must be positive'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test012CannotCreateGeneratorWithZeroHyperJumpRelation [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: 10
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				hyperJumpRelation: 0
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'HyperJump relation must be a positive integer'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test013CannotCreateGeneratorWithNegativeHyperJumpRelation [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: 10
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				hyperJumpRelation: -2
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'HyperJump relation must be a positive integer'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test014CannotCreateGeneratorWithNonIntegerHyperJumpRelation [

	self
		should: [
			SquaresGenerator
				withNumberOfSquares: 10
				moonWalkN: 3
				hyperJumpParsecs: #(10 8 6 4)
				hyperJumpRelation: 2.5
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'HyperJump relation must be a positive integer'
		].
]

{ #category : 'testing non fixed' }
SquaresGeneratorTest >> test015CanCreateGeneratorWithValidValues [

	| generator |

	generator := SquaresGenerator
		withNumberOfSquares: 10
		moonWalkN: 3
		hyperJumpParsecs: #(10 8 6 4)
		hyperJumpRelation: 2.

	self assert: generator class equals: SquaresGenerator.
]
