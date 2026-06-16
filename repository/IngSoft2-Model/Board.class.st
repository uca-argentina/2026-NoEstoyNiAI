Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'laps',
		'totalParsecs'
	],
	#classInstVars : [
		'size'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Board class >> withSquares: aCollectionOfSquares andLaps: aNumberOfLaps [
	^self new initializeWith: aCollectionOfSquares  and:aNumberOfLaps and: aCollectionOfSquares size. 
]

{ #category : 'as yet unclassified' }
Board class >> withSquares: aCollectionOfSquares andLaps: aNumberOfLaps andParsecs: aNumberOfParsecs [
	^self new initializeWith: aCollectionOfSquares  and:aNumberOfLaps and: aNumberOfParsecs . 
]

{ #category : 'accessing' }
Board >> boardSize [
	^ squares size.
]

{ #category : 'actions' }
Board >> callEffect: currentPlayer and: spaceships [
	| context |
    context := TurnContext with: spaceships and: currentPlayer and: self.
    ^ (squares at: currentPlayer numberOfSquares) triggerEffect: context.

	"^ (squares at: currentPlayer numberOfSquares) triggerEffect: spaceships and: currentPlayer."
]

{ #category : 'actions' }
Board >> initializeWith: aCollectionOfSquares  and:aNumberOfLaps and: aNumberOfParsecs [
	squares := aCollectionOfSquares.
	laps := aNumberOfLaps.
	totalParsecs := aNumberOfParsecs .
]

{ #category : 'accessing' }
Board >> laps [
	^laps.
]

{ #category : 'as yet unclassified' }
Board >> parsecsToSquares: aParsecValue [
    ^ aParsecValue * (squares size // totalParsecs).
]
