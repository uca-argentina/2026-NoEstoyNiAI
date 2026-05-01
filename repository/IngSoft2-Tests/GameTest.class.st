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
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).

aGame := Game withDices: aCollectionOfDices .

self assert: aGame throwDices equals: 10
]

{ #category : 'tests' }
GameTest >> test003WhenAGameThrows3FixedDicesOf10ThenTheGameReturnsTheSumOfThem [
| aGame aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
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

self assert: (aGame throwDices between: 3 and: 30).
]

{ #category : 'tests' }
GameTest >> test005WhenAGameIsEndedThenYouCannotThrowTheDices [
| aGame aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aGame := Game withDices: aCollectionOfDices withSize: 20 withPlayers: 1.
aGame playTurn .
self
		should: [ aGame playTurn ]
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
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
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
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
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

{ #category : 'tests' }
GameTest >> test009WhenTheGameIsCreatedWith3PlayersThenTheFirstPlayerCanPlayItsTurn [
| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5)).
aCollectionOfDices add: (FixedDice withFixedResults: #(15)).

aGame := Game withDices: aCollectionOfDices withSize: 40 withPlayers: 3.

self assert: aGame playTurn equals: 30.
]

{ #category : 'tests' }
GameTest >> test010WhenTheSecondPlayerPlaysItsTurnThenTheResultIsItsNewPosition [
| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5)).
aCollectionOfDices add: (FixedDice withFixedResults: #(15)).

aGame := Game withDices: aCollectionOfDices withSize: 40 withPlayers: 3.
aGame playTurn.

self assert: aGame playTurn equals: 30.
]

{ #category : 'tests' }
GameTest >> test011WhenTheFirstPlayerPlaysTwiceThenItsPositionIsTheSumOfBothTurnsThrows [
| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5)).
aCollectionOfDices add: (FixedDice withFixedResults: #(15)).

aGame := Game withDices: aCollectionOfDices withSize: 40 withPlayers: 3.
aGame playTurn.
aGame playTurn.
aGame playTurn.
self assert: aGame playTurn equals: 60.
]

{ #category : 'tests' }
GameTest >> test012WhenTheFirstPlayerReachesTheGoalThenTheSecondPlayerCannotPlayItsTurn [
| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5)).
aCollectionOfDices add: (FixedDice withFixedResults: #(15)).

aGame := Game withDices: aCollectionOfDices withSize: 40 withPlayers: 3.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
self
		should: [ aGame playTurn ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Throw, The Game Ended' ]
]

{ #category : 'tests' }
GameTest >> test013WhenTheGameStartsAndTheOnlyPlayerDidNotReachesTheGoalThenTheGameIsNotEnded [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5)).
aCollectionOfDices add: (FixedDice withFixedResults: #(15)).

aGame := Game withDices: aCollectionOfDices withSize: 40 withPlayers: 1.
aGame playTurn.

self deny: aGame isEnded.
]

{ #category : 'tests' }
GameTest >> test014WhenTheGameStartsAndThePlayersDidNotReachesTheGoalThenTheGameIsNotEnded [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5)).
aCollectionOfDices add: (FixedDice withFixedResults: #(15)).

aGame := Game withDices: aCollectionOfDices withSize: 40 withPlayers: 2.
aGame playTurn.
aGame playTurn.

self deny: (aGame isEnded).
]

{ #category : 'tests' }
GameTest >> test015WhenTheGameStartsAndTheOnlyPlayerReachesTheGoalThenTheGameIsEnded [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5)).
aCollectionOfDices add: (FixedDice withFixedResults: #(15)).

aGame := Game withDices: aCollectionOfDices withSize: 40 withPlayers: 1.
aGame playTurn.
aGame playTurn.

self assert: aGame isEnded.
]

{ #category : 'tests' }
GameTest >> test016WhenTheOnlyPlayerReachesTheGoalThenItsTheWinner [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5)).
aCollectionOfDices add: (FixedDice withFixedResults: #(15)).

aGame := Game withDices: aCollectionOfDices withSize: 40 withPlayers: 1.
aGame playTurn.
aGame playTurn.

self assert: aGame numberOfWinner equals: 1.
]

{ #category : 'tests' }
GameTest >> test017WhenTheSecondPlayerOfTheTwoReachesTheGoalFirtThenTheSecondPlayerIsTheWinner [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(5 10)).

aGame := Game withDices: aCollectionOfDices withSize: 10 withPlayers: 2.
aGame playTurn.
aGame playTurn.

self assert: aGame numberOfWinner equals: 2.
]

{ #category : 'tests' }
GameTest >> test018WhenTheThirdPlayerOfTheThreePlayersReachesTheGoalFirtThenTheThirdPlayerIsTheWinner [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(5 10 15)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5 7 15)).

aGame := Game withDices: aCollectionOfDices withSize: 45 withPlayers: 3.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: aGame numberOfWinner equals: 3.
]

{ #category : 'tests' }
GameTest >> test019WhenTheSecondPlayerOfTheTreePlayersReachesTheGolsFirstThenTheSecondPlayerIsTheWinner [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(5 20 15)).
aCollectionOfDices add: (FixedDice withFixedResults: #(5 20 15)).

aGame := Game withDices: aCollectionOfDices withSize: 50  withPlayers: 3.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: aGame numberOfWinner equals: 2.
]

{ #category : 'tests' }
GameTest >> test020WhenThePlayersPlayMoreShiftsThanFixedDiceResultsThenTheGameContinuesByReIteratingTheResults [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(5 20)). 
aCollectionOfDices add: (FixedDice withFixedResults: #(5 20)).

aGame := Game withDices: aCollectionOfDices withSize: 50  withPlayers: 3.
aGame playTurn. "nave 1 avanza a la posicion 10 --> suma 10" 
aGame playTurn. "nave 2 avanza a la posicion 40 --> suma 40"
aGame playTurn. "nave 3 avanza a la posicion 10 --> suma 10"
aGame playTurn. "nave 1 avanza a la posicion 50 --> suma 40 --> aca ya gana"

self assert: aGame numberOfWinner equals: 1.
]

{ #category : 'tests' }
GameTest >> test021WhenTheGameIsNotFinishedThenThereIsNoWinnerYet [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(5 20)). 
aCollectionOfDices add: (FixedDice withFixedResults: #(5 20)).

aGame := Game withDices: aCollectionOfDices withSize: 50  withPlayers: 3.
aGame playTurn. "nave 1 avanza a la posicion 10 --> suma 10" 
aGame playTurn. "nave 2 avanza a la posicion 40 --> suma 40"
aGame playTurn. "nave 3 avanza a la posicion 10 --> suma 10"

self
		should: [aGame numberOfWinner ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'There is no winner yet. The game is not finished'  ]
]

{ #category : 'tests' }
GameTest >> test022WhenAGameIsCreatedWithLessThanOnePlayerThenTheGameCannotBeCreated [

| aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDice withFixedResults: #(5 20)). 
aCollectionOfDices add: (FixedDice withFixedResults: #(5 20)).

self
		should: [Game withDices: aCollectionOfDices withSize: 50  withPlayers: 0]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With Less Than 1 Player'  ]
]
