Class {
	#name : 'CardGeneratorSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'actions' }
CardGeneratorSquare >> triggerEffect: aTurnContext [
    | generator randomCards |
    generator := CardsGenerator withNumberOfCards: 1.
    randomCards := generator generate.
    aTurnContext giveCardToCurrentSpaceship: (randomCards at: 1).
    ^ self.
]
