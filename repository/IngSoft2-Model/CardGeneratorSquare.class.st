Class {
	#name : 'CardGeneratorSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'actions' }
CardGeneratorSquare >> triggerEffect: spaceships and: theCurrentSpaceship [
	| generator randomCards |
	generator := CardsGenerator withNumberOfCards: 1.
	randomCards := generator generate.
   theCurrentSpaceship addCard: (randomCards at: 1).
   ^ self.
]
