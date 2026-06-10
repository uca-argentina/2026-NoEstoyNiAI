Class {
	#name : 'CancellationCard',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'comparing' }
CancellationCard >> = aCard [
	^ self class = aCard class
]

{ #category : 'as yet unclassified' }
CancellationCard >> triggerEffectTo: aDefendingSpaceShip by: anAttackingSpaceship andSpaceships: aCollectionOfSpaceships andLastEffect: aLastEffect [
    aCollectionOfSpaceships do: [ :spaceship | spaceship modifyThrowingBy: 1 ].
]
