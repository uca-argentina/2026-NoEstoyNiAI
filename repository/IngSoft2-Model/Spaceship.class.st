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

{ #category : 'as yet unclassified' }
Spaceship >> moveFoward: dicesResult [
	position := position + dicesResult.
]

{ #category : 'as yet unclassified' }
Spaceship >> returnName [
	^name.
]

{ #category : 'as yet unclassified' }
Spaceship >> returnPosition [
	^position.
]
