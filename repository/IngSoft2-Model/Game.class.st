Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Game class >> default [

^ (self new) initializeWithDices: (FixedDice withFixedResult: 10).
]

{ #category : 'initialization' }
Game >> initializeWithDices: aDice [

dice := aDice
]

{ #category : 'as yet unclassified' }
Game >> throwDices [
	|suma|
	
	suma := dice throw.
	
	^ suma
]
