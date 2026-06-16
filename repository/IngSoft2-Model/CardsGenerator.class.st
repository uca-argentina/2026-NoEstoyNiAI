Class {
	#name : 'CardsGenerator',
	#superclass : 'Object',
	#instVars : [
		'numberOfCards',
		'random'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardsGenerator class >> withNumberOfCards: aNumberOfCards [

	aNumberOfCards < 0 ifTrue: [self error: 'Number of cards cannot be negative'].
	
	^ self new initializeWithNumberOfCards: aNumberOfCards.
]

{ #category : 'translating' }
CardsGenerator >> generate [

	| cards |

	cards := OrderedCollection new.

	1 to: numberOfCards do: [ :index |cards add: self generateSquare].

	^ cards
]

{ #category : 'as yet unclassified' }
CardsGenerator >> generateSquare [

	| randomNumber |

	randomNumber := random next.

	randomNumber <= 0.1666 ifTrue: [^ OverloadCard new].

	randomNumber <= 0.3333 ifTrue: [^ SpeedCard new].

	randomNumber <= 0.5 ifTrue: [^ AccelerationCard new].

	randomNumber <= 0.6667 ifTrue: [^ CancellationCard new ].

	randomNumber <= 0.8333 ifTrue: [^ RedoCard new].
	
	^ RepeatCard new
]

{ #category : 'initialization' }
CardsGenerator >> initializeWithNumberOfCards: aNumberOfCards [
	
	numberOfCards := aNumberOfCards.
	random := Random  new.

]
