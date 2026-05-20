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
    ^ numberOfSquare <= aPosition numberOfSquares
]

{ #category : 'comparing' }
Position >> = aPosition [
	^(numberOfSquare == aPosition numberOfSquares) and: (lap == aPosition lap)
]

{ #category : 'actions' }
Position >> decrementLapsBy: aNumber [ 
	lap := lap - aNumber .
]

{ #category : 'actions' }
Position >> decrementNumberOfSquaresBy: aNumber [ 
	numberOfSquare := numberOfSquare - aNumber .
]

{ #category : 'actions' }
Position >> incrementLapsBy: aNumber [ 
	lap := lap + aNumber .
]

{ #category : 'actions' }
Position >> incrementNumberOfSquaresBy: aNumber [ 
	numberOfSquare := numberOfSquare + aNumber .
]

{ #category : 'initialization' }
Position >> initializeWithNumberOfSquare: aNumberOfSquare andLaps: aNumberOfLap [ 
	numberOfSquare := aNumberOfSquare .
	lap := aNumberOfLap.
]

{ #category : 'accessing' }
Position >> lap [
	^lap
]

{ #category : 'accessing' }
Position >> numberOfSquares [ 
	^numberOfSquare 
]

{ #category : 'accessing' }
Position >> position [
	^ Position withNumberOfSquare: numberOfSquare andLaps: lap
]

{ #category : 'actions' }
Position >> wrapIfNeeded: aBoardSize [ 

	| aNumberOfSquareAux aLapAux|
	aNumberOfSquareAux := numberOfSquare.
	aLapAux := lap.
	
	aNumberOfSquareAux > aBoardSize ifTrue: [
			self incrementLapsBy: 1.
			numberOfSquare := (numberOfSquare \\ aBoardSize) ].
		
	(aNumberOfSquareAux < 1 and: aLapAux > 0 ) ifTrue: [
		self decrementLapsBy: 1.
		numberOfSquare := aBoardSize + numberOfSquare ].
	
	(aNumberOfSquareAux < 1 and: aLapAux == 0 ) ifTrue: [
		numberOfSquare := 1 ].
]
