Class {
	#name : 'FixedDiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
FixedDiceTest >> test001WhenAFixedDiceWithOneResultIsThrowThenTheFixedDiceReturnThatResult [

 | diceResult aDice |

aDice:= FixedDie withFixedResults: #(10).
diceResult:= aDice roll.
self assert: diceResult equals: 10.
]

{ #category : 'tests' }
FixedDiceTest >> test002WhenAFixedDiceHasMoreThanOneFixedResultThenTheSecondThrowReturnsTheSecondResult [

 | aDice |

aDice:= FixedDie withFixedResults: #(10 5).
aDice roll.
aDice roll.
self assert: aDice roll equals: 10.
]

{ #category : 'tests' }
FixedDiceTest >> test003WhenAFixedDiceIsCreatedWithAFloatResultThenTheDiceCannotBeCreated [

	self
		should: [ FixedDie withFixedResults: #(5.4) ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals:  'A Fixed Dice can not be created with a not integer fixed result']
]

{ #category : 'tests' }
FixedDiceTest >> test004WhenAFixedDiceIsCreatedWithAStringResultThenTheDiceCannotBeCreated [

	self
		should: [ FixedDie withFixedResults: '5' ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Fixed Dice can not be created with a not integer fixed result' ]
]

{ #category : 'tests' }
FixedDiceTest >> test005WhenAFixedDiceHasTwoFixedResultThenTheThirdThrowReturnsTheFirstResult [

 | aDice |

aDice:= FixedDie withFixedResults: #(10 5).
aDice roll.
aDice roll.
self assert: aDice roll equals: 10.
]

{ #category : 'tests' }
FixedDiceTest >> test006WhenAFixedDiceIsCreatedWithLessThan1AsAtLeastOneTheFixedResultsThenTheFixedDiceCannotBeCreated [


self
		should: [ FixedDie withFixedResults: #(10 -1) ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals:  'A Fixed Dice can not be created with a negative or zero fixed result']
]
