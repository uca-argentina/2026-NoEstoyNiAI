Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test005Prueba [

	| aGame aCollectionOfDices aCollectionOfSquares |
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (FixedDie withFixedResults: #( 10 )).
	aCollectionOfDices add: (FixedDie withFixedResults: #( 10 )).
	aCollectionOfDices add: (FixedDie withFixedResults: #( 10 )).

	aCollectionOfSquares := OrderedCollection new.

	20 timesRepeat: [
		                        aCollectionOfSquares add: NoEffectSquare new ].

	aGame := RacingTheSpace
		         withDices: aCollectionOfDices
		         withSquares: aCollectionOfSquares
		         withSpaceships: 1
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
GameTest >> test005WhenThePlayerReachesTheGoalThenTheNextTurnCannotThrow [
| aGame aCollectionOfDices|
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 20 withSpaceships: 1.
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
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
self
		should: [RacingTheSpace withDices: aCollectionOfDices withBoardSize: 0 ]
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
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
self
		should: [RacingTheSpace withDices: aCollectionOfDices withBoardSize: -10 ]
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
		should: [RacingTheSpace withDices: aCollectionOfDices withBoardSize: 10 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With No Dices' ]


]

{ #category : 'tests' }
GameTest >> test009WhenTheFirstPlayerPlaysItsTurnThenTheResultIsItsNewPosition [
| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(5)).
aCollectionOfDices add: (FixedDie withFixedResults: #(15)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 40 withSpaceships: 3.
aGame playTurn.
aPosition := Position withNumberOfSquare: 30 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test010WhenShip2PlaysItsTurnThenTheResultIsItsNewPosition [
| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 5)).
aCollectionOfDices add: (FixedDie withFixedResults: #(5 5)).
aCollectionOfDices add: (FixedDie withFixedResults: #(15 5)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 40 withSpaceships: 3.
aGame playTurn.
aGame playTurn.

aPosition := Position withNumberOfSquare: 15 andLaps:0. 
self assert: (aGame positionOf:2) = aPosition .
]

{ #category : 'tests' }
GameTest >> test011WhenShip1PlaysTwiceThenItsPositionIsTheSumOfBothTurnsThrows [
| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(5)).
aCollectionOfDices add: (FixedDie withFixedResults: #(15)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 70 withSpaceships: 3.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aPosition := Position withNumberOfSquare: 60 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition.
]

{ #category : 'tests' }
GameTest >> test012WhenTheFirstPlayerReachesTheGoalThenTheSecondPlayerCannotPlayItsTurn [
| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(5)).
aCollectionOfDices add: (FixedDie withFixedResults: #(15)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 40 withSpaceships: 3.
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
GameTest >> test013WhenAGameIsCreatedWithLessThanOnePlayerThenTheGameCannotBeCreated [

| aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(5 20)). 
aCollectionOfDices add: (FixedDie withFixedResults: #(5 20)).

self
		should: [RacingTheSpace withDices: aCollectionOfDices withBoardSize: 50  withSpaceships: 0]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create A Game With Less Than 1 Player'  ]
]

{ #category : 'tests' }
GameTest >> test014WhenTheGameStartsAndNeitherPlayerReachedTheGoalThenTheGameIsNotEnded [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(5)).
aCollectionOfDices add: (FixedDie withFixedResults: #(15)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 40 withSpaceships: 2.
aGame playTurn.
aGame playTurn.

self deny: (aGame isEnded).
]

{ #category : 'tests' }
GameTest >> test015WhenTheGameStartsAndTheOnlyPlayerReachesTheGoalThenTheGameIsEnded [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
aCollectionOfDices add: (FixedDie withFixedResults: #(5)).
aCollectionOfDices add: (FixedDie withFixedResults: #(15)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 40 withSpaceships: 1.
aGame playTurn.
aGame playTurn.

self assert: aGame isEnded.
]

{ #category : 'tests' }
GameTest >> test016WhenTheFirstPlayerReachesTheGoalThenTheFirstPlayerIsTheWinner [

	| aGame aCollectionOfDices |
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (FixedDie withFixedResults: #( 10 )).
	aCollectionOfDices add: (FixedDie withFixedResults: #( 5 )).
	aCollectionOfDices add: (FixedDie withFixedResults: #( 15 )).

	aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 30 withSpaceships: 1 withLaps: 1.
	aGame playTurn.

	self assert: aGame numberOfWinner equals: 1
]

{ #category : 'tests' }
GameTest >> test017WhenTheSecondPlayerReachesTheGoalFirstThenTheSecondPlayerIsTheWinner [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(5 10)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 10 withSpaceships: 2 withLaps: 1.
aGame playTurn.
aGame playTurn.

self assert: aGame numberOfWinner equals: 2.
]

{ #category : 'tests' }
GameTest >> test018WhenTheThirdPlayerReachesTheGoalFirtThenTheThirdPlayerIsTheWinner [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(5 10 15)).
aCollectionOfDices add: (FixedDie withFixedResults: #(5 7 15)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 45 withSpaceships: 3.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: aGame numberOfWinner equals: 3.
]

{ #category : 'tests' }
GameTest >> test019WhenTheGameIsNotFinishedThenThereIsNoWinnerYet [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(5 20)). 
aCollectionOfDices add: (FixedDie withFixedResults: #(5 20)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 50  withSpaceships: 3.
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
| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(5 20 12)). 
aCollectionOfDices add: (FixedDie withFixedResults: #(5 8)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 50  withSpaceships: 3.
aGame playTurn. 
aGame playTurn.
aGame playTurn. 

self assert: aGame showEachSpaceshipNumberOfSquare equals: #(10 28 17) asOrderedCollection .
]

{ #category : 'tests' }
GameTest >> test021WhenTheSpaceshipMovesToANoEffectSquareThenTheSpaceshipPositionIsWhatTheDiceRolled [

| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 40 withSpaceships: 3.
aGame playTurn .
aPosition := Position withNumberOfSquare: 10 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test022WhenTheSpaceShipMovesToAWormHoleSquareThenTheSpaceShipMoves4PositionsBackwards [

| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(80)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 100 withSpaceships: 3.
aGame playTurn.
aPosition := Position withNumberOfSquare: 76 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test023WhenTheSpaceShipMovesToASpeedUpSquareThenTheSpaceShipMoves4PositionsFowards [

| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(81)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 100 withSpaceships: 3.
aGame playTurn.
aPosition := Position withNumberOfSquare: 85 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test024WhenTheSpaceShipMovesToAMoonWalkSquareThenTheOthersMovesNPositionsBackwards [

| aGame aCollectionOfDices aPosition1 aPosition2 aPosition3 |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 10 82)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 100 withSpaceships: 3.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aPosition1 := Position withNumberOfSquare: 5 andLaps:0. 
aPosition2 := Position withNumberOfSquare: 5 andLaps:0. 
aPosition3 := Position withNumberOfSquare: 82 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition1 .
self assert: (aGame positionOf:2) = aPosition2.
self assert: (aGame positionOf:3) = aPosition3.
]

{ #category : 'tests' }
GameTest >> test025WhenTheSpaceShipMovesToAParsecSquareThenTheSpaceShipMovesMParsecsForwards [

| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(84)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 150 withSpaceships: 3.
aGame playTurn.
aPosition := Position withNumberOfSquare: 104 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test026WhenTheSpaceShipMovesToAnAtomicBombSquareThenAllTheSpaceShipsMoveToTheBeginningOfTheBoard [

| aGame aCollectionOfDices aPosition1 aPosition2 aPosition3 |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(85)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 150 withSpaceships: 3.
aGame  playTurn.
aPosition1 := Position withNumberOfSquare: 1 andLaps:0. 
aPosition2 := Position withNumberOfSquare: 1 andLaps:0. 
aPosition3 := Position withNumberOfSquare: 1 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition1 .
self assert: (aGame positionOf:2) = aPosition2.
self assert: (aGame positionOf:3) = aPosition3.

]

{ #category : 'tests' }
GameTest >> test027WhenTheSpaceShipMovesToASpecialSquareAfterAnEffectThenTheSecondEffectIsNotApplied [
| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 81)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 100 withSpaceships: 2 withLaps: 1.
aGame playTurn. 
aGame playTurn.
aPosition := Position withNumberOfSquare: 10 andLaps:0. 
self assert: (aGame positionOf:1) = aPosition .
]

{ #category : 'tests' }
GameTest >> test028WhenASpaceshipCompletesOneLapThenLapsIncreaseAndGameContinues [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 25 withSpaceships: 1 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self deny: (aGame isEnded).
]

{ #category : 'tests' }
GameTest >> test029WhenASpaceshipCompletesAllTheLapsThenTheGameEnds [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 25 withSpaceships: 1 withLaps: 2.

aGame playTurn.
aGame playTurn. 
aGame playTurn. 
aGame playTurn. 
aGame playTurn. 

self assert: (aGame isEnded).
]

{ #category : 'tests' }
GameTest >> test030WhenASpaceshipCompletesAllTheLapsFirstThenItIsTheWinner [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(1 10)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 25 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.  
aGame playTurn.  
aGame playTurn. 
aGame playTurn.  
aGame playTurn.  
aGame playTurn.  
aGame playTurn.  
aGame playTurn.  
aGame playTurn.

self assert: aGame numberOfWinner equals: 2.
]

{ #category : 'tests' }
GameTest >> test031WhenASpaceshipFinishedTheFirstLapThenTheSpaceshipReturnsToTheFirtsSquareOfTheSeconLap [

| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 19 withSpaceships:1 withLaps: 2.

aGame playTurn.
aGame playTurn.

aPosition := Position withNumberOfSquare: 1 andLaps: 1.

self assert: ((aGame positionOf: 1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test032WhenASpaceshipReachesToTheFinalPositionOfTheBoardThenTheNumberOfLapsDoesNotIncreases [

| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(19)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 19 withSpaceships:1 withLaps: 2.

aGame playTurn.

aPosition := Position withNumberOfSquare: 19 andLaps: 0.

self assert: ((aGame positionOf: 1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test033WhenTheSpaceshipIsSecondBecauseOfBeing1LapBehindThenTheSpaceshipRankingPositionIs2 [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 5)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 29 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: (aGame positionInRankingOf: 2) equals: 2.
]

{ #category : 'tests' }
GameTest >> test034WhenTheSpaceshipHasntPassALapThenTheSpaceshipLapIs1 [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 5)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 29 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: (aGame lapOf: 2) equals: 0.
]

{ #category : 'tests' }
GameTest >> test035WhenTheSpaceshipIsFirstThenTheSpaceshipRankingPositionIs1 [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(1 10)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 25 withSpaceships: 2 withLaps: 2.

aGame playTurn.

self assert: (aGame positionInRankingOf: 1) equals: 1.
]

{ #category : 'tests' }
GameTest >> test036WhenTheSpaceshipHasPassedALapThenTheSpaceshipLapIs2 [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 5)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 29 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: (aGame lapOf: 1) equals: 1.
]

{ #category : 'tests' }
GameTest >> test037WhenTheFirstSpaceshipIsAheadOfTheSecondOneThenTheRankingPuts1TheFirstSpaceshipAnd2TheOtherOne [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 5)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 29 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: aGame ranking equals: #(1 2) asOrderedCollection.
]

{ #category : 'tests' }
GameTest >> test038WhenASpaceshipHasPassedALapButTheOtherOneHasntThenTheSpaceshipsLapsAre2and1Respectively [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 5)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 29 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: aGame showEachSpaceshipLap equals: #(1 0) asOrderedCollection .
]

{ #category : 'tests' }
GameTest >> test039WhenTheGameIsAskedForPositionsThenThePositionsRespectNumberOfSquareAndLap [

| aGame aCollectionOfDices aPosition1 aPosition2 aCollectionOfPositions |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 5)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 29 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

aPosition1 := Position withNumberOfSquare:1 andLaps: 1.
aPosition2 := Position withNumberOfSquare:10 andLaps: 0.
aCollectionOfPositions := OrderedCollection new.
aCollectionOfPositions add: aPosition1.
aCollectionOfPositions add: aPosition2.

self assert: (aGame showEachSpaceshipGamePosition hasEqualElements: aCollectionOfPositions ) .
]

{ #category : 'tests' }
GameTest >> test040WhenShip1PlaysItsTurnThenTheTurnPassesToShip2 [

| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 5)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 30 withSpaceships: 2.

aGame playTurn.
aGame playTurn.
aPosition := Position withNumberOfSquare: 10 andLaps:0. 

self assert: (aGame positionOf: 1) = aPosition.
]

{ #category : 'tests' }
GameTest >> test041WhenAGameIsCreatedWithLessThanOneLapThenTheGameCannotBeCreated [

| aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(5 20)). 
aCollectionOfDices add: (FixedDie withFixedResults: #(5 20)).

self
		should: [RacingTheSpace withDices: aCollectionOfDices withBoardSize: 30 withSpaceships: 1 withLaps: 0]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'You Cannot Create a Game With Less Than 1 lap'  ]
]

{ #category : 'tests' }
GameTest >> test042WhenMoreThanOneSpaceshipAreAtTheSamePositionThenTheFirtsCreatedSpaceshipIsAheadOnTheRanking [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 29 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: aGame ranking equals: #(1 2) asOrderedCollection.
]

{ #category : 'tests' }
GameTest >> test043WhenTheSpaceship2IsAheadOfTheSpaceship1ThenTheSpaceship2IsAheadOnTheRanking [

| aGame aCollectionOfDices |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(10 15)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 50 withSpaceships: 2 withLaps: 2.

aGame playTurn.
aGame playTurn.
aGame playTurn.
aGame playTurn.

self assert: aGame ranking equals: #(2 1) asOrderedCollection.
]

{ #category : 'tests' }
GameTest >> test044WhenASpaceshipHasToMoveBackwardsMorePositionsThanTheOnesThatHeAdvancedThenItMovesToTheBegginingOfTheBoard [
| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(2)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 205 withSpaceships: 1 withLaps: 1.
aGame playTurn.

aPosition := Position withNumberOfSquare: 1 andLaps: 0. 

self assert: ((aGame positionOf:1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test045WhenASpaceshipHasToMoveBackwardsPassingThroughTheBegginingOfTheBoardThenTheLapDecreases [

| aGame aCollectionOfDices aPosition |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(205 2)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 205 withSpaceships: 1 withLaps: 2.
aGame playTurn.
aGame playTurn.

aPosition := Position withNumberOfSquare: 203 andLaps: 0. 

self assert: ((aGame positionOf:1) = aPosition ).
]

{ #category : 'tests' }
GameTest >> test046WhenTheSpaceShipMovesToAnAtomicBombThenAllTheSpaceShipsMoveToTheBeginningOfTheBoardRespectingTheirLap [

| aGame aCollectionOfDices aPosition1 aPosition2 aPosition3 |
aCollectionOfDices:= OrderedCollection new.
aCollectionOfDices add: (FixedDie withFixedResults: #(160 85)).

aGame := RacingTheSpace withDices: aCollectionOfDices withBoardSize: 150 withSpaceships: 3 withLaps: 3.
aGame  playTurn.
aGame  playTurn.
aPosition1 := Position withNumberOfSquare: 1 andLaps:1. 
aPosition2 := Position withNumberOfSquare: 1 andLaps:0. 
aPosition3 := Position withNumberOfSquare: 1 andLaps:0. 

self assert: (aGame positionOf:1) = aPosition1 .
self assert: (aGame positionOf:2) = aPosition2.
self assert: (aGame positionOf:3) = aPosition3.

]
