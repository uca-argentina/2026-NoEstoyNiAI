Class {
	#name : 'EndedGame',
	#superclass : 'Object',
	#instVars : [
		'spaceships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
EndedGame class >> withSpaceShips: someSpaceships [
	^self new initializeWithSpaceShips: someSpaceships 
]

{ #category : 'actions' }
EndedGame >> applyEffect: aGame [
]

{ #category : 'initialization' }
EndedGame >> initializeWithSpaceShips:  someSpaceShips [
	spaceships := someSpaceShips.
]

{ #category : 'testing' }
EndedGame >> isEnded [ 
	^true
]

{ #category : 'ranking' }
EndedGame >> numberOfWinner [ 
	^ (self obtainNameOfTheSpaceshipWithTheHigherPosition) name
]

{ #category : 'ranking' }
EndedGame >> obtainNameOfTheSpaceshipWithTheHigherPosition [

    | maxSpaceship |
	maxSpaceship := spaceships first.
	spaceships do: [ :spaceShip |
        (spaceShip isAheadOf: maxSpaceship)
            ifTrue: [ maxSpaceship := spaceShip  ].
    ].

    ^ maxSpaceship 
]

{ #category : 'actions' }
EndedGame >> playTurn: aGame [
	Error signal: 'You Cannot Throw, The Game Ended'.
]

{ #category : 'as yet unclassified' }
EndedGame >> throw: aCard to: aDefendingPlayer by: anAttackingPlayer [

	self error: 'You cannot throw a card when the game is ended'
]
