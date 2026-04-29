Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'numberOfFaces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Dice class >> default [
	^self new initializeWithFaces: 6.
]

{ #category : 'as yet unclassified' }
Dice class >> withFaces: numberOfFaces [ 
	(numberOfFaces < 4) ifTrue: [Error signal: 'A Dice can not be created with less than 4 faces'].
	^(self new) initializeWithFaces: numberOfFaces.
]

{ #category : 'initialization' }
Dice >> initializeWithFaces: aNumberOfFaces [ 
	numberOfFaces:= aNumberOfFaces.
]

{ #category : 'as yet unclassified' }
Dice >> throw [
	| rng |
	rng:= Random new.
	^ (rng nextInteger: numberOfFaces).
]
