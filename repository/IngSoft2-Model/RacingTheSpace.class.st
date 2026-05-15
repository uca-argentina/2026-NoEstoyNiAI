Class {
	#name : 'RacingTheSpace',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'spaceships',
		'currentShift',
		'gameEnded',
		'board'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
RacingTheSpace class >> default [
	| aCollectionOfDices |
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
	^ (self new) initializeWithDices: aCollectionOfDices andSize: 30 andSpaceships: 1.
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> withDices: aCollectionOfDices [ 	

	^self new initializeWithDices: aCollectionOfDices andSize: 30 andSpaceships: 1.
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> withDices: aCollectionOfDices withSize: aSize [ 
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize andSpaceships: 1.
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> withDices: aCollectionOfDices withSize: aSize withSpaceships: aNumberOfSpaceships [
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	aNumberOfSpaceships < 1 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 1 Player'].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize andSpaceships: aNumberOfSpaceships.
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> createSpaceships: aNumberOfPlayers [

	^ spaceships := (1 to: aNumberOfPlayers) collect: [ :index |
		             Spaceship withName: index ]
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> incrementCurrentShift [

	^ currentShift := currentShift \\ self numberOfPlayers + 1
]

{ #category : 'initialization' }
RacingTheSpace >> initializeWithDices: aCollectionOfDices andSize: aSize andSpaceships: aNumberOfSpaceships [

	dices := aCollectionOfDices.
	board := Board withSize: aSize.
	currentShift := 1.
	gameEnded := false.
	self createSpaceships: aNumberOfSpaceships
]

{ #category : 'testing' }
RacingTheSpace >> isEnded [
	^ gameEnded.
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

	| result currentPlayerPosition currentPlayer |
	gameEnded ifTrue: [ Error signal: 'You Cannot Throw, The Game Ended' ].
	result := self throwDices.
	currentPlayer := spaceships at: currentShift.
	currentPlayerPosition := currentPlayer moveForward: result.

	gameEnded := board isFinishedAt: currentPlayerPosition.
	gameEnded ifFalse: [
			currentPlayerPosition := board
				                         callEffect: currentPlayer
				                         and: currentPlayerPosition
				                         and: spaceships ].

	gameEnded := board isFinishedAt: currentPlayerPosition.
	self incrementCurrentShift.
	^ currentPlayerPosition
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> showPositions [

	| resultString |
	resultString := self obtainPositionsStringResult.
	^ resultString contents
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> throwDices [

	| sumOfDices |
	
	sumOfDices:= dices inject: 0 into: [:sum :dice | sum + dice roll ].

	^sumOfDices .
	
	
]
