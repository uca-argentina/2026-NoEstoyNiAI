Class {
	#name : 'FixedDice',
	#superclass : 'Object',
	#instVars : [
		'fixedResult',
		'contadorTiradas'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
FixedDice class >> withFixedResult: aFixedResult [ 

	"(aFixedResult isInteger) ifFalse: [Error signal: 'A Dice can not be created with a not integer type of faces']."
	(aFixedResult isKindOf: Collection) ifFalse: [Error signal: 'A Dice can not be created with a not integer type of faces'].
	"(aFixedResult < 4) ifTrue: [Error signal: 'A Dice can not be created with less than 4 faces']."
	(aFixedResult anySatisfy: [:each | each < 4]) ifTrue: [Error signal: 'A Dice can not be created with less than 4 faces'].
	^(self new) initializeWithFixedResult: aFixedResult.
]

{ #category : 'initialization' }
FixedDice >> initializeWithFixedResult: aFixedResult [ 
	fixedResult := aFixedResult.
	contadorTiradas:=1.
	
]

{ #category : 'as yet unclassified' }
FixedDice >> throw [
	| valorASumar |
	valorASumar := fixedResult at: contadorTiradas.
	contadorTiradas := (contadorTiradas \\ fixedResult size ) + 1.
	^ valorASumar.

]
