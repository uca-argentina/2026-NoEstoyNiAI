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
Spaceship >> isAheadOf: anotherSpaceshipPosition [

	^ position > anotherSpaceshipPosition
]

{ #category : 'testing' }
Spaceship >> isPositionGreaterThan: maxPosition [
	^ position > maxPosition
]

{ #category : 'as yet unclassified' }
Spaceship >> moveFoward: dicesResult [
	^ position := position + dicesResult.
]

{ #category : 'as yet unclassified' }
Spaceship >> returnName [
	^name.
]

{ #category : 'as yet unclassified' }
Spaceship >> showPosition: result [
	^ result nextPutAll: '[Player ' , name printString , ' is on square ', position printString , '] '
]
