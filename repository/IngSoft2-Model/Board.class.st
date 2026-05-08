Class {
	#name : 'Board',
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
Board class >> withSize: aSize [
	^(self new) initializeWith: aSize.
]

{ #category : 'initialization' }
Board >> initializeWith: aSize [
	size := aSize.
]

{ #category : 'testing' }
Board >> isShorterThan: aSize [
	^ size <= aSize
]
