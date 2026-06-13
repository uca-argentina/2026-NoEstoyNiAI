Class {
	#name : 'RacingTheSpace',
	#superclass : 'Object',
	#instVars : [
		'spaceships',
		'currentShift',
		'gameEnded',
		'state'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
RacingTheSpace class >> createSpaceships: aNumberOfPlayers [

	| aRacingTheSpace |
	aRacingTheSpace := self new.

	^ aRacingTheSpace spaceships:
		  ((1 to: aNumberOfPlayers) collect: [ :index |
				   Spaceship
					   withName: index
					   andPosition: (Position withNumberOfSquare: 0 andLaps: 0) ])
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> throwing: aCollectionOfDice playingOn: aCollectionOfSquares by: aCollectionOfSpaceships withLaps: numberOfLaps [ 
	| board |
	aCollectionOfSquares size < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDice isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	aCollectionOfSpaceships isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 1 Player'].
	numberOfLaps < 1 ifTrue: [ Error signal: 'You Cannot Create a Game With Less Than 1 lap' ].
	(aCollectionOfSpaceships anySatisfy: [ :ship | (aCollectionOfSpaceships count: [ :other | other name = ship name ]) > 1]) ifTrue: [self error: 'You cannot create two spaceships with the same name'].
	
	board := Board withSquares: aCollectionOfSquares andLaps: numberOfLaps .
	
	
	^ self new initializeThrowing: aCollectionOfDice playingOn: board using: aCollectionOfSpaceships deepCopy andWith: numberOfLaps
]

{ #category : 'as yet unclassified' }
RacingTheSpace class >> throwing: aCollectionOfDices playingOn: aCollectionOfSquares usingSpaceShips: aNumberOfSpaceships withLaps: aNumberOfLaps [
	| board spaceships |
	aCollectionOfSquares size < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	aNumberOfSpaceships < 1 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 1 Player'].
	aNumberOfLaps < 1 ifTrue: [ Error signal: 'You Cannot Create a Game With Less Than 1 lap' ].
	spaceships := self createSpaceships: aNumberOfSpaceships.
	
	board := Board withSquares: aCollectionOfSquares andLaps: aNumberOfLaps .
	^self new initializeThrowing: aCollectionOfDices playingOn: board using: spaceships andWith: aNumberOfLaps.
	
]

{ #category : 'private' }
RacingTheSpace >> detectSpaceship: aSpaceshipName [

	| spaceship |
	spaceship := spaceships detect: [ :ship | ship name = aSpaceshipName ].
	^ spaceship
]

{ #category : 'initialization' }
RacingTheSpace >> initializeThrowing: aCollectionOfDices playingOn: board using: someSpaceships andWith: aNumberOfLaps [
	currentShift := 1.
    gameEnded := false.
    spaceships := someSpaceships.
    state := OngoingGame withDices: aCollectionOfDices andBoard: board andSpaceships: spaceships.
]

{ #category : 'testing' }
RacingTheSpace >> isEnded [
	^ state isEnded.
]

{ #category : 'accessing' }
RacingTheSpace >> lapOf: aSpaceshipName [

	| spaceship |
	spaceship := self detectSpaceship: aSpaceshipName.
	^ spaceship laps + 1
]

{ #category : 'accessing' }
RacingTheSpace >> numberOfCardsOf: aSpaceshipName [

	| spaceship |
	spaceship := self detectSpaceship: aSpaceshipName.
	^spaceship cards size.
	
	
]

{ #category : 'accessing' }
RacingTheSpace >> numberOfWinner [
	^state numberOfWinner.

]

{ #category : 'actions' }
RacingTheSpace >> playTurn [
	state playTurn: self.
	state applyEffect: self.
	
]

{ #category : 'accessing' }
RacingTheSpace >> positionOf: aSpaceshipName [

	| spaceship |
	spaceship := self detectSpaceship: aSpaceshipName.
	^spaceship position.
	
	
]

{ #category : 'ranking' }
RacingTheSpace >> ranking [
	| orderedSpaceships response |
	response := OrderedCollection new.
	orderedSpaceships := self sortSpaceshipsByPosition.
	orderedSpaceships do: [ :spaceship | response add: spaceship name].
	^ response.

]

{ #category : 'ranking' }
RacingTheSpace >> rankingOf: aSpaceShipName [ 
	| orderedSpaceships spaceship ranking |
	orderedSpaceships := self sortSpaceshipsByPosition.
	spaceship := self detectSpaceship: aSpaceShipName.
	ranking := orderedSpaceships indexOf: spaceship.
	
	^ ranking.
]

{ #category : 'initialization' }
RacingTheSpace >> setEnded: anEndedState [
	state  := anEndedState.
]

{ #category : 'accessing' }
RacingTheSpace >> showEachSpaceshipGamePosition [
	| result |
	result := OrderedCollection new.
	spaceships do: [ :spaceship | result add: spaceship position ].
	^ result

]

{ #category : 'accessing' }
RacingTheSpace >> showEachSpaceshipLap [
	| response |
	response := OrderedCollection new.
	spaceships collect: [ :spaceship  | response add: (spaceship laps + 1)].
	^response.
]

{ #category : 'accessing' }
RacingTheSpace >> showEachSpaceshipNumberOfSquare [
	| response |
	response := OrderedCollection new.
	spaceships collect: [ :spaceship  | response add: spaceship numberOfSquares ].
	^response.
]

{ #category : 'ranking' }
RacingTheSpace >> sortSpaceshipsByPosition [

	| orderedSpaceships |
	orderedSpaceships := spaceships asSortedCollection: [ :shipA :shipB |
		                     shipA isAheadOf: shipB ].
	^ orderedSpaceships
]

{ #category : 'accessing' }
RacingTheSpace >> spaceships: anObject [

	^ spaceships := anObject
]

{ #category : 'as yet unclassified' }
RacingTheSpace >> throw: aCard to: aDefendingPlayer by: anAttackingPlayer [
	state throw: aCard to: aDefendingPlayer by: anAttackingPlayer.

	
	
	
	

]
