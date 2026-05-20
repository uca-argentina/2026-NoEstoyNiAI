Class {
	#name : 'FixedDie',
	#superclass : 'Object',
	#instVars : [
		'spinCounter',
		'fixedResults'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
FixedDie class >> withFixedResults: aCollectionOfFixedResults [

	
	(aCollectionOfFixedResults allSatisfy: [ :fixedResult | fixedResult isInteger ]) ifFalse: [ Error signal: 'A Fixed Dice can not be created with a not integer fixed result' ].
	(aCollectionOfFixedResults allSatisfy: [ :fixedResult | fixedResult > 0 ]) ifFalse: [ Error signal:  'A Fixed Dice can not be created with a negative or zero fixed result' ].
	
	^(self new) initializeWithFixedResults: aCollectionOfFixedResults .
]

{ #category : 'as yet unclassified' }
FixedDie >> incrementSpinCounter [

	spinCounter := spinCounter \\ fixedResults size + 1
]

{ #category : 'initialization' }
FixedDie >> initializeWithFixedResults: aCollectionOfFixedResults [ 
	fixedResults := aCollectionOfFixedResults.
	spinCounter:=1.
	
]

{ #category : 'as yet unclassified' }
FixedDie >> roll [

	| valueToBeAdded |
	valueToBeAdded := fixedResults at: spinCounter.
	self incrementSpinCounter.
	^ valueToBeAdded
]
