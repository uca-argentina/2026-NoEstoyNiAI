Class {
	#name : 'HyperJumpSquare',
	#superclass : 'Object',
	#instVars : [
		'parsecs',
		'currentParsecPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJumpSquare class >> withParsecs: aCollectionOfParsecs [

    (aCollectionOfParsecs = (aCollectionOfParsecs asSortedCollection: [:a :b | a > b]) asOrderedCollection)
        ifFalse: [ self error: 'Parsecs must be sorted from highest to lowest' ].
  
	^self new initializeWithParsecs: aCollectionOfParsecs.
	

]

{ #category : 'initialization' }
HyperJumpSquare >> initializeWithParsecs: aCollectionOfParsecs [
	 parsecs := (aCollectionOfParsecs asSortedCollection: [:a :b | a > b]) asOrderedCollection.
    currentParsecPosition := 1.
]

{ #category : 'actions' }
HyperJumpSquare >> parsecs [
 ^parsecs 
]

{ #category : 'actions' }
HyperJumpSquare >> triggerEffect: aTurnContext [
    | positionsToAdvance parsec |
    parsec := parsecs at: currentParsecPosition.
    currentParsecPosition := currentParsecPosition \\ parsecs size + 1.
    positionsToAdvance := aTurnContext parsecsToSquares: parsec.
    aTurnContext moveCurrentSpaceshipForward: positionsToAdvance.
    ^ self.
]
