Class {
	#name : 'PermanentCard',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
PermanentCard >> beThrownTo: aTargetSpaceship by: anAttackingSpaceship in: aGame [

    self applyTo: aTargetSpaceship.
    aGame addActivePermanentCard: self.
]

{ #category : 'testing' }
PermanentCard >> canBeThrownBy: aSpaceship in: aGame [
	 ^aGame isCurrentTurnOf: aSpaceship.
]

{ #category : 'testing' }
PermanentCard >> validTarget: aTarget in: aGame [
    ^aGame isSpaceshipInGame: aTarget.
]
