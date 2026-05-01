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

	"(aFixedResult isInteger) ifFalse: [Error signal: 'A Dice can not be created with a not integer type of faces']."
	"(aFixedResult isKindOf: Collection) ifFalse: [Error signal: 'A Dice can not be created with a not integer type of faces']."
	
	(aCollectionOfFixedResults allSatisfy: [ :fixedResult | fixedResult isInteger ]) ifFalse: [ Error signal: 'A Fixed Dice can not be created with a not integer fixed result' ].
	"(aFixedResult < 4) ifTrue: [Error signal: 'A Dice can not be created with less than 4 faces']."
	"(aFixedResult anySatisfy: [:each | each < 4]) ifTrue: [Error signal: 'A Dice can not be created with less than 4 faces'].   --> lo borraria pq esto es un fixed result, no un number of faces"
	^(self new) initializeWithFixedResults: aCollectionOfFixedResults .
]

{ #category : 'initialization' }
FixedDice >> initializeWithFixedResults: aCollectionOfFixedResults [ 
	fixedResults := aCollectionOfFixedResults.
	spinCounter:=1.
	
]

{ #category : 'as yet unclassified' }
FixedDice >> throw [
	| valueToBeAdded |
	valueToBeAdded := fixedResults at: spinCounter .
	spinCounter := (spinCounter \\ fixedResults size ) + 1.
	^ valueToBeAdded.

]
