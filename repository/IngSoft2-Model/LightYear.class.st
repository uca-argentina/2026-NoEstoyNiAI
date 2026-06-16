Class {
	#name : 'LightYear',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
LightYear class >> withValue: aValue [
    ^ self new initializeWithValue: aValue.
]

{ #category : 'converting' }
LightYear >> asParsecs [
    ^ value / 3.
]

{ #category : 'initialization' }
LightYear >> initializeWithValue: aValue [
    value := aValue.
]
