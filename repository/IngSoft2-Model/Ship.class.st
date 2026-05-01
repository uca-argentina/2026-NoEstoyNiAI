Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> withName: aName [
	^self new initializeWithName: aName.
]

{ #category : 'initialization' }
Ship >> initializeWithName: aName [
	position := 0.
	name:= aName.
]

{ #category : 'as yet unclassified' }
Ship >> moveFoward: dicesResult [
	position := position + dicesResult.
]

{ #category : 'as yet unclassified' }
Ship >> returnName [
	^name.
]

{ #category : 'as yet unclassified' }
Ship >> returnPosition [
	^position.
]
