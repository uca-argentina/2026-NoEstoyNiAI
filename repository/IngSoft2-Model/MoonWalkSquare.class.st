Class {
	#name : 'MoonWalkSquare',
	#superclass : 'Object',
	#instVars : [
		'n'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalkSquare class >> withN: aNumber [
	^self new initializeWithN: aNumber.

]

{ #category : 'initialization' }
MoonWalkSquare >> initializeWithN: aNumber [
	n := aNumber.
]

{ #category : 'as yet unclassified' }
MoonWalkSquare >> triggerEffect: spaceships and: theCurrentSpaceship [

	| movingSpaceships |
	movingSpaceships := spaceships reject: [ :obj |
		                    obj == theCurrentSpaceship ].
	
	movingSpaceships do: [ :spaceship | spaceship moveBackwards: n].
	^ theCurrentSpaceship moveForward: 0.
]
