Class {
	#name : 'HyperJumpSquare',
	#superclass : 'Object',
	#instVars : [
		'parsecs',
		'currentParsecPosition',
		'parsecsToSquares'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJumpSquare class >> withParsecs: aCollectionOfParsecs andRelation: aRelation [
	^self new initializeWithParsecs: aCollectionOfParsecs andRelation: aRelation.
]

{ #category : 'initialization' }
HyperJumpSquare >> initializeWithParsecs: aCollectionOfParsecs andRelation: aRelation [
	parsecs := (aCollectionOfParsecs asSortedCollection: [:a :b | a > b]) asOrderedCollection.
	parsecsToSquares := aRelation.
	currentParsecPosition := 1.
]

{ #category : 'actions' }
HyperJumpSquare >> parsecs [
 ^parsecs 
]

{ #category : 'actions' }
HyperJumpSquare >> parsecsToSquares [ 
^parsecsToSquares 
]

{ #category : 'actions' }
HyperJumpSquare >> triggerEffect: aTurnContext [
    | positionsToAdvance |
    positionsToAdvance := (parsecs at: currentParsecPosition) * parsecsToSquares.
    currentParsecPosition := currentParsecPosition \\ parsecs size + 1.
    aTurnContext moveCurrentSpaceshipForward: positionsToAdvance.
    ^ self.
]

{ #category : 'actions' }
HyperJumpSquare >> triggerEffect: spaceships and: theCurrentSpaceship [
	|positionsToAdvance|
	positionsToAdvance := (parsecs at: currentParsecPosition) * parsecsToSquares.
	currentParsecPosition := currentParsecPosition \\ parsecs size + 1.
	theCurrentSpaceship moveForward: positionsToAdvance.
	 ^ self.
	
]
