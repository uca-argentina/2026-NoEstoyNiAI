Class {
	#name : 'Tablero',
	#superclass : 'Object',
	#instVars : [
		'size'
	],
	#classInstVars : [
		'size'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Tablero class >> withSize: aSize [
	^(self new) initializeWith: aSize.
]

{ #category : 'initialization' }
Tablero >> initializeWith: aSize [
	size := aSize.
]

{ #category : 'testing' }
Tablero >> isShorterThan: aSize [
	^ size <= aSize
]
