Class {
	#name : 'FixedDice',
	#superclass : 'Object',
	#instVars : [
		'fixedResult'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
FixedDice class >> withFixedResult: aFixedResult [ 

	(aFixedResult isInteger) ifFalse: [Error signal: 'A Dice can not be created with a not integer type of faces'].
	(aFixedResult < 4) ifTrue: [Error signal: 'A Dice can not be created with less than 4 faces'].
	^self new initializeWithFixedResult: aFixedResult.
]

{ #category : 'initialization' }
FixedDice >> initializeWithFixedResult: aFixedResult [ 
	fixedResult := aFixedResult.
]

{ #category : 'as yet unclassified' }
FixedDice >> throw [
	^ fixedResult.
]
