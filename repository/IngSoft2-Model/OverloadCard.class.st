Class {
	#name : 'OverloadCard',
	#superclass : 'PermanentCard',
	#instVars : [
		'targetSpaceship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
OverloadCard >> applyTo: aSpaceship [
	targetSpaceship ifNotNil: [ self error: 'This card is already applied' ].
   targetSpaceship := aSpaceship.
]

{ #category : 'initialization' }
OverloadCard >> initialize [ 
	targetSpaceship := nil.
]

{ #category : 'operations' }
OverloadCard >> modifierFor: aSpaceship [
    targetSpaceship = aSpaceship
        ifTrue: [ ^ -2 ].
    ^ 0
]
