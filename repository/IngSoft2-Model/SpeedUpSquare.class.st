Class {
	#name : 'SpeedUpSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
SpeedUpSquare >> triggerEffect: spaceships and: theCurrentSpaceship [
	^ theCurrentSpaceship moveForward: 4.
]
