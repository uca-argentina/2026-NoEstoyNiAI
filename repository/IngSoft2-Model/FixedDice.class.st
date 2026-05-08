Class {
	#name : 'FixedDice',
	#superclass : 'Object',
	#instVars : [
		'spinCounter',
		'fixedResults'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
FixedDice class >> withFixedResults: aCollectionOfFixedResults [

	
	(aCollectionOfFixedResults allSatisfy: [ :fixedResult | fixedResult isInteger ]) ifFalse: [ Error signal: 'A Fixed Dice can not be created with a not integer fixed result' ].
	(aCollectionOfFixedResults allSatisfy: [ :fixedResult | fixedResult >= 0 ]) ifFalse: [ Error signal:  'A Fixed Dice can not be created with a negative or zero fixed result' ].
	
	^(self new) initializeWithFixedResults: aCollectionOfFixedResults .
]

{ #category : 'as yet unclassified' }
FixedDice >> incrementSpinCounter [

	spinCounter := spinCounter \\ fixedResults size + 1
]

{ #category : 'initialization' }
FixedDice >> initializeWithFixedResults: aCollectionOfFixedResults [ 
	fixedResults := aCollectionOfFixedResults.
	spinCounter:=1.
	
]

{ #category : 'as yet unclassified' }
FixedDice >> throw [

	| valueToBeAdded |
	valueToBeAdded := fixedResults at: spinCounter.
	self incrementSpinCounter.
	^ valueToBeAdded
]
