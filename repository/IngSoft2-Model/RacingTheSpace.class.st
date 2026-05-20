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
	aNumberOfLaps < 1 ifTrue: [ Error signal: 'You Cannot Create a Game With Less Than 1 lap' ].
	^self new initializeWithDices: aCollectionOfDices andBoardSize: aSize andSpaceships: aNumberOfSpaceships andLaps: aNumberOfLaps.
]

{ #category : 'initialization' }
RacingTheSpace >> createSpaceships: aNumberOfPlayers [

	^ spaceships := (1 to: aNumberOfPlayers) collect: [ :index |Spaceship withName: index andPosition: (Position withNumberOfSquare: 0 andLaps: 0 ) ]
]

{ #category : 'private' }
RacingTheSpace >> detectSpaceship: aSpaceshipName [

	| spaceship |
	spaceship := spaceships detect: [ :ship | ship name = aSpaceshipName ].
	^ spaceship
]

{ #category : 'initialization' }
RacingTheSpace >> initializeWithDices: aCollectionOfDices andBoardSize: aSize andSpaceships: aNumberOfSpaceships andLaps: aNumberOfLaps [
	|aBoard|
	aBoard := Board withSize: aSize andLaps: aNumberOfLaps.
	currentShift := 1.
	gameEnded := false.
	self createSpaceships: aNumberOfSpaceships.
	state := StartedGame withDices: aCollectionOfDices andBoard: aBoard andSpaceships: spaceships.
 .
]

{ #category : 'testing' }
RacingTheSpace >> isEnded [
	^ state isEnded.
]

{ #category : 'accessing' }
RacingTheSpace >> lapOf: aSpaceshipName [

	| spaceship |
	spaceship := self detectSpaceship: aSpaceshipName.
	^ spaceship laps
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

{ #category : 'ranking' }
RacingTheSpace >> positionInRankingOf: aSpaceShipName [ 
	| orderedSpaceships spaceship ranking |
	orderedSpaceships := self sortSpaceshipsByPosition.
	spaceship := self detectSpaceship: aSpaceShipName.
	ranking := orderedSpaceships indexOf: spaceship.
	
	^ ranking.
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
	spaceships collect: [ :spaceship  | response add: spaceship laps].
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
