Class {
	#name : 'AtomicBombSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'actions' }
AtomicBombSquare >> triggerEffect: spaceships and: theCurrentSpaceship [
	spaceships do: [ :spaceship | spaceship resetToBeginning ].
]
