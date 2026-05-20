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

{ #category : 'instance creation' }
Board class >> withSize: aSize [
	^(self new) initializeWithSize:  aSize andLaps: 1.
]

{ #category : 'as yet unclassified' }
Board class >> withSize: aNumberOfSquares andLaps: aNumberOfLaps [ 
	^self new initializeWithSize: aNumberOfSquares andLaps: aNumberOfLaps .
]

{ #category : 'accessing' }
Board >> boardSize [
	^ squares size.
]

{ #category : 'actions' }
Board >> callEffect: currentPlayer and: spaceships [
	(squares at: currentPlayer numberOfSquares) triggerEffect: spaceships and: currentPlayer.
]

{ #category : 'initialization' }
Board >> initializeWithSize: aNumberOfSquares andLaps: aNumberOfLaps [ 
	laps:= aNumberOfLaps .
	squares := OrderedCollection new.
	
	aNumberOfSquares timesRepeat: [ squares add: NoEffectSquare new ].
	
	aNumberOfSquares > 80 ifTrue: [squares at: 80 put: WormHoleSquare new].
	aNumberOfSquares > 80 ifTrue: [squares at: 81 put: SpeedUpSquare new].
	aNumberOfSquares > 80 ifTrue: [squares at: 82 put: (MoonWalkSquare withN: 5)].
	aNumberOfSquares > 80 ifTrue: [squares at: 83 put: (MoonWalkSquare withN: 6)].
	aNumberOfSquares > 80 ifTrue: [squares at: 84 put: (HyperJumpSquare withParsecs: #(10 11 12) andRelation: 2)].
	aNumberOfSquares > 80 ifTrue: [squares at: 85 put: (AtomicBombSquare new)].
	aNumberOfSquares > 200 ifTrue: [squares at: 2 put: WormHoleSquare new].
	
]

{ #category : 'testing' }
Board >> isFinishedAt: aPosition [
	^ squares size <= aPosition
]

{ #category : 'accessing' }
Board >> laps [
	^laps.
]
