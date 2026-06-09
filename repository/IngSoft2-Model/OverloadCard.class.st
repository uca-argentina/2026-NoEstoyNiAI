Class {
	#name : 'OverloadCard',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'comparing' }
OverloadCard >> = aCard [
	^ self class = aCard class
]

{ #category : 'as yet unclassified' }
OverloadCard >> triggerEffectTo: aDefendingSpaceShip by: anAttackingWizard [
	aDefendingSpaceShip modifyThrowingBy: -2.
]
