Class {
	#name : 'InstantCard',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
InstantCard >> beThrownTo: aTarget by: anAttackingSpaceship in: aGame [

    self applyEffectTo: aTarget by: anAttackingSpaceship in: aGame.
]

{ #category : 'testing' }
InstantCard >> canBeThrownBy: aSpaceship in: aGame [
	 ^true.
]
