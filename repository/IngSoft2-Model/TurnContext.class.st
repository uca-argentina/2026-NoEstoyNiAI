Class {
	#name : 'TurnContext',
	#superclass : 'Object',
	#instVars : [
		'spaceships',
		'currentSpaceship',
		'board'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
TurnContext class >> with: someSpaceships and: aSpaceship and: aBoard [
	^self new initializeWith: someSpaceships and: aSpaceship and: aBoard.
]

{ #category : 'as yet unclassified' }
TurnContext >> giveCardToCurrentSpaceship: aCard [
    currentSpaceship addCard: aCard.
]

{ #category : 'initialization' }
TurnContext >> initializeWith: someSpaceships and: aSpaceship [
	spaceships:= someSpaceships.
	currentSpaceship:= aSpaceship.
]

{ #category : 'initialization' }
TurnContext >> initializeWith: someSpaceships and: aSpaceship and: aBoard [
	spaceships:= someSpaceships.
	currentSpaceship:= aSpaceship.
	board := aBoard.
]

{ #category : 'as yet unclassified' }
TurnContext >> moveAllSpaceshipsToStart [
	spaceships do: [ :spaceship | spaceship resetToBeginning ].
]

{ #category : 'as yet unclassified' }
TurnContext >> moveCurrentSpaceshipBackwards: aNumberOfSquares [
    currentSpaceship moveBackwards: aNumberOfSquares.
]

{ #category : 'as yet unclassified' }
TurnContext >> moveCurrentSpaceshipForward: aNumberOfSquares [
	currentSpaceship moveForward: aNumberOfSquares.
]

{ #category : 'as yet unclassified' }
TurnContext >> moveOtherSpaceshipsBackwards: aNumberOfSquares [
	spaceships reject: [ :spaceship | spaceship = currentSpaceship ] thenDo: [ :spaceship | spaceship moveBackwards: aNumberOfSquares ].
]

{ #category : 'as yet unclassified' }
TurnContext >> parsecsToSquares: aParsecValue [
    ^ board parsecsToSquares: aParsecValue.
]
