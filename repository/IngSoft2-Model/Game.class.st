Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'size',
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Game class >> default [
	| aCollectionOfDices |
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (FixedDice withFixedResult: 10).
	^ (self new) initializeWithDices: aCollectionOfDices andSize: 30.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices [ 	

	^self new initializeWithDices: aCollectionOfDices andSize: 30.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices withSize: aSize [ 
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize.
]

{ #category : 'initialization' }
Game >> initializeWithDices: aCollectionOfDices andSize: aSize [ 
	dices := aCollectionOfDices .
	size := aSize. 
	position := 0.
]

{ #category : 'as yet unclassified' }
Game >> throwDices [

	(position > size) ifTrue: [Error signal:'You Cannot Throw, The Game Ended'  ].
	position:= position + (dices inject: 0 into: [:suma :dado | suma + dado throw ]).

	^position.
	
	
]
