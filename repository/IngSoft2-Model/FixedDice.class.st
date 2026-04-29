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
