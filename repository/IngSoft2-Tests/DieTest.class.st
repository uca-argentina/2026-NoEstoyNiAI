Class {
	#name : 'DieTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DieTest >> test001WhenADiceIsThrowThenTheDiceReturnANumberBetween1and6 [

 | diceResult aDice |

aDice:= Die default.
diceResult:= aDice roll.
self assert: (diceResult between: 1 and: 6).
]

{ #category : 'tests' }
DieTest >> test002WhenADiceIsCreatedWithNFacesAndTheDiceIsThrownThenTheDiceReturnANumberBetween1andN [

 | diceResult aDice |

aDice:= Die withFaces: 4.
diceResult:= aDice roll.
self assert: (diceResult between: 1 and: 4).
]

{ #category : 'tests' }
DieTest >> test003WhenADiceIsCreatedWithLessThan4FacesThenTheDiceCannotBeCreated [

	self
		should: [ Die withFaces: 3 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with less than 4 faces' ]
]

{ #category : 'tests' }
DieTest >> test004WhenADiceIsCreatedWithAFloatTypeOfFacesThenTheDiceCannotBeCreated [

	self
		should: [ Die withFaces: 5.4 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with a not integer type of faces' ]
]

{ #category : 'tests' }
DieTest >> test005WhenADiceIsCreatedWithAStringTypeOfFacesThenTheDiceCannotBeCreated [

	self
		should: [ Die withFaces: '5' ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'A Dice can not be created with a not integer type of faces' ]
]
