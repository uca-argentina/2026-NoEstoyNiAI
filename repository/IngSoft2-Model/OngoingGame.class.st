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
	lastEffect := nil.
	permanentCards := OrderedCollection new.
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

{ #category : 'initialization' }
OngoingGame >> setIfGameEnded: currentPlayer andGame: aGame [
 (currentPlayer laps >= board laps or:(currentPlayer numberOfSquares = board boardSize and: currentPlayer laps = (board laps - 1))) 
	ifTrue: [  aGame setEnded: (EndedGame withSpaceShips: spaceships) ].
	

]

{ #category : 'as yet unclassified' }
OngoingGame >> throw: aCard to: aTargetSpaceship by: anAttackingSpaceship [
   | internalDefender |
    ((spaceships at: currentShift) = anAttackingSpaceship) 
        ifFalse: [ self error: 'You cannot throw a card when is not your turn' ].
    internalDefender := spaceships 
        detect: [ :spaceship | spaceship = aTargetSpaceship ]
        ifNone: [ self error: 'You cannot throw a card to an inexistant player' ].
    (anAttackingSpaceship hasCard: aCard) 
        ifFalse: [ self error: 'You cannot throw a card you dont have' ].
	aCard beThrownTo: aTargetSpaceship by: anAttackingSpaceship in: self.
    "aCard triggerEffectTo: internalDefender by: anAttackingSpaceship andSpaceships: spaceships andLastEffect: lastEffect."
	
]

{ #category : 'actions' }
OngoingGame >> throwDices [

	| sumOfDices |
	
	sumOfDices:= dices inject: 0 into: [:sum :dice | sum + dice roll ].

	^sumOfDices .
]
