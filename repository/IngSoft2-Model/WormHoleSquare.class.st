Class {
	#name : 'WormHoleSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
WormHoleSquare class >> withNumberCards: aNumberOfCards [

	aNumberOfCards < 0 ifTrue: [self error: 'Number of cards cannot be negative'].

	^ self new initializeWithNumberOfCards: aNumberOfCards.
]

{ #category : 'actions' }
WormHoleSquare >> triggerEffect: aTurnContext [
    aTurnContext moveCurrentSpaceshipBackwards: 4.
    ^ self.
]
