Class {
	#name : 'AccelerationCard',
	#superclass : 'PermanentCard',
	#instVars : [
		'targetSpaceship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'comparing' }
AccelerationCard >> = aCard [
	^ self class = aCard class
]

{ #category : 'operations' }
AccelerationCard >> applyTo: aTarget [

]

{ #category : 'operations' }
AccelerationCard >> modifierFor: aSpaceship [

    ^ 1

]
