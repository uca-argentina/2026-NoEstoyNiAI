Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test001WhenAGameThrowsDicesThenTheResultIsTheSumOfTheDices [

| aGame |

aGame := Game default.

self assert: aGame throwDices equals: 10
]

{ #category : 'tests' }
GameTest >> test002WhenAGameThrows1DiceThenTheGameReturnsTheSum [

| aGame aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResult: 10).

aGame := Game withDices: aCollectionOfDices .

self assert: aGame throwDices equals: 10
]

{ #category : 'tests' }
GameTest >> test003WhenAGameThrows3FixedDicesOf10ThenTheGameReturnsTheSumOfThem [
| aGame aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aGame := Game withDices: aCollectionOfDices .

self assert: aGame throwDices equals: 30
]

{ #category : 'tests' }
GameTest >> test004WhenAGameThrow3RandomDicesThenTheGameReturnsANumberBetweenMinimumSumAndMaximumSum [
| aGame aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (Dice withFaces: 10).
aCollectionOfDices add: (Dice withFaces: 15).
aCollectionOfDices add: (Dice withFaces: 5).
aGame := Game withDices: aCollectionOfDices .

self assert: ((aGame throwDices) between: 3 and: 30).
]

{ #category : 'tests' }
GameTest >> test005WhenAGameIsEndedThenYouCannotThrowTheDices [
| aGame aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aGame := Game withDices: aCollectionOfDices withSize: 20.
aGame throwDices.
self
		should: [ aGame throwDices ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Throw, The Game Ended' ]


]

{ #category : 'tests' }
GameTest >> test006WhenAGameIsCreatedWithLessThan2SquaresThenTheGameCannotBeCreated [
| aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aCollectionOfDices add: (FixedDice withFixedResult: 10).
self
		should: [Game withDices: aCollectionOfDices withSize: 0 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With Less Than 2 Squares' ]


]

{ #category : 'tests' }
GameTest >> test007WhenAGameIsCreatedWithNegativeSquaresThenTheGameCannotBeCreated [
| aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aCollectionOfDices add: (FixedDice withFixedResult: 10).
aCollectionOfDices add: (FixedDice withFixedResult: 10).
self
		should: [Game withDices: aCollectionOfDices withSize: -10 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With Less Than 2 Squares' ]


]

{ #category : 'tests' }
GameTest >> test008WhenAGameIsCreatedWithNoDicesThenTheGameCannotBeCreated [
| aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.

self
		should: [Game withDices: aCollectionOfDices withSize: 10 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With No Dices' ]


]
