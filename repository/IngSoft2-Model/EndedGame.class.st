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

{ #category : 'as yet unclassified' }
EndedGame >> applyEffect: aGame [
]

{ #category : 'initialization' }
EndedGame >> initializeWithSpaceShips:  someSpaceShips [
	spaceships := someSpaceShips.
]

{ #category : 'as yet unclassified' }
EndedGame >> isEnded [ 
	^true
]

{ #category : 'as yet unclassified' }
EndedGame >> numberOfWinner [ 
	^ (self obtainNameOfTheSpaceshipWithTheHigherPosition) name
]

{ #category : 'as yet unclassified' }
EndedGame >> obtainNameOfTheSpaceshipWithTheHigherPosition [

    | maxSpaceship |
	maxSpaceship := spaceships first.
	spaceships do: [ :spaceShip |
        (spaceShip isAheadOf: maxSpaceship)
            ifTrue: [ maxSpaceship := spaceShip  ].
    ].

    ^ maxSpaceship 
]

{ #category : 'as yet unclassified' }
EndedGame >> playTurn: aGame [
	Error signal: 'You Cannot Throw, The Game Ended'.
]
