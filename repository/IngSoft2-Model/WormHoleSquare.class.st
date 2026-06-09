Class {
	#name : 'WormHoleSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'actions' }
WormHoleSquare >> triggerEffect: spaceships and: theCurrentSpaceship [
	theCurrentSpaceship moveBackwards: 4.
]
