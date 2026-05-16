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
Spaceship class >> withName: aName [
	^self new initializeWithName: aName.
]

{ #category : 'initialization' }
Spaceship >> initializeWithName: aName [
	position := 0.
	name:= aName.
]

{ #category : 'testing' }
Spaceship >> isAheadOf: anotherSpaceship [
    ^ anotherSpaceship isBehindPosition: position.
]

{ #category : 'testing' }
Spaceship >> isBehindPosition: aPosition [
    ^ position < aPosition
]

{ #category : 'as yet unclassified' }
Spaceship >> moveBackwards: anInteger [ 
	^ position := position - anInteger.
]

{ #category : 'as yet unclassified' }
Spaceship >> moveForward: aNumberOfSquares [
	^ position := position + aNumberOfSquares.
]

{ #category : 'as yet unclassified' }
Spaceship >> name [
	^name.
]

{ #category : 'initialization' }
Spaceship >> resetToBeginning [
	position := 1.
]

{ #category : 'as yet unclassified' }
Spaceship >> showPosition: result [
	^ result nextPutAll: '[Player ' , name printString , ' is on square ', position printString , '] '
]
