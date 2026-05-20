Class {
	#name : 'RacingTheSpace',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'spaceships',
		'currentShift',
		'gameEnded',
		'board',
		'totalLaps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
RacingTheSpace class >> default [
	| aCollectionOfDices |
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (FixedDie withFixedResults: #(10)).
	^ (self new) initializeWithDices: aCollectionOfDices andBoardSize: 30 andSpaceships: 1 andLaps: 1.
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> withDices: aCollectionOfDices [ 	

	^self new initializeWithDices: aCollectionOfDices andBoardSize: 30 andSpaceships: 1 andLaps: 1.
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> withDices: aCollectionOfDices withBoardSize: aSize [ 
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	^self new initializeWithDices: aCollectionOfDices andBoardSize: aSize andSpaceships: 1 andLaps: 1.
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> withDices: aCollectionOfDices withBoardSize: aSize withSpaceships: aNumberOfSpaceships [
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	aNumberOfSpaceships < 1 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 1 Player'].
	^self new initializeWithDices: aCollectionOfDices andBoardSize: aSize andSpaceships: aNumberOfSpaceships andLaps: 1.
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> withDices: aCollectionOfDices withBoardSize: aSize withSpaceships: aNumberOfSpaceships withLaps: aNumberOfLaps [
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	aNumberOfSpaceships < 1 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 1 Player'].
	^self new initializeWithDices: aCollectionOfDices andBoardSize: aSize andSpaceships: aNumberOfSpaceships andLaps: aNumberOfLaps.
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> createSpaceships: aNumberOfPlayers [

	^ spaceships := (1 to: aNumberOfPlayers) collect: [ :index |Spaceship withName: index andPosition: (Position withNumberOfSquare: 0 andLaps: 0 ) ]
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> detectSpaceship: aSpaceshipName [

	| spaceship |
	spaceship := spaceships detect: [ :ship | ship name = aSpaceshipName ].
	^ spaceship
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> incrementCurrentShift [

	^ currentShift := currentShift \\ self numberOfPlayers + 1
]

{ #category : 'initialization' }
RacingTheSpace >> initializeWithDices: aCollectionOfDices andBoardSize: aSize andSpaceships: aNumberOfSpaceships andLaps: aNumberOfLaps [

	dices := aCollectionOfDices.
	board := Board withSize: aSize.
	totalLaps := aNumberOfLaps.
	currentShift := 1.
	gameEnded := false.
	self createSpaceships: aNumberOfSpaceships
]

{ #category : 'testing' }
RacingTheSpace >> isEnded [
	^ gameEnded.
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> lapOf: aSpaceshipName [

	| spaceship |
	spaceship := self detectSpaceship: aSpaceshipName.
	^ spaceship showLap
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> numberOfPlayers [
	^ spaceships size
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> numberOfWinner [
	gameEnded ifFalse: [
		Error signal: 'There is no winner yet. The game is not finished' ].
	^ (self obtainNameOfTheSpaceshipWithTheHigherPosition) name 
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> obtainNameOfTheSpaceshipWithTheHigherPosition [

    | maxSpaceship |
	maxSpaceship := spaceships first.
	spaceships do: [ :spaceShip |
        (spaceShip isAheadOf: maxSpaceship)
            ifTrue: [ maxSpaceship := spaceShip  ].
    ].

    ^ maxSpaceship 
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> obtainPositionsStringResult [

	| result |
	result := String new writeStream.
	spaceships do: [ :ship | ship showPosition: result ].
	^ result
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> playTurn [

	| result currentPlayer |
	gameEnded ifTrue: [ Error signal: 'You Cannot Throw, The Game Ended' ].
	result := self throwDices.
	currentPlayer := spaceships at: currentShift.
	currentPlayer moveForward: result.
	currentPlayer wrapIfNeeded: board size.
	

	gameEnded := currentPlayer laps >= totalLaps.
	
	gameEnded ifFalse: [ board callEffect: currentPlayer and: spaceships.
		currentPlayer wrapIfNeeded: board size.
		gameEnded := currentPlayer laps >= totalLaps ].

	self incrementCurrentShift.
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> positionInRankingOf: aSpaceShipName [ 
	| orderedSpaceships spaceship position |
	orderedSpaceships := self sortSpaceshipsByPosition.
	spaceship := self detectSpaceship: aSpaceShipName.
	position := orderedSpaceships indexOf: spaceship.
	
	^'The SpaceShip ', aSpaceShipName printString, ' is ', position printString, 'º'.
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> positionOf: aSpaceshipName [

	| spaceship |
	spaceship := self detectSpaceship: aSpaceshipName.
	^spaceship position.
	
	
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> ranking [
	| orderedSpaceships response |
	response :=''.
	orderedSpaceships := self sortSpaceshipsByPosition.
	orderedSpaceships withIndexDo: [ :spaceship :index | response := response, (spaceship showRankedPosition: index), String cr].
	^response.

]

{ #category : 'as yet unclassified' }
RacingTheSpace >> showEachSpaceshipGamePosition [
	| response |
	response := ''.
	spaceships do: [ :spaceship  | response := response, spaceship showGamePosition, String cr].
	^ response.

]

{ #category : 'as yet unclassified' }
RacingTheSpace >> showEachSpaceshipLap [
	| response |
	response :=''.
	spaceships do: [ :spaceship  | response := response, spaceship showLap, String cr].
	^response.
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> showPositions [

	| resultString |
	resultString := self obtainPositionsStringResult.
	^ resultString contents
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> sortSpaceshipsByPosition [

	| orderedSpaceships |
	orderedSpaceships := spaceships asSortedCollection: [ :shipA :shipB |
		                     shipA isAheadOf: shipB ].
	^ orderedSpaceships
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> throwDices [

	| sumOfDices |
	
	sumOfDices:= dices inject: 0 into: [:sum :dice | sum + dice roll ].

	^sumOfDices .
	
	
]
