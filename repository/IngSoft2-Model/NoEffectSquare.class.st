Class {
	#name : 'NoEffectSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'class initialization' }
NoEffectSquare class >> initialize [
]

{ #category : 'as yet unclassified' }
NoEffectSquare >> triggerEffect: spaceships and: theCurrentSpaceship [

	theCurrentSpaceship moveForward: 0.
	

]
