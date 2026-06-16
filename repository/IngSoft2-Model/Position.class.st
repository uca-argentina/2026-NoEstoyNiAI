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
	lap = aPosition lap ifTrue: [ ^ numberOfSquare < aPosition numberOfSquares ].
	"lap < aPosition lap ifTrue: [ ^ true ].
	lap > aPosition lap ifTrue: [ ^ false ].
	^ numberOfSquare <= aPosition numberOfSquares"
	^lap < aPosition lap.
]

{ #category : 'comparing' }
Position >> = aPosition [
	^ (numberOfSquare == aPosition numberOfSquares) and: [ lap == aPosition lap ].
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

	| lapsToAdd newSquare |

	numberOfSquare >= aBoardSize ifTrue: [
		lapsToAdd := numberOfSquare // aBoardSize.
		newSquare := numberOfSquare \\ aBoardSize.

		newSquare = 0 ifTrue: [
			newSquare := aBoardSize.
			lapsToAdd := lapsToAdd - 1
		].

		self incrementLapsBy: lapsToAdd.
		numberOfSquare := newSquare
	].

	(numberOfSquare < 1 and: [ lap > 0 ]) ifTrue: [
		self decrementLapsBy: 1.
		numberOfSquare := aBoardSize + numberOfSquare
	].

	(numberOfSquare < 0 and: [ lap = 0 ]) ifTrue: [
		numberOfSquare := 1
	].
]
