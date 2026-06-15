Class {
	#name : 'TurnContext',
	#superclass : 'Object',
	#instVars : [
		'spaceships',
		'currentSpaceship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
TurnContext class >> with: someSpaceships and: aSpaceship [
	^self new initializeWith: someSpaceships and: aSpaceship.
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
