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
	
  
	^self new initializeWithUnits: aCollectionOfParsecs sort reverse.
	 

]

{ #category : 'as yet unclassified' }
HyperJumpSquare class >> withUnits: aCollectionOfUnits [
    ^ self new initializeWithUnits: aCollectionOfUnits.
]

{ #category : 'initialization' }
HyperJumpSquare >> initializeWithUnits: aCollectionOfUnits [
    | convertedParsecs |
    convertedParsecs := (aCollectionOfUnits collect: [:unit | unit asParsecs]) asOrderedCollection.
    (convertedParsecs = (convertedParsecs asSortedCollection: [:a :b | a > b]) asOrderedCollection)
        ifFalse: [ Error signal: 'Parsecs must be sorted from highest to lowest' ].
    parsecs := convertedParsecs.
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
