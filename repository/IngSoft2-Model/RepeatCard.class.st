Class {
	#name : 'RepeatCard',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
RepeatCard >> applyEffectTo: aSpaceship by: anAttackingSpaceship in: aGame [
    aGame repeatLastEffectOn: aSpaceship.
]

{ #category : 'testing' }
RepeatCard >> validTarget: aTarget in: aGame [
    ^aGame isSpaceshipInGame: aTarget.
]
