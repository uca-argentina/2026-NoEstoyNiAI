Class {
	#name : 'Position',
	#superclass : 'Object',
	#instVars : [
		'numberOfSquare',
		'lap'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Position class >> withNumberOfSquare: aNumberOfSquare andLaps: aNumberOfLap [ 
	^self new initializeWithNumberOfSquare: aNumberOfSquare andLaps: aNumberOfLap.
]

{ #category : 'comparing' }
Position >> < aPosition [ 
	 lap < aPosition lap ifTrue: [ ^ true ].
    lap > aPosition lap ifTrue: [ ^ false ].
    ^ numberOfSquare < aPosition numberOfSquares
]

{ #category : 'as yet unclassified' }
Position >> = aPosition [
	^(numberOfSquare == aPosition numberOfSquares) and: (lap == aPosition lap)
]

{ #category : 'as yet unclassified' }
Position >> decrementLapsBy: aNumber [ 
	lap := lap - aNumber .
]

{ #category : 'as yet unclassified' }
Position >> decrementNumberOfSquaresBy: aNumber [ 
	numberOfSquare := numberOfSquare - aNumber .
]

{ #category : 'as yet unclassified' }
Position >> incrementLapsBy: aNumber [ 
	lap := lap + aNumber .
]

{ #category : 'as yet unclassified' }
Position >> incrementNumberOfSquaresBy: aNumber [ 
	numberOfSquare := numberOfSquare + aNumber .
]

{ #category : 'initialization' }
Position >> initializeWithNumberOfSquare: aNumberOfSquare andLaps: aNumberOfLap [ 
	numberOfSquare := aNumberOfSquare .
	lap := aNumberOfLap.
]

{ #category : 'as yet unclassified' }
Position >> lap [
	^lap
]

{ #category : 'as yet unclassified' }
Position >> numberOfSquares [ 
	^numberOfSquare 
]

{ #category : 'as yet unclassified' }
Position >> wrapIfNeeded: aBoardSize [ 
	numberOfSquare >= aBoardSize ifTrue: [
			lap := lap + 1.
			numberOfSquare := (numberOfSquare - 1 \\ aBoardSize) + 1] 
]
