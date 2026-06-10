Class {
	#name : 'SpeedCard',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'comparing' }
SpeedCard >> = aCard [
	^ self class = aCard class
]

{ #category : 'as yet unclassified' }
SpeedCard >> triggerEffectTo: aDefendingSpaceShip by: anAttackingSpaceship andSpaceships: aCollectionOfSpaceships andLastEffect: aLastEffect [
    aDefendingSpaceShip modifyThrowingBy: 1.
]
