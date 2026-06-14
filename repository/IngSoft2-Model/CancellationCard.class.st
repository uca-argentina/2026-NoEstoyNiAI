Class {
	#name : 'CancellationCard',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CancellationCard >> applyEffectTo: aPermanentCard by: anAttackingSpaceship in: aGame [

    aGame removeActivePermanentCard: aPermanentCard.
]

{ #category : 'testing' }
CancellationCard >> validTarget: aTarget in: aGame [
    ^aGame isPermanentCardInGame: aTarget.
]
