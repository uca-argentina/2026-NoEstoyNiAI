Class {
	#name : 'FixedDiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
FixedDiceTest >> test001WhenAFixedDiceIsThrowThenTheFixedDiceReturnANumberBetween1and6 [

 | diceResult aDice |

aDice:= FixedDice withFixedResult: 10.
diceResult:= aDice throw.
self assert: diceResult equals: 10.
]

{ #category : 'tests' }
FixedDiceTest >> test002WhenAFixedDiceIsCreatedWithLessThan4FacesThenTheDiceCannotBeCreated [

	self
		should: [ FixedDice withFixedResult: 3 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with less than 4 faces' ]
]

{ #category : 'tests' }
FixedDiceTest >> test003WhenAFixedDiceIsCreatedWithAFloatTypeOfFacesThenTheDiceCannotBeCreated [

	self
		should: [ FixedDice withFixedResult: 5.4 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with a not integer type of faces' ]
]

{ #category : 'tests' }
FixedDiceTest >> test004WhenAFixedDiceIsCreatedWithAStringTypeOfFacesThenTheDiceCannotBeCreated [

	self
		should: [ FixedDice withFixedResult: '5' ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with a not integer type of faces' ]
]
