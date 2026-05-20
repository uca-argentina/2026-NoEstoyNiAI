Class {
	#name : 'StartedGame',
	#superclass : 'Object',
	#instVars : [
		'board',
		'dices',
		'spaceships',
		'currentShift'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
StartedGame class >> withDices: someDices andBoard: aBoard andSpaceships: spaceShips [
	^self new initializeWithDices: someDices andBoard: aBoard andSpaceships: spaceShips.
]

{ #category : 'as yet unclassified' }
StartedGame >> applyEffect: aGame [
	| currentPlayer |
	currentPlayer := spaceships at: currentShift.
	board callEffect: currentPlayer and: spaceships.
	currentPlayer wrapIfNeeded: board boardSize .
	self setIfGameEnded: currentPlayer andGame: aGame.

	self incrementCurrentShift
]

{ #category : 'as yet unclassified' }
StartedGame >> incrementCurrentShift [

	^ currentShift := currentShift \\ self numberOfPlayers + 1
]

{ #category : 'initialization' }
StartedGame >> initializeWithDices: someDices andBoard: aBoard andSpaceships: spaceShips [ 
	board:= aBoard .
	dices := someDices.
	spaceships := spaceShips.
	currentShift := 1.
]

{ #category : 'as yet unclassified' }
StartedGame >> isEnded [
	^ false.
]

{ #category : 'as yet unclassified' }
StartedGame >> numberOfPlayers [
	^ spaceships size
]

{ #category : 'as yet unclassified' }
StartedGame >> numberOfWinner [ 
	Error signal: 'There is no winner yet. The game is not finished' 
	
]

{ #category : 'initialization' }
StartedGame >> playTurn: aGame [
	| result currentPlayer |
	
	result := self throwDices.
	currentPlayer := spaceships at: currentShift.
	currentPlayer moveForward: result.
	currentPlayer wrapIfNeeded: (board boardSize).
	self setIfGameEnded: currentPlayer andGame: aGame .

	
]

{ #category : 'initialization' }
StartedGame >> setIfGameEnded: currentPlayer andGame: aGame [
 (currentPlayer laps >= board laps or:(currentPlayer numberOfSquares = board boardSize and: currentPlayer laps = (board laps - 1))) 
	ifTrue: [  aGame setEnded: (EndedGame withSpaceShips: spaceships) ].
	

]

{ #category : 'as yet unclassified' }
StartedGame >> throwDices [

	| sumOfDices |
	
	sumOfDices:= dices inject: 0 into: [:sum :dice | sum + dice roll ].

	^sumOfDices .
]
