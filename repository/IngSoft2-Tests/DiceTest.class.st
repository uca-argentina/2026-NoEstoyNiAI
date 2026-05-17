Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceTest >> test001WhenADiceIsThrowThenTheDiceReturnANumberBetween1and6 [

 | diceResult aDice |

aDice:= Dice default.
diceResult:= aDice roll.
self assert: (diceResult between: 1 and: 6).
]

{ #category : 'tests' }
DiceTest >> test002WhenADiceIsCreatedWithNFacesAndTheDiceIsThrownThenTheDiceReturnANumberBetween1andN [

 | diceResult aDice |

aDice:= Dice withFaces: 4.
diceResult:= aDice roll.
self assert: (diceResult between: 1 and: 4).
]

{ #category : 'tests' }
DiceTest >> test003WhenADiceIsCreatedWithLessThan4FacesThenTheDiceCannotBeCreated [

	self
		should: [ Dice withFaces: 3 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with less than 4 faces' ]
]

{ #category : 'tests' }
DiceTest >> test004WhenADiceIsCreatedWithAFloatTypeOfFacesThenTheDiceCannotBeCreated [

	self
		should: [ Dice withFaces: 5.4 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with a not integer type of faces' ]
]

{ #category : 'tests' }
DiceTest >> test005WhenADiceIsCreatedWithAStringTypeOfFacesThenTheDiceCannotBeCreated [

	self
		should: [ Dice withFaces: '5' ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with a not integer type of faces' ]
]
