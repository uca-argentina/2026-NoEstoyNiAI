Class {
	#name : 'OngoingGame',
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
OngoingGame class >> withDices: someDices andBoard: aBoard andSpaceships: spaceShips [
	^self new initializeWithDices: someDices andBoard: aBoard andSpaceships: spaceShips.
]

{ #category : 'actions' }
OngoingGame >> applyEffect: aGame [
	| currentPlayer |
	currentPlayer := spaceships at: currentShift.
	board callEffect: currentPlayer and: spaceships.
	currentPlayer wrapIfNeeded: board boardSize .
	self setIfGameEnded: currentPlayer andGame: aGame.

	self incrementCurrentShift
]

{ #category : 'private' }
OngoingGame >> incrementCurrentShift [

	^ currentShift := currentShift \\ self numberOfPlayers + 1
]

{ #category : 'initialization' }
OngoingGame >> initializeWithDices: someDices andBoard: aBoard andSpaceships: spaceShips [ 
	board:= aBoard .
	dices := someDices.
	spaceships := spaceShips.
	currentShift := 1.
]

{ #category : 'testing' }
OngoingGame >> isEnded [
	^ false.
]

{ #category : 'accessing' }
OngoingGame >> numberOfPlayers [
	^ spaceships size
]

{ #category : 'ranking' }
OngoingGame >> numberOfWinner [ 
	Error signal: 'There is no winner yet. The game is not finished' 
	
]

{ #category : 'initialization' }
OngoingGame >> playTurn: aGame [
	| result currentPlayer |
	
	result := self throwDices.
	currentPlayer := spaceships at: currentShift.
	currentPlayer moveForward: result.
	currentPlayer wrapIfNeeded: (board boardSize).
	self setIfGameEnded: currentPlayer andGame: aGame .

	
]

{ #category : 'initialization' }
OngoingGame >> setIfGameEnded: currentPlayer andGame: aGame [
 (currentPlayer laps >= board laps or:(currentPlayer numberOfSquares = board boardSize and: currentPlayer laps = (board laps - 1))) 
	ifTrue: [  aGame setEnded: (EndedGame withSpaceShips: spaceships) ].
	

]

{ #category : 'actions' }
OngoingGame >> throwDices [

	| sumOfDices |
	
	sumOfDices:= dices inject: 0 into: [:sum :dice | sum + dice roll ].

	^sumOfDices .
]
