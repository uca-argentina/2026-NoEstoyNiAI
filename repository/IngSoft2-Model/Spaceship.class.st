Class {
	#name : 'Spaceship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Spaceship class >> withName: aName andPosition: aPosition [ 
	^self new initializeWithName: aName andPosition: aPosition .
]

{ #category : 'initialization' }
Spaceship >> initializeWithName: aName andPosition: aPosition [
	position := aPosition .
	name:= aName.

]

{ #category : 'testing' }
Spaceship >> isAheadOf: anotherSpaceship [
	^ anotherSpaceship position <  position
]

{ #category : 'accessing' }
Spaceship >> laps [
	^ position lap.
]

{ #category : 'actions' }
Spaceship >> moveBackwards: aNumberOfSquares [ 
	position decrementNumberOfSquaresBy: aNumberOfSquares
]

{ #category : 'actions' }
Spaceship >> moveForward: aNumberOfSquares [
	position incrementNumberOfSquaresBy: aNumberOfSquares
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
