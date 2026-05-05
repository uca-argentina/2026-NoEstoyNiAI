Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'size',
		'spaceships',
		'currentShift',
		'gameEnded',
		'aNumberOfPlayers'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Game class >> default [
	| aCollectionOfDices |
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
	^ (self new) initializeWithDices: aCollectionOfDices andSize: 30 andSpaceships: 1.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices [ 	

	^self new initializeWithDices: aCollectionOfDices andSize: 30 andSpaceships: 1.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices withSize: aSize [ 
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize andSpaceships: 1.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices withSize: aSize withSpaceships: aNumberOfSpaceships [
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	aNumberOfSpaceships < 1 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 1 Player'].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize andSpaceships: aNumberOfSpaceships.
]

{ #category : 'as yet unclassified' }
Game >> createSpaceshipsInOrderedCollectionPlayers: aNumberOfPlayers [

	^ spaceships := (1 to: aNumberOfPlayers) collect: [ :index |
		             Spaceship withName: index ]
]

{ #category : 'as yet unclassified' }
Game >> incrementCurrentShift [

	^ currentShift := currentShift \\ spaceships size + 1
]

{ #category : 'initialization' }
Game >> initializeWithDices: aCollectionOfDices andSize: aSize andSpaceships: aNumberOfSpaceships [

	dices := aCollectionOfDices.
	size := aSize.
	currentShift := 1.
	gameEnded := false.
	self createSpaceshipsInOrderedCollectionPlayers: aNumberOfSpaceships
]

{ #category : 'testing' }
Game >> isEnded [
	^ gameEnded.
]

{ #category : 'as yet unclassified' }
Game >> numberOfWinner [

	| maxPosition |
	gameEnded ifFalse: [
		Error signal: 'There is no winner yet. The game is not finished' ].
	maxPosition := self obtainTheHigherPositionOfTheSpaceships.
	^ self obtainNameOfTheSpaceshipWithTheHigherPosition: maxPosition
]

{ #category : 'as yet unclassified' }
Game >> obtainNameOfTheSpaceshipWithTheHigherPosition: maxPosition [

	^ (spaceships detect: [ :nave | nave returnPosition = maxPosition ])
		  returnName
]

{ #category : 'as yet unclassified' }
Game >> obtainPositionsStringResult [

	| result |
	result := String new writeStream.
	spaceships do: [ :ship | result nextPutAll: '[Player ' , ship returnName printString , ' is on square ', ship returnPosition printString , '] ' ].
	^ result
]

{ #category : 'as yet unclassified' }
Game >> obtainTheHigherPositionOfTheSpaceships [

	| maxPositionSpaceship |
	maxPositionSpaceship := spaceships max: [ :nave | nave returnPosition ].
	^ maxPositionSpaceship
]

{ #category : 'as yet unclassified' }
Game >> playTurn [

	| result currentPlayerPosition |
	gameEnded ifTrue: [ Error signal: 'You Cannot Throw, The Game Ended' ].
	result := self throwDices.
	(spaceships at: currentShift) moveFoward: result.
	currentPlayerPosition := (spaceships at: currentShift) returnPosition.
	gameEnded := size <= currentPlayerPosition.
	self incrementCurrentShift.
	^ currentPlayerPosition
]

{ #category : 'as yet unclassified' }
Game >> showPositions [

	| resultString |
	resultString := self obtainPositionsStringResult.
	^ resultString contents
]

{ #category : 'as yet unclassified' }
Game >> throwDices [

	| sumOfDices |
	
	sumOfDices:= dices inject: 0 into: [:sum :dice | sum + dice throw ].

	^sumOfDices .
	
	
]
