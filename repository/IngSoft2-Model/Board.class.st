Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'laps'
	],
	#classInstVars : [
		'size'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> withSquares: aCollectionOfSquares andLaps: aNumberOfLaps [
	^self new initializeWith: aCollectionOfSquares  and:aNumberOfLaps. 
]

{ #category : 'accessing' }
Board >> boardSize [
	^ squares size.
]

{ #category : 'actions' }
Board >> callEffect: currentPlayer and: spaceships [
	(squares at: currentPlayer numberOfSquares) triggerEffect: spaceships and: currentPlayer.
]

{ #category : 'actions' }
Board >> initializeWith: aCollectionOfSquares  and:aNumberOfLaps [
	squares := aCollectionOfSquares.
	laps := aNumberOfLaps.
]

{ #category : 'accessing' }
Board >> laps [
	^laps.
]
