Class {
	#name : 'CardsGeneratorTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CardsGeneratorTest >> test001WhenRandomFallsInOverloadRangeThenAllGeneratedCardsAreOverloadCards [

	| generator cards |

	generator := FixedCardsGenerator withNumberOfCards: 2 random: 0.1.
 
	cards := generator generate.

	self assert: cards size equals: 2.

	cards do: [ :card |
		self assert: card class equals: OverloadCard 
	].
]

{ #category : 'tests' }
CardsGeneratorTest >> test002WhenRandomFallsInSpeedCardRangeThenAllGeneratedCardsAreSpeedUpCards [

	| generator cards |

	generator := FixedCardsGenerator withNumberOfCards: 2 random: 0.2.
 
	cards := generator generate.

	self assert: cards size equals: 2.

	cards do: [ :card |
		self assert: card class equals: SpeedCard 
	].
]

{ #category : 'tests' }
CardsGeneratorTest >> test003WhenRandomFallsInAccelerationCardThenAllGeneratedCardsAreAccelerationCards [

	| generator cards |

	generator := FixedCardsGenerator withNumberOfCards: 2 random: 0.4.
 
	cards := generator generate.

	self assert: cards size equals: 2.

	cards do: [ :card |
		self assert: card class equals: AccelerationCard 
	].
]

{ #category : 'tests' }
CardsGeneratorTest >> test004WhenRandomFallsInCancelationCardRangeThenAllGeneratedCardsAreCancelationCards [

	| generator cards |

	generator := FixedCardsGenerator withNumberOfCards: 2 random: 0.6.
 
	cards := generator generate.

	self assert: cards size equals: 2.

	cards do: [ :card |
		self assert: card class equals: CancellationCard 
	].
]

{ #category : 'tests' }
CardsGeneratorTest >> test005WhenRandomFallsInRedoCardRangeThenAllGeneratedCardsAreRedoCards [

	| generator cards |

	generator := FixedCardsGenerator withNumberOfCards: 2 random: 0.7.
 
	cards := generator generate.

	self assert: cards size equals: 2.

	cards do: [ :card |
		self assert: card class equals: RedoCard 
	].
]

{ #category : 'tests' }
CardsGeneratorTest >> test006WhenRandomFallsInRepeatCardRangeThenAllGeneratedCardsAreRepeatCards [

	| generator cards |

	generator := FixedCardsGenerator withNumberOfCards: 2 random: 0.9.
 
	cards := generator generate.

	self assert: cards size equals: 2.

	cards do: [ :card |
		self assert: card class equals: RepeatCard 
	].
]

{ #category : 'tests' }
CardsGeneratorTest >> test007WhenCreatingCardGeneratorWithNegativeNumberOfCardsThenTheSquaresCannotBeCreated [

	self
		should: [
			CardsGenerator 
				withNumberOfCards: -1
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Number of cards cannot be negative'
		].
]

{ #category : 'tests' }
CardsGeneratorTest >> test008WhenCreatingCardGeneratorWithRandomLowerThanZeroThenTheSquaresCannotBeCreated [

	self
		should: [
			FixedCardsGenerator
				withNumberOfCards: 10
				random: -0.1.
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Random number must be between 0 and 1'
		].
]

{ #category : 'tests' }
CardsGeneratorTest >> test009WhenCreatingGeneratorWithRandomGreaterThanOneThenTheSquaresCannotBeCreated [

	self
		should: [
			FixedCardsGenerator
				withNumberOfCards: 10
				random: 1.1.
		]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Random number must be between 0 and 1'
		].
]

{ #category : 'tests' }
CardsGeneratorTest >> test010WhenCreatingCardGeneratorWithValidValuesThenGeneratorIsCreatedSuccesfully [

	| generator |

	generator := CardsGenerator withNumberOfCards: 10.

	self assert: generator class equals: CardsGenerator.
]
