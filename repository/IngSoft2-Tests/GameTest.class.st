Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test005WhenThePlayerReachesTheGoalThenTheNextTurnCannotThrow [
| aGame aCollectionOfDices aCollectionOfSquares |
	aCollectionOfDices := OrderedCollection new.
	3 timesRepeat: [aCollectionOfDices add: (FixedDie withFixedResults: #( 10 ))  ].
	aCollectionOfSquares := OrderedCollection new.

	20 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

	aGame := RacingTheSpace
		         throwing: aCollectionOfDices
		         playingOn: aCollectionOfSquares
		         usingSpaceShips: 1
		         withLaps: 1.
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
GameTest >> test006WhenAGameIsCreatedWithLessThan2SquaresThenTheGameCannotBeCreated [
| aCollectionOfDices aCollectionOfSquares |
aCollectionOfDices:= OrderedCollection new.
3 timesRepeat: [aCollectionOfDices add: (FixedDie withFixedResults: #( 10 ))].
aCollectionOfSquares := OrderedCollection new.
aCollectionOfSquares add: NoEffectSquare new.
self
		should: [RacingTheSpace throwing: aCollectionOfDices playingOn: aCollectionOfSquares usingSpaceShips:1  withLaps: 1]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With Less Than 2 Squares' ]

]

{ #category : 'tests' }
GameTest >> test008WhenAGameIsCreatedWithNoDicesThenTheGameCannotBeCreated [
| aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfSquares := OrderedCollection new.
5 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
self
		should: [RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips:2  withLaps: 1]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With No Dices' ]


]

{ #category : 'tests' }
GameTest >> test009WhenTheFirstPlayerPlaysItsTurnThenTheResultIsItsNewPosition [
| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
aCollectionOfDice add: (FixedDie withFixedResults: #(5)).
aCollectionOfDice add: (FixedDie withFixedResults: #(15)).

aCollectionOfSquares := OrderedCollection new.
40 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:3  withLaps:1.

aGame playTurn.
aPosition := Position withNumberOfSquare: 30 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test010WhenShip2PlaysItsTurnThenTheResultIsItsNewPosition [
| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 5)).
aCollectionOfDice add: (FixedDie withFixedResults: #(5 5)).
aCollectionOfDice add: (FixedDie withFixedResults: #(15 5)).

aCollectionOfSquares := OrderedCollection new.
40 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares  usingSpaceShips: 3 withLaps: 1.
2 timesRepeat: [aGame playTurn].

aPosition := Position withNumberOfSquare: 15 andLaps:0. 
self assert: (aGame positionOf:2) = aPosition .
]

{ #category : 'tests' }
GameTest >> test011WhenShip1PlaysTwiceThenItsPositionIsTheSumOfBothTurnsThrows [
| aGame aCollectionOfDice aPosition aCollectionOfSquares|
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
aCollectionOfDice add: (FixedDie withFixedResults: #(5)).
aCollectionOfDice add: (FixedDie withFixedResults: #(15)).

aCollectionOfSquares := OrderedCollection new.
70 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 1.
4 timesRepeat: [ aGame playTurn ].

aPosition := Position withNumberOfSquare: 60 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition.
]

{ #category : 'tests' }
GameTest >> test012WhenTheFirstPlayerReachesTheGoalThenTheSecondPlayerCannotPlayItsTurn [
| aGame aCollectionOfDice aCollectionOfSquares|
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
aCollectionOfDice add: (FixedDie withFixedResults: #(5)).
aCollectionOfDice add: (FixedDie withFixedResults: #(15)).

aCollectionOfSquares := OrderedCollection new.
40 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 1.
4 timesRepeat: [ aGame playTurn ].

self
		should: [ aGame playTurn ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Throw, The Game Ended' ]
]

{ #category : 'tests' }
GameTest >> test013WhenAGameIsCreatedWithLessThanOnePlayerThenTheGameCannotBeCreated [

| aCollectionOfDice aCollectionOfSquares|
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(5 20)). 
aCollectionOfDice add: (FixedDie withFixedResults: #(5 20)).

aCollectionOfSquares := OrderedCollection new.
50 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

self
		should: [RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 0 withLaps: 1]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With Less Than 1 Player'  ]
]

{ #category : 'tests' }
GameTest >> test014WhenTheGameStartsAndNeitherPlayerReachedTheGoalThenTheGameIsNotEnded [

| aGame aCollectionOfDice aCollectionOfSquares|
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
aCollectionOfDice add: (FixedDie withFixedResults: #(5)).
aCollectionOfDice add: (FixedDie withFixedResults: #(15)).

aCollectionOfSquares := OrderedCollection new.
40 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 2 withLaps: 1.
2 timesRepeat:[aGame playTurn].

self deny: (aGame isEnded).
]

{ #category : 'tests' }
GameTest >> test015WhenTheGameStartsAndTheOnlyPlayerReachesTheGoalThenTheGameIsEnded [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
aCollectionOfDice add: (FixedDie withFixedResults: #(5)).
aCollectionOfDice add: (FixedDie withFixedResults: #(15)).

aCollectionOfSquares := OrderedCollection new.
40 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 1 withLaps: 1.
2 timesRepeat: [aGame playTurn].

self assert: aGame isEnded.
]

{ #category : 'tests' }
GameTest >> test016WhenTheFirstPlayerReachesTheGoalThenTheFirstPlayerIsTheWinner [

	| aGame aCollectionOfDice aCollectionOfSquares|
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: (FixedDie withFixedResults: #( 10 )).
	aCollectionOfDice add: (FixedDie withFixedResults: #( 5 )).
	aCollectionOfDice add: (FixedDie withFixedResults: #( 15 )).

	aCollectionOfSquares := OrderedCollection new.
	30 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
	aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 1 withLaps: 1.
	aGame playTurn.

	self assert: aGame numberOfWinner equals: 1
]

{ #category : 'tests' }
GameTest >> test017WhenTheSecondPlayerReachesTheGoalFirstThenTheSecondPlayerIsTheWinner [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(5 10)).

aCollectionOfSquares := OrderedCollection new.
10 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 2 withLaps: 1.
aGame playTurn.
aGame playTurn.

self assert: aGame numberOfWinner equals: 2.
]

{ #category : 'tests' }
GameTest >> test018WhenTheThirdPlayerReachesTheGoalFirtThenTheThirdPlayerIsTheWinner [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(5 10 15)).
aCollectionOfDice add: (FixedDie withFixedResults: #(5 7 15)).

aCollectionOfSquares := OrderedCollection new.
45 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 1.
6 timesRepeat: [aGame playTurn].

self assert: aGame numberOfWinner equals: 3.
]

{ #category : 'tests' }
GameTest >> test019WhenTheGameIsNotFinishedThenThereIsNoWinnerYet [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(5 20)). 
aCollectionOfDice add: (FixedDie withFixedResults: #(5 20)).

aCollectionOfSquares := OrderedCollection new.
50 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 1.
aGame playTurn. 
aGame playTurn.
aGame playTurn. 

self
		should: [aGame numberOfWinner ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'There is no winner yet. The game is not finished'  ]
]

{ #category : 'tests' }
GameTest >> test020WhenTheSquaresPositionsAreRequestedThenTheSquaresPositionsAreShowed [
| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(5 20 12)). 
aCollectionOfDice add: (FixedDie withFixedResults: #(5 8)).

aCollectionOfSquares := OrderedCollection new.
50 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 1.
3 timesRepeat:[aGame playTurn]. 

self assert: aGame showEachSpaceshipNumberOfSquare equals: #(10 28 17) asOrderedCollection .
]

{ #category : 'tests' }
GameTest >> test021WhenTheSpaceshipMovesToANoEffectSquareThenTheSpaceshipPositionIsWhatTheDiceRolled [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
10 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 1.
aGame playTurn .
aPosition := Position withNumberOfSquare: 10 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test022WhenTheSpaceShipMovesToAWormHoleSquareThenTheSpaceShipMoves4PositionsBackwards [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
9 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aCollectionOfSquares add: WormHoleSquare new.
aCollectionOfSquares  add: NoEffectSquare new.

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 2 withLaps: 1.
aGame playTurn.
aPosition := Position withNumberOfSquare: 6 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test023WhenTheSpaceShipMovesToASpeedUpSquareThenTheSpaceShipMoves4PositionsFowards [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.

aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
9 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aCollectionOfSquares add: SpeedUpSquare new.
5 timesRepeat:[aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 2 withLaps: 1.
aGame playTurn.
aPosition := Position withNumberOfSquare: 14 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test024WhenTheSpaceShipMovesToAMoonWalkSquareThenTheOthersMovesNPositionsBackwards [

| aGame aCollectionOfDice aPosition1 aPosition2 aPosition3 aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(5 5 10)).

aCollectionOfSquares := OrderedCollection new.
9 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aCollectionOfSquares add: (MoonWalkSquare withN: 2).
aCollectionOfSquares  add: NoEffectSquare new.

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 1.
3 timesRepeat: [ aGame playTurn ].

aPosition1 := Position withNumberOfSquare: 3 andLaps:0. 
aPosition2 := Position withNumberOfSquare: 3 andLaps:0. 
aPosition3 := Position withNumberOfSquare: 10 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition1 .
self assert: (aGame positionOf:2) = aPosition2.
self assert: (aGame positionOf:3) = aPosition3.
]

{ #category : 'tests' }
GameTest >> test025WhenTheSpaceShipMovesToAParsecSquareThenTheSpaceShipMovesMParsecsForwards [

| aGame aCollectionOfDice aPosition aCollectionOfSquares aPosition2 aPosition3 aPosition4 |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
9 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aCollectionOfSquares add: (HyperJumpSquare withParsecs: #(2 4 6)asOrderedCollection andRelation: 2).
20 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 4 withLaps: 1.
4 timesRepeat:[ aGame playTurn].

aPosition := Position withNumberOfSquare: 22 andLaps:0. 
aPosition2:= Position withNumberOfSquare: 18 andLaps:0. 
aPosition3:= Position withNumberOfSquare: 14 andLaps:0. 
aPosition4:= Position withNumberOfSquare: 22 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition .
self assert: (aGame positionOf:2) = aPosition2 .
self assert: (aGame positionOf:3) = aPosition3 .
self assert: (aGame positionOf:4) = aPosition4 .


]

{ #category : 'tests' }
GameTest >> test026WhenTheSpaceShipMovesToAnAtomicBombSquareThenAllTheSpaceShipsMoveToTheBeginningOfTheBoard [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #( 5 5 10)).

aCollectionOfSquares := OrderedCollection new.
9 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aCollectionOfSquares add: AtomicBombSquare new.
5 timesRepeat:[aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 1.
3 timesRepeat: [ aGame playTurn ].
aPosition := Position withNumberOfSquare: 1 andLaps:0. 


self assert: (aGame positionOf:1) = aPosition .
self assert: (aGame positionOf:2) = aPosition.
self assert: (aGame positionOf:3) = aPosition.

]

{ #category : 'tests' }
GameTest >> test027WhenTheSpaceShipMovesToASpecialSquareAfterAnEffectThenTheSecondEffectIsNotApplied [
| aGame aCollectionOfDice aPosition1 aCollectionOfSquares aPosition2 |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(5 10)).

aCollectionOfSquares := OrderedCollection new.
9 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aCollectionOfSquares add: SpeedUpSquare new.
3 timesRepeat:[aCollectionOfSquares add: NoEffectSquare new].
aCollectionOfSquares  add: AtomicBombSquare new.
aCollectionOfSquares add: NoEffectSquare new.

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 2 withLaps: 1.
2 timesRepeat: [aGame playTurn]. 

aPosition1 := Position withNumberOfSquare: 5 andLaps:0. 
aPosition2 := Position withNumberOfSquare: 14 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition1 .
self assert: (aGame positionOf:2) = aPosition2 .
]

{ #category : 'tests' }
GameTest >> test028WhenASpaceshipCompletesOneLapThenLapsIncreaseAndGameContinues [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
25 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:1  withLaps:2.

4 timesRepeat: [aGame playTurn].

self deny: (aGame isEnded).
]

{ #category : 'tests' }
GameTest >> test029WhenASpaceshipCompletesAllTheLapsThenTheGameEnds [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
25 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:1  withLaps:2.
5 timesRepeat: [aGame playTurn].

self assert: (aGame isEnded).
]

{ #category : 'tests' }
GameTest >> test030WhenASpaceshipCompletesAllTheLapsFirstThenItIsTheWinner [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(1 10)).
aCollectionOfSquares := OrderedCollection new.
25 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

10 timesRepeat: [aGame playTurn].


self assert: aGame numberOfWinner equals: 2.
]

{ #category : 'tests' }
GameTest >> test031WhenASpaceshipFinishedTheFirstLapThenTheSpaceshipReturnsToTheFirtsSquareOfTheSeconLap [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
aCollectionOfSquares := OrderedCollection new.
19 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:1  withLaps:2.

2 timesRepeat: [aGame playTurn].

aPosition := Position withNumberOfSquare: 1 andLaps: 1.

self assert: ((aGame positionOf: 1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test032WhenASpaceshipReachesToTheFinalPositionOfTheBoardThenTheNumberOfLapsDoesNotIncreases [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(19)).

aCollectionOfSquares := OrderedCollection new.
19 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:1  withLaps:2.


aGame playTurn.

aPosition := Position withNumberOfSquare: 19 andLaps: 0.

self assert: ((aGame positionOf: 1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test033WhenTheSpaceshipIsSecondBecauseOfBeing1LapBehindThenTheSpaceshipRankingIs2 [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 5)).

aCollectionOfSquares := OrderedCollection new.
29 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

5 timesRepeat: [aGame playTurn].

self assert: (aGame rankingOf: 2) equals: 2.
]

{ #category : 'tests' }
GameTest >> test034WhenTheSpaceshipHadNotPassALapThenTheSpaceshipLapIs1 [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 5)).

aCollectionOfSquares := OrderedCollection new.
29 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

5 timesRepeat: [aGame playTurn].

self assert: (aGame lapOf: 2) equals: 1.
]

{ #category : 'tests' }
GameTest >> test035WhenTheSpaceshipIsFirstThenTheSpaceshipRankingIs1 [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(1 10)).

aCollectionOfSquares := OrderedCollection new.
25 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

aGame playTurn.

self assert: (aGame rankingOf: 1) equals: 1.
]

{ #category : 'tests' }
GameTest >> test036WhenTheSpaceshipHasPassedALapThenTheSpaceshipLapIs2 [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 5)).

aCollectionOfSquares := OrderedCollection new.
29 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

5 timesRepeat: [aGame playTurn].

self assert: (aGame lapOf: 1) equals: 2.
]

{ #category : 'tests' }
GameTest >> test037WhenTheFirstSpaceshipIsAheadOfTheSecondOneThenTheRankingPuts1TheFirstSpaceshipAnd2TheOtherOne [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 5)).

aCollectionOfSquares := OrderedCollection new.
29 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

5 timesRepeat: [aGame playTurn].

self assert: aGame ranking equals: #(1 2) asOrderedCollection.
]

{ #category : 'tests' }
GameTest >> test038WhenASpaceshipHasPassedALapButTheOtherOneHasntThenTheSpaceshipsLapsAre2and1Respectively [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 5)).

aCollectionOfSquares := OrderedCollection new.
29 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

5 timesRepeat: [aGame playTurn].

self assert: aGame showEachSpaceshipLap equals: #(2 1) asOrderedCollection .
]

{ #category : 'tests' }
GameTest >> test039WhenTheGameIsAskedForPositionsThenThePositionsRespectNumberOfSquareAndLap [

| aGame aCollectionOfDice aPosition1 aPosition2 aCollectionOfPositions aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 5)).

aCollectionOfSquares := OrderedCollection new.
29 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

5 timesRepeat: [aGame playTurn].

aPosition1 := Position withNumberOfSquare:1 andLaps: 1.
aPosition2 := Position withNumberOfSquare:10 andLaps: 0.
aCollectionOfPositions := OrderedCollection new.
aCollectionOfPositions add: aPosition1.
aCollectionOfPositions add: aPosition2.

self assert: (aGame showEachSpaceshipGamePosition hasEqualElements: aCollectionOfPositions ) .
]

{ #category : 'tests' }
GameTest >> test040WhenShip1PlaysItsTurnThenTheTurnPassesToShip2 [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 5)).

aCollectionOfSquares := OrderedCollection new.
30 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:1.

2 timesRepeat: [aGame playTurn].

aPosition := Position withNumberOfSquare: 10 andLaps:0. 

self assert: (aGame positionOf: 1) = aPosition.
]

{ #category : 'tests' }
GameTest >> test041WhenAGameIsCreatedWithLessThanOneLapThenTheGameCannotBeCreated [

| aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(5 20)). 
aCollectionOfDice add: (FixedDie withFixedResults: #(5 20)).

aCollectionOfSquares := OrderedCollection new.
5 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].


self
		should: [RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:0]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create a Game With Less Than 1 lap'  ]
]

{ #category : 'tests' }
GameTest >> test042WhenMoreThanOneSpaceshipAreAtTheSamePositionThenTheFirtCreatedSpaceshipIsAheadOnTheRanking [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
29 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

4 timesRepeat: [aGame playTurn].


self assert: aGame ranking equals: #(1 2) asOrderedCollection.
]

{ #category : 'tests' }
GameTest >> test043WhenTheSpaceship2IsAheadOfTheSpaceship1ThenTheSpaceship2IsAheadOnTheRanking [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10 15)).

aCollectionOfSquares := OrderedCollection new.
50 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new ].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:2  withLaps:2.

4 timesRepeat: [aGame playTurn].


self assert: aGame ranking equals: #(2 1) asOrderedCollection.
]

{ #category : 'tests' }
GameTest >> test044WhenASpaceshipHasToMoveBackwardsMorePositionsThanTheOnesThatHeAdvancedThenItMovesToTheBegginingOfTheBoard [
| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(2)).

aCollectionOfSquares := OrderedCollection new.
aCollectionOfSquares add: NoEffectSquare new.
aCollectionOfSquares add: WormHoleSquare new.
aCollectionOfSquares add: NoEffectSquare new.

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:1  withLaps:1.

aGame playTurn.
aPosition := Position withNumberOfSquare: 1 andLaps: 0. 

self assert: ((aGame positionOf:1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test045WhenASpaceshipHasToMoveBackwardsPassingThroughTheBegginingOfTheBoardThenTheLapDecreases [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.

aCollectionOfDice add: (FixedDie withFixedResults: #(12)).

aCollectionOfSquares := OrderedCollection new.
aCollectionOfSquares add: NoEffectSquare new.
aCollectionOfSquares add: WormHoleSquare new.
8 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:1  withLaps:3.

aGame playTurn.

aPosition := Position withNumberOfSquare: 8 andLaps: 0. 

self assert: ((aGame positionOf:1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test046WhenTheSpaceShipMovesToAnAtomicBombThenAllTheSpaceShipsMoveToTheBeginningOfTheBoardRespectingTheirLap [

| aGame aCollectionOfDice aPosition1 aPosition2 aPosition3 aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #( 20 35 10)).

aCollectionOfSquares := OrderedCollection new.
9 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].
aCollectionOfSquares add: AtomicBombSquare new.
5 timesRepeat:[aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares usingSpaceShips: 3 withLaps: 3.
3 timesRepeat: [ aGame playTurn ].

aPosition1 := Position withNumberOfSquare: 1 andLaps:1. 
aPosition2 := Position withNumberOfSquare: 1 andLaps:2. 
aPosition3 := Position withNumberOfSquare: 1 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition1 .
self assert: (aGame positionOf:2) = aPosition2.
self assert: (aGame positionOf:3) = aPosition3.

]

{ #category : 'tests' }
GameTest >> test047WhenASpaceshipMovesFowardMoreSquaresThanTheOnesIn2LapsTheTheLapsIncreaseInMoreOrEqualThan2Units [

| aGame aCollectionOfDice aPosition aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.

aCollectionOfDice add: (FixedDie withFixedResults: #(12)).

aCollectionOfSquares := OrderedCollection new.
aCollectionOfSquares add: NoEffectSquare new.
aCollectionOfSquares add: WormHoleSquare new.
8 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:1  withLaps:3.

aGame playTurn.

aPosition := Position withNumberOfSquare: 8 andLaps: 0. 

self assert: ((aGame positionOf:1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test048WhenAGameIsCreatedWithSquaresGeneratorThenItCanBePlayed [

| aGame aCollectionOfDice aCollectionOfSquares |
aCollectionOfDice:= OrderedCollection new.

aCollectionOfDice add: (FixedDie withFixedResults: #(12)).

aCollectionOfSquares := (SquaresGenerator withNumberOfSquares: 10 moonWalkN: 3 hyperJumpParsecs: #(2 4 6)asOrderedCollection  hyperJumpRelation: 2) generate. 

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn:aCollectionOfSquares  usingSpaceShips:1  withLaps:3.

self deny: (aGame isEnded).
]

{ #category : 'tests' }
GameTest >> test049WhenAPSpaceshipTriesThrowACardWhenIsNotItsTurnThenItCannotBePossible [

| aGame aCollectionOfDice  aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship solSpaceship valenSpaceship aCard |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.

aCard := OverloadCard new.
cards := {aCard . aCard}asOrderedCollection.


vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
solSpaceship := Spaceship withName: 'sol' andCards: cards.
valenSpaceship := Spaceship withName: 'valen' andCards: cards.
aCollectionOfSpaceships := { vitoSpaceship . solSpaceship . valenSpaceship } asOrderedCollection .

30 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships  withLaps: 1.

aGame playTurn. 

self should: [ aGame throw: aCard to: vitoSpaceship by: valenSpaceship ] raise: Error withExceptionDo: [ :arg | self assert: arg messageText equals: 'You cannot throw a card when is not your turn' ]


]

{ #category : 'tests' }
GameTest >> test050WhenASpaceshipTriesToThrowACardToAnInexistentPlayerThenItCannotBePossible [

| aGame aCollectionOfDice  aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship  aCard |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
aCard := OverloadCard new.
cards := {aCard . aCard}asOrderedCollection.

vitoSpaceship := Spaceship withName: 'vito' andCards: cards.

aCollectionOfSpaceships := { vitoSpaceship  } asOrderedCollection .

30 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships  withLaps: 1.


self should: [ aGame throw: aCard to: (Spaceship withName: 'valen' andCards: cards) by: vitoSpaceship ] raise: Error withExceptionDo: [ :arg | self assert: arg messageText equals: 'You cannot throw a card to an inexistent target' ]



]

{ #category : 'tests' }
GameTest >> test051WhenASpaceshipTriesToThrowACardThatIsNotInHisHandThenItCannotThrowIt [

| aGame aCollectionOfDice  aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship  solSpaceship aCard |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
aCard := OverloadCard new.


cards := OrderedCollection new.
cards add: SpeedCard new.


vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
solSpaceship := Spaceship withName: 'sol' andCards: cards.

aCollectionOfSpaceships := { vitoSpaceship . solSpaceship } asOrderedCollection .

30 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships  withLaps: 1.

self should: [ aGame throw: aCard to: solSpaceship by: vitoSpaceship ] raise: Error withExceptionDo: [ :arg | self assert: arg messageText equals: 'You cannot throw a card you dont have' ]



]

{ #category : 'tests' }
GameTest >> test052WhenCreatingAGameWithTwoSpeceshipsWithTheSameNameThenItCannotBeCreated [

| aCollectionOfDice  aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship  vitoSpaceship2 |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
cards := OrderedCollection new.
cards add: SpeedCard new.


vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
vitoSpaceship2 := Spaceship withName: 'vito' andCards: cards.

aCollectionOfSpaceships := { vitoSpaceship . vitoSpaceship2 } asOrderedCollection .

30 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

self should: [RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships  withLaps: 1.]
				raise: Error withExceptionDo: [ :arg | self assert: arg messageText equals: 'You cannot create two spaceships with the same name' ]


]

{ #category : 'tests' }
GameTest >> test053WhenASpaceShipsTriesToThrowACardAtAnEndedGameThenItCannotBePosible [

| aGame aCollectionOfDice  aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship  solSpaceship aCard |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
aCard := OverloadCard new.
cards := {aCard . aCard}asOrderedCollection.

vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
solSpaceship := Spaceship withName: 'sol' andCards: cards.

aCollectionOfSpaceships := { vitoSpaceship . solSpaceship } asOrderedCollection .

10 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships  withLaps: 1.

aGame playTurn .

self should: [ aGame throw: aCard to: solSpaceship by: vitoSpaceship ] raise: Error withExceptionDo: [ :arg | self assert: arg messageText equals: 'You cannot throw a card when the game is ended' ]






]

{ #category : 'tests' }
GameTest >> test054WhenAnOverloadCardIsThrownToAPlayerThenThatPlayersNextDiceThrowIsReducedByTwo [

| aGame aCollectionOfDice  aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship solSpaceship valenSpaceship aPosition aCard |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
aCard := OverloadCard new.
cards := {aCard . aCard}asOrderedCollection.


vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
solSpaceship := Spaceship withName: 'sol' andCards: cards.
valenSpaceship := Spaceship withName: 'valen' andCards: cards.
aCollectionOfSpaceships := { vitoSpaceship . solSpaceship . valenSpaceship } asOrderedCollection .

11 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships  withLaps: 1.

aGame playTurn .
aGame throw: aCard to: valenSpaceship by: solSpaceship .
aGame playTurn .
aGame playTurn.

aPosition := Position withNumberOfSquare: 8 andLaps:0. 

self assert: (aGame positionOf: 'valen') = aPosition.




]

{ #category : 'tests' }
GameTest >> test055WhenASpaceshipThrowsAnOverloadCardToAPlayerThenTheEffectKeepsOnOtherRounds [

| aGame aCollectionOfDice  aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship solSpaceship valenSpaceship aPosition aCard |
aCollectionOfDice:= OrderedCollection new.
aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

aCollectionOfSquares := OrderedCollection new.
aCard := OverloadCard new.
cards := {aCard . aCard}asOrderedCollection.


vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
solSpaceship := Spaceship withName: 'sol' andCards: cards.
valenSpaceship := Spaceship withName: 'valen' andCards: cards.
aCollectionOfSpaceships := { vitoSpaceship . solSpaceship . valenSpaceship } asOrderedCollection .

50 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships  withLaps: 1.

aGame playTurn .
aGame throw: aCard to: valenSpaceship by: solSpaceship .
5 timesRepeat: [aGame playTurn].

aPosition := Position withNumberOfSquare: (20 - 2 -2) andLaps:0. 

self assert: (aGame positionOf: 'valen') = aPosition.



]

{ #category : 'tests' }
GameTest >> test056NOWhenASpaceshipRemovesAnOverloadCardThenItNextTheEffectDoesNotAffectAnymore [

	| aGame aCollectionOfDice aCollectionOfSquares aPosition cards vitoSpaceship solSpaceship valenSpaceship aCollectionOfSpaceships |
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: (FixedDie withFixedResults: #( 10 )).
	aCollectionOfSquares := OrderedCollection new.
	
	cards := OrderedCollection new.
	cards add: OverloadCard new.
	20 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].
	vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
	solSpaceship := Spaceship withName: 'sol' andCards: cards.
	valenSpaceship := Spaceship withName: 'valen' andCards: cards.
	aCollectionOfSpaceships := {
		                           vitoSpaceship.
		                           solSpaceship.
		                           valenSpaceship } asOrderedCollection.
	aGame := RacingTheSpace
		         throwing: aCollectionOfDice
		         playingOn: aCollectionOfSquares
		         by: aCollectionOfSpaceships
		         withLaps: 1.
		
	"aGame playTurn.
	aGame throw: OverloadCard new to: valenSpaceship by: solSpaceship.
	aGame playTurn.
	aGame playTurn.
	aPosition := Position withNumberOfSquare: 8 andLaps: 0.
	
	self assert: (aGame positionOf: 'valen') = aPosition"
]

{ #category : 'tests' }
GameTest >> test057WhenASpeedCardIsThrownToAPlayerThenThatPlayersNextsDiceThrowsIncreaseByOne [

	| aCollectionOfDice aCollectionOfSquares cards vitoSpaceship solSpaceship valenSpaceship aCollectionOfSpaceships aGame aPosition aCard |
	aCollectionOfDice:= OrderedCollection new.
	aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
	aCollectionOfSquares:= OrderedCollection new.
	
	aCard := SpeedCard new.
	cards := {aCard . aCard}asOrderedCollection.

	
	vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
   solSpaceship := Spaceship withName: 'sol' andCards: cards.
   valenSpaceship := Spaceship withName: 'valen' andCards: cards.
	aCollectionOfSpaceships := { vitoSpaceship . solSpaceship . valenSpaceship } asOrderedCollection.
	
	aCollectionOfSquares := (FixedSquaresGenerator withNumberOfSquares: 50 random:0.1  moonWalkN: 1 hyperJumpParsecs: { 1 . 2 }asOrderedCollection hyperJumpRelation: 2) generate.

	aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships withLaps: 1.
	
	aGame playTurn.
	aGame throw: aCard to: valenSpaceship by: solSpaceship.
	6 timesRepeat: [aGame playTurn].
	
	aPosition:= Position withNumberOfSquare: 22 andLaps: 0.
	
	self assert:(aGame positionOf: 'valen') = aPosition
]

{ #category : 'tests' }
GameTest >> test058WhenAnAccelerationCardIsThrownThenAllSpaceshipsIncreaseTheirNextsDiceThrowsByOne [

	| aGame aCollectionOfDice aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship solSpaceship valenSpaceship aPosition anAccelerationCard |
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: (FixedDie withFixedResults: #( 10 )).
	aCollectionOfSquares := OrderedCollection new.
	anAccelerationCard := AccelerationCard new.
	cards := OrderedCollection new.
	cards add: anAccelerationCard.
	vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
	solSpaceship := Spaceship withName: 'sol' andCards: cards.
	valenSpaceship := Spaceship withName: 'valen' andCards: cards.
	aCollectionOfSpaceships := {vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.
	50 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].
	aGame := RacingTheSpace
		         throwing: aCollectionOfDice
		         playingOn: aCollectionOfSquares
		         by: aCollectionOfSpaceships
		         withLaps: 1.
	aGame throw: anAccelerationCard to: vitoSpaceship by: vitoSpaceship.
	6 timesRepeat: [aGame playTurn].
	
	aPosition := Position withNumberOfSquare: 22 andLaps: 0.
	self assert: (aGame positionOf: 'vito') = aPosition.
	self assert: (aGame positionOf: 'sol') = aPosition.
	self assert: (aGame positionOf: 'valen') = aPosition
]

{ #category : 'tests' }
GameTest >> test059WhenASpaceshipThrowsACardThenTheCardIsRemovedFromItsHand [
    | aGame aCollectionOfDice  aCollectionOfSquares cards aCollectionOfSpaceships vitoSpaceship solSpaceship valenSpaceship  aCard |
    
	aCollectionOfDice:= OrderedCollection new.
	aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
	
	cards := OrderedCollection new.
	aCard:=  OverloadCard new.
	cards add: aCard.

	vitoSpaceship := Spaceship withName: 'vito' andCards: cards.
	solSpaceship := Spaceship withName: 'sol' andCards: cards.
	valenSpaceship := Spaceship withName: 'valen' andCards: cards.
	aCollectionOfSpaceships := { vitoSpaceship . solSpaceship . valenSpaceship } asOrderedCollection .
	
	aCollectionOfSquares := OrderedCollection new.
	11 timesRepeat: [aCollectionOfSquares add: NoEffectSquare new].

	aGame := RacingTheSpace throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships  withLaps: 1.

	aGame throw: aCard to: valenSpaceship by: vitoSpaceship .
	self deny: (vitoSpaceship hasCard: aCard).



    
    
]

{ #category : 'tests' }
GameTest >> test060WhenASpaceshipThrowsAnInstantCardOutsideItsTurnThenItCanBeThrown [
    | aGame aCollectionOfDice speedCard vitoSpaceship solSpaceship valenSpaceship 
      aCollectionOfSpaceships aCollectionOfSquares cancellationCard vitosCards valensCards |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(10)).
    
    speedCard := SpeedCard new.
    cancellationCard := CancellationCard new.
    
    vitosCards := { speedCard } asOrderedCollection.
    valensCards := { cancellationCard } asOrderedCollection.

    vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.
    solSpaceship := Spaceship withName: 'sol' andCards: OrderedCollection new.
    valenSpaceship := Spaceship withName: 'valen' andCards: valensCards.
    
    aCollectionOfSpaceships := { vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.
    
    aCollectionOfSquares := OrderedCollection new.
    11 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 1.

    aGame throw: speedCard to: valenSpaceship by: vitoSpaceship.
    
    self
        shouldnt: [ aGame throw: cancellationCard to: speedCard by: valenSpaceship ]
        raise: Error.
]

{ #category : 'tests' }
GameTest >> test061WhenACancellationCardRemovesASpecificCardThenTheCardsEffectIsNotAppliedAnymore [

    | aGame aCollectionOfDice speedCard cancellationCard 
      vitoSpaceship solSpaceship valenSpaceship 
      aCollectionOfSpaceships aCollectionOfSquares 
      vitosCards solCards valensCards valenPositionAfterSpeed valenPositionAfterCancellation |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

    speedCard := SpeedCard new.
    cancellationCard := CancellationCard new.

    vitosCards := { speedCard } asOrderedCollection.
    solCards := { cancellationCard } asOrderedCollection.
    valensCards := OrderedCollection new.

    vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.
    solSpaceship := Spaceship withName: 'sol' andCards: solCards.
    valenSpaceship := Spaceship withName: 'valen' andCards: valensCards.

    aCollectionOfSpaceships := { vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.

    aCollectionOfSquares := OrderedCollection new.
    40 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 2.

    aGame throw: speedCard to: valenSpaceship by: vitoSpaceship.

    3 timesRepeat: [aGame playTurn]. 
   
    valenPositionAfterSpeed := Position withNumberOfSquare: 11 andLaps: 0.

    self assert: (aGame positionOf: 'valen') = valenPositionAfterSpeed .

    aGame throw: cancellationCard to: speedCard by: solSpaceship.

    3 timesRepeat: [aGame playTurn]. 

    valenPositionAfterCancellation := Position withNumberOfSquare: 21 andLaps: 0.

    self assert: (aGame positionOf: 'valen') = valenPositionAfterCancellation.
]

{ #category : 'tests' }
GameTest >> test062WhenASpaceshipThrowsARepeatCardAndNobodyRolledDicesThenItHasNoEffect [

    | aGame aCollectionOfDice repeatCard
      vitoSpaceship solSpaceship valenSpaceship
      aCollectionOfSpaceships aCollectionOfSquares
      vitosCards solCards valensCards expectedValenPosition |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

    repeatCard := RepeatCard new.

    vitosCards := OrderedCollection new.
    solCards := OrderedCollection new.
    valensCards := { repeatCard } asOrderedCollection.

    vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.
    solSpaceship := Spaceship withName: 'sol' andCards: solCards.
    valenSpaceship := Spaceship withName: 'valen' andCards: valensCards.

    aCollectionOfSpaceships := { vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.

    aCollectionOfSquares := OrderedCollection new.
    11 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 2.

    aGame throw: repeatCard to: valenSpaceship by: valenSpaceship.

    expectedValenPosition := Position withNumberOfSquare: 0 andLaps: 0.

    self assert: ((aGame positionOf: 'valen') = expectedValenPosition).
]

{ #category : 'tests' }
GameTest >> test063WhenASpaceshipThrowsARepeatCardAndLastEffectWasSpeedupEffectThenTheTargetSpaceshipPositionIsAffected [
    | aGame aCollectionOfDice repeatCard
      vitoSpaceship solSpaceship valenSpaceship
      aCollectionOfSpaceships aCollectionOfSquares
      vitosCards solCards valensCards expectedValenPosition |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

    repeatCard := RepeatCard new.

    vitosCards := OrderedCollection new.
    solCards := OrderedCollection new.
    valensCards := { repeatCard } asOrderedCollection.

    vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.
    solSpaceship := Spaceship withName: 'sol' andCards: solCards.
    valenSpaceship := Spaceship withName: 'valen' andCards: valensCards.

    aCollectionOfSpaceships := { vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.

    aCollectionOfSquares := OrderedCollection new.
    9 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].
	 aCollectionOfSquares add: SpeedUpSquare new.
	 10 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 2.
	 
	 aGame playTurn.
    aGame throw: repeatCard to: valenSpaceship by: valenSpaceship.

    expectedValenPosition := Position withNumberOfSquare: 4 andLaps: 0.

    self assert: ((aGame positionOf: 'valen') = expectedValenPosition).
]

{ #category : 'tests' }
GameTest >> test064WhenASpaceshipThrowsARepeatCardAndLastEffectWasWormHoleEffectThenTheTargetSpaceshipPositionIsAffected [
    | aGame aCollectionOfDice repeatCard
      vitoSpaceship solSpaceship valenSpaceship
      aCollectionOfSpaceships aCollectionOfSquares
      vitosCards solCards valensCards expectedVitoPosition |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(10)).

    repeatCard := RepeatCard new.

    vitosCards := OrderedCollection new.
    solCards := OrderedCollection new.
    valensCards := { repeatCard } asOrderedCollection.

    vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.
    solSpaceship := Spaceship withName: 'sol' andCards: solCards.
    valenSpaceship := Spaceship withName: 'valen' andCards: valensCards.

    aCollectionOfSpaceships := { vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.

    aCollectionOfSquares := OrderedCollection new.
    9 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].
	 aCollectionOfSquares add: WormHoleSquare new.
	 10 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 2.
	 
	 aGame playTurn.
    aGame throw: repeatCard to: vitoSpaceship by: valenSpaceship.

    expectedVitoPosition := Position withNumberOfSquare: 2 andLaps: 0.

    self assert: ((aGame positionOf: 'vito') = expectedVitoPosition).
]

{ #category : 'tests' }
GameTest >> test065WhenASpaceshipThrowsARepeatCardAndLastEffectWasMoonWalkEffectThenAllButTheTargetSpaceshipPositionsAreAffected [
    | aGame aCollectionOfDice repeatCard
      vitoSpaceship solSpaceship valenSpaceship
      aCollectionOfSpaceships aCollectionOfSquares
      vitosCards solCards valensCards expectedVitoPosition expectedSolPosition expectedValenPosition |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(9 12 10)).

    repeatCard := RepeatCard new.

    vitosCards := OrderedCollection new.
    solCards := OrderedCollection new.
    valensCards := { repeatCard } asOrderedCollection.

    vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.
    solSpaceship := Spaceship withName: 'sol' andCards: solCards.
    valenSpaceship := Spaceship withName: 'valen' andCards: valensCards.

    aCollectionOfSpaceships := { vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.

    aCollectionOfSquares := OrderedCollection new.
    9 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].
	 aCollectionOfSquares add: (MoonWalkSquare withN: 2).
	 15 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 2.
	 
	 3 timesRepeat: [aGame playTurn].
	expectedVitoPosition := Position withNumberOfSquare: 7 andLaps: 0.
	 expectedSolPosition := Position withNumberOfSquare: 10 andLaps: 0.
	 expectedValenPosition := Position withNumberOfSquare: 10 andLaps: 0.

    self assert: ((aGame positionOf: 'vito') = expectedVitoPosition).
	self assert: ((aGame positionOf: 'sol') = expectedSolPosition ).
	self assert: ((aGame positionOf: 'valen') = expectedValenPosition ).
	
    aGame throw: repeatCard to: valenSpaceship by: valenSpaceship.

    expectedVitoPosition := Position withNumberOfSquare: 5 andLaps: 0.
	 expectedSolPosition := Position withNumberOfSquare: 8 andLaps: 0.
	 expectedValenPosition := Position withNumberOfSquare: 10 andLaps: 0.

    self assert: ((aGame positionOf: 'vito') = expectedVitoPosition).
	self assert: ((aGame positionOf: 'sol') = expectedSolPosition ).
	self assert: ((aGame positionOf: 'valen') = expectedValenPosition ).
	



]

{ #category : 'tests' }
GameTest >> test066WhenASpaceshipThrowsARepeatCardAndLastEffectWasHyperJumpEffectThenTheTargetSpaceshipPositionIsAffected [
    | aGame aCollectionOfDice repeatCard
      vitoSpaceship solSpaceship valenSpaceship
      aCollectionOfSpaceships aCollectionOfSquares
      vitosCards solCards valensCards expectedValenPosition |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(9 12 10)).

    repeatCard := RepeatCard new.

    vitosCards := OrderedCollection new.
    solCards := OrderedCollection new.
    valensCards := { repeatCard } asOrderedCollection.

    vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.
    solSpaceship := Spaceship withName: 'sol' andCards: solCards.
    valenSpaceship := Spaceship withName: 'valen' andCards: valensCards.

    aCollectionOfSpaceships := { vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.

    aCollectionOfSquares := OrderedCollection new.
    9 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].
	 aCollectionOfSquares add: (HyperJumpSquare withParsecs: { 4 . 5 . 2 }asOrderedCollection andRelation: 2).
	 5 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 2.
	 
	 3 timesRepeat: [aGame playTurn].
	 expectedValenPosition := Position withNumberOfSquare: 5 andLaps: 1.
	self assert: ((aGame positionOf: 'valen') = expectedValenPosition ).
	
    aGame throw: repeatCard to: valenSpaceship by: valenSpaceship.

	 expectedValenPosition := Position withNumberOfSquare: 13 andLaps: 1.
	self assert: ((aGame positionOf: 'valen') = expectedValenPosition ).
	



]

{ #category : 'tests' }
GameTest >> test067WhenASpaceshipThrowsARepeatCardAndLastEffectWasAtomicBombEffectThenAllSpaceshipPositionsAreAffected [
    | aGame aCollectionOfDice repeatCard
      vitoSpaceship solSpaceship valenSpaceship
      aCollectionOfSpaceships aCollectionOfSquares
      vitosCards solCards valensCards expectedValenPosition expectedVitoPosition expectedSolPosition |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(9 12 10)).

    repeatCard := RepeatCard new.

    vitosCards := OrderedCollection new.
    solCards := OrderedCollection new.
    valensCards := { repeatCard } asOrderedCollection.

    vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.
    solSpaceship := Spaceship withName: 'sol' andCards: solCards.
    valenSpaceship := Spaceship withName: 'valen' andCards: valensCards.

    aCollectionOfSpaceships := { vitoSpaceship. solSpaceship. valenSpaceship } asOrderedCollection.

    aCollectionOfSquares := OrderedCollection new.
    9 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].
	 aCollectionOfSquares add: AtomicBombSquare new.
	 5 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 2.
	 
	 3 timesRepeat: [aGame playTurn].
	
    aGame throw: repeatCard to: vitoSpaceship by: valenSpaceship.
    expectedVitoPosition := Position withNumberOfSquare: 1 andLaps: 0.
	 expectedSolPosition := Position withNumberOfSquare: 1 andLaps: 0.
	 expectedValenPosition := Position withNumberOfSquare: 1 andLaps: 0.
	 
	 self assert: ((aGame positionOf: 'vito') = expectedVitoPosition).
	self assert: ((aGame positionOf: 'sol') = expectedSolPosition ).
	self assert: ((aGame positionOf: 'valen') = expectedValenPosition ).

 



]

{ #category : 'tests' }
GameTest >> test068WhenASpaceshipIsCreatedWithCardsGeneratorThenTheSpaceshipCanPlay [

 | aGame aCollectionOfDice vitoSpaceship  aCollectionOfSpaceships aCollectionOfSquares vitosCards   expectedVitoPosition |

    aCollectionOfDice := OrderedCollection new.
    aCollectionOfDice add: (FixedDie withFixedResults: #(1)).  
	
	vitosCards := CardsGenerator withNumberOfCards: 2.
	vitoSpaceship := Spaceship withName: 'vito' andCards: vitosCards.


    aCollectionOfSpaceships := { vitoSpaceship} asOrderedCollection.

    aCollectionOfSquares := OrderedCollection new.
    9 timesRepeat: [ aCollectionOfSquares add: NoEffectSquare new ].

    aGame := RacingTheSpace
        throwing: aCollectionOfDice
        playingOn: aCollectionOfSquares
        by: aCollectionOfSpaceships
        withLaps: 2.

	aGame playTurn.

    expectedVitoPosition := Position withNumberOfSquare: 1 andLaps: 0.

    self assert: ((aGame positionOf: 'vito') = expectedVitoPosition).
]
