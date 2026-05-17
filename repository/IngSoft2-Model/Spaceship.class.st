Class {
	#name : 'Spaceship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'name',
		'laps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Spaceship class >> withName: aName [
	^self new initializeWithName: aName.
]

{ #category : 'adding' }
Spaceship >> addLap [
	laps := laps + 1.
]

{ #category : 'initialization' }
Spaceship >> initializeWithName: aName [
	position := 0.
	name:= aName.
	laps := 0.
]

{ #category : 'testing' }
Spaceship >> isAheadOf: anotherSpaceship [
    ^ anotherSpaceship isBehindPosition: position andLaps: laps.
]

{ #category : 'testing' }
Spaceship >> isBehindPosition: aPosition andLaps: aLaps [

	aLaps = laps ifTrue: [ ^ position < aPosition ].
	^ laps < aLaps
]

{ #category : 'accessing' }
Spaceship >> laps [
	^ laps.
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

{ #category : 'accessing' }
Spaceship >> position [
	^ position.
]

{ #category : 'initialization' }
Spaceship >> resetToBeginning [
	position := 1.
]

{ #category : 'as yet unclassified' }
Spaceship >> showLap [
	^ 'The SpaceShip ' , name printString , ' is on ', (laps +1 ) printString , 'º lap'
]

{ #category : 'as yet unclassified' }
Spaceship >> showPosition: result [
	^ result nextPutAll: '[Player ' , name printString , ' is on square ', position printString , '] '
]

{ #category : 'as yet unclassified' }
Spaceship >> showRankedPosition: rankedPosition [ 
	^rankedPosition printString , 'º: Spaceship ', name printString.
]

{ #category : 'as yet unclassified' }
Spaceship >> wrapIfNeeded: aBoardSize [

	position >= aBoardSize ifTrue: [
			laps := laps + 1.
			position := (position - 1 \\ aBoardSize) + 1]
]
