Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares'
	],
	#classInstVars : [
		'size'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> withSize: aSize [
	^(self new) initializeWith: aSize.
]

{ #category : 'as yet unclassified' }
Board >> callEffect: currentPlayer and: spaceships [

	^ (squares at: currentPlayer position)
		  triggerEffect: spaceships 
		  and: currentPlayer.
]

{ #category : 'as yet unclassified' }
Board >> callEffect: currentPlayer and: currentPlayerPosition and: spaceships [

	^ (squares at: currentPlayerPosition)
		  triggerEffect: spaceships 
		  and: currentPlayer 
]

{ #category : 'initialization' }
Board >> initializeWith: numberOfSquares [

	squares := OrderedCollection new.
	
	numberOfSquares timesRepeat: [ squares add: NoEffectSquare new ].
	
	numberOfSquares > 80 ifTrue: [squares at: 80 put: WormHoleSquare new].
	numberOfSquares > 80 ifTrue: [squares at: 81 put: SpeedUpSquare new].
	numberOfSquares > 80 ifTrue: [squares at: 82 put: (MoonWalkSquare withN: 5)].
	numberOfSquares > 80 ifTrue: [squares at: 83 put: (MoonWalkSquare withN: 6)].
	numberOfSquares > 80 ifTrue: [squares at: 84 put: (HyperJumpSquare withParsecs: #(10 11 12) andRelation: 2)].
	numberOfSquares > 80 ifTrue: [squares at: 85 put: (AtomicBombSquare new)].
	
]

{ #category : 'testing' }
Board >> isFinishedAt: aPosition [
	^ squares size <= aPosition
]

{ #category : 'accessing' }
Board >> size [
	^ squares size.
]
