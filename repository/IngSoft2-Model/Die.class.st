Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'numberOfFaces',
		'rng'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Die class >> default [
	^self new initializeWithFaces: 6.
]

{ #category : 'as yet unclassified' }
Die class >> withFaces: numberOfFaces [ 

	(numberOfFaces isInteger) ifFalse: [Error signal: 'A Dice can not be created with a not integer type of faces'].
	(numberOfFaces < 4) ifTrue: [Error signal: 'A Dice can not be created with less than 4 faces'].
	
	
	
	^(self new) initializeWithFaces: numberOfFaces.
]

{ #category : 'initialization' }
Die >> initializeWithFaces: aNumberOfFaces [ 
	numberOfFaces:= aNumberOfFaces.
	rng:= Random new.
]

{ #category : 'actions' }
Die >> roll [
	^ (rng nextInteger: numberOfFaces).
]
