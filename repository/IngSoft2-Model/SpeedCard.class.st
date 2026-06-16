Class {
	#name : 'SpeedCard',
	#superclass : 'PermanentCard',
	#instVars : [
		'targetSpaceship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
SpeedCard >> applyTo: aSpaceship [
	targetSpaceship ifNotNil: [ self error: 'This card is already applied' ].
   targetSpaceship := aSpaceship.
]

{ #category : 'initialization' }
SpeedCard >> initialize [ 
	targetSpaceship := nil.
]

{ #category : 'as yet unclassified' }
SpeedCard >> modifierFor: aSpaceship [

    targetSpaceship = aSpaceship
        ifTrue: [ ^ 1 ].
    ^ 0
]
