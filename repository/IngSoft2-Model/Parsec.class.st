Class {
	#name : 'Parsec',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Parsec class >> withValue: aValue [
    ^ self new initializeWithValue: aValue.
]

{ #category : 'converting' }
Parsec >> asParsecs [
    ^ value.
]

{ #category : 'initialization' }
Parsec >> initializeWithValue: aValue [
    value := aValue.
]
