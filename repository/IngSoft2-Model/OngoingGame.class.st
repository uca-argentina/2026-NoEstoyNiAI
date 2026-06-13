Class {
	#name : 'OngoingGame',
	#superclass : 'Object',
	#instVars : [
		'board',
		'dices',
		'spaceships',
		'currentShift',
		'lastEffect',
		'permanentCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
OngoingGame class >> withDices: someDices andBoard: aBoard andSpaceships: spaceShips [
	^self new initializeWithDices: someDices andBoard: aBoard andSpaceships: spaceShips.
]

{ #category : 'adding' }
OngoingGame >> addActivePermanentCard: aCard [
	permanentCards add: aCard.
]

{ #category : 'actions' }
OngoingGame >> applyEffect: aGame [
    | currentPlayer |
    currentPlayer := spaceships at: currentShift.
    lastEffect := board callEffect: currentPlayer and: spaceships.
    currentPlayer wrapIfNeeded: board boardSize.
    self setIfGameEnded: currentPlayer andGame: aGame.
    self incrementCurrentShift.
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
	lastEffect := NoEffectSquare new.
	permanentCards := OrderedCollection new.
]

{ #category : 'testing' }
OngoingGame >> isCurrentTurnOf: aSpaceship [
	^(spaceships at: currentShift) = aSpaceship
]

{ #category : 'testing' }
OngoingGame >> isEnded [
	^ false.
]

{ #category : 'as yet unclassified' }
OngoingGame >> isPermanentCardInGame: aCard [
	^permanentCards anySatisfy: [ :card| card == aCard ]
]

{ #category : 'accessing' }
OngoingGame >> isSpaceshipInGame: aSpaceship [
	^spaceships anySatisfy: [ :spaceship | spaceship = aSpaceship ]
]

{ #category : 'accessing' }
OngoingGame >> numberOfPlayers [
	^ spaceships size
]

{ #category : 'ranking' }
OngoingGame >> numberOfWinner [ 
	Error signal: 'There is no winner yet. The game is not finished' 
	
]

{ #category : 'as yet unclassified' }
OngoingGame >> permanentCardsModifierFor: aSpaceship [
    ^ permanentCards sum: [ :card | card modifierFor: aSpaceship ]
]

{ #category : 'initialization' }
OngoingGame >> playTurn: aGame [
    | diceResult currentPlayer totalResult |
    
    currentPlayer := spaceships at: currentShift.
    
    diceResult := self throwDices.
    totalResult := diceResult + (self permanentCardsModifierFor: currentPlayer).
    
    currentPlayer moveForward: totalResult.
    currentPlayer wrapIfNeeded: board boardSize.
    
    self setIfGameEnded: currentPlayer andGame: aGame.
	
]

{ #category : 'adding' }
OngoingGame >> removeActivePermanentCard: aCard [
	permanentCards remove: aCard.
]

{ #category : 'actions' }
OngoingGame >> repeatLastEffectOn: aSpaceship [ 
	| currentSpaceship |
	currentSpaceship := spaceships detect: [:spaceship | spaceship = aSpaceship ].
	lastEffect triggerEffect: spaceships and: currentSpaceship .
	currentSpaceship wrapIfNeeded: board boardSize.
]

{ #category : 'initialization' }
OngoingGame >> setIfGameEnded: currentPlayer andGame: aGame [
 (currentPlayer laps >= board laps or:(currentPlayer numberOfSquares = board boardSize and: currentPlayer laps = (board laps - 1))) 
	ifTrue: [  aGame setEnded: (EndedGame withSpaceShips: spaceships) ].
	

]

{ #category : 'as yet unclassified' }
OngoingGame >> throw: aCard to: aTarget by: anAttackingSpaceship [
 
    (aCard canBeThrownBy: anAttackingSpaceship in: self) ifFalse:  [ self error: 'You cannot throw a card when is not your turn' ].
    (aCard validTarget: aTarget in: self) ifFalse: [self error: 'You cannot throw a card to an inexistent target' ].
    (anAttackingSpaceship hasCard: aCard) 
        ifFalse: [ self error: 'You cannot throw a card you dont have' ].
	anAttackingSpaceship removeCard: aCard.
	aCard beThrownTo: aTarget by: anAttackingSpaceship in: self.
    	
]

{ #category : 'actions' }
OngoingGame >> throwDices [

	| sumOfDices |
	
	sumOfDices:= dices inject: 0 into: [:sum :dice | sum + dice roll ].

	^sumOfDices .
]
