Class {
	#name : 'Spaceship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'name',
		'cards',
		'effectsFromPermanentsCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Spaceship class >> withName: aName andCards: someCards [ 
	^ self new initializeWithName: aName andPosition: (Position withNumberOfSquare: 0 andLaps: 0) andCards: someCards.
	
]

{ #category : 'as yet unclassified' }
Spaceship class >> withName: aName andPosition: aPosition [ 
	^self new initializeWithName: aName andPosition: aPosition andCards: OrderedCollection new.
]

{ #category : 'comparing' }
Spaceship >> = anotherSpaceship [
	^ anotherSpaceship name = name.
]

{ #category : 'testing' }
Spaceship >> hasCard: aCard [
^ cards anySatisfy: [ :card | card = aCard ]
]

{ #category : 'initialization' }
Spaceship >> initializeWithName: aName andPosition: aPosition andCards: someCards [ 
	name := aName .
	position := aPosition .
	cards := someCards .
	effectsFromPermanentsCards := OrderedCollection new.
]

{ #category : 'testing' }
Spaceship >> isAheadOf: anotherSpaceship [
	^ anotherSpaceship position <  position
]

{ #category : 'accessing' }
Spaceship >> laps [
	^ position lap.
]

{ #category : 'as yet unclassified' }
Spaceship >> modifyThrowingBy: aNumber [
	effectsFromPermanentsCards add: aNumber .
]

{ #category : 'actions' }
Spaceship >> moveBackwards: aNumberOfSquares [ 
	position decrementNumberOfSquaresBy: aNumberOfSquares
]

{ #category : 'actions' }
Spaceship >> moveForward: aNumberOfSquares [
	position incrementNumberOfSquaresBy: aNumberOfSquares. 
]

{ #category : 'accessing' }
Spaceship >> name [
	^name.
]

{ #category : 'accessing' }
Spaceship >> numberOfSquares [
	^ position numberOfSquares.
]

{ #category : 'accessing' }
Spaceship >> position [
	^ position position.
]

{ #category : 'initialization' }
Spaceship >> resetToBeginning [

	position := Position withNumberOfSquare: 1 andLaps: position lap
]

{ #category : 'actions' }
Spaceship >> wrapIfNeeded: aBoardSize [
	position wrapIfNeeded: aBoardSize.
]
