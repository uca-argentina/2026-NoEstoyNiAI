Class {
	#name : 'FixedCardsGenerator',
	#superclass : 'Object',
	#instVars : [
		'numberOfCards',
		'random'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
FixedCardsGenerator class >> withNumberOfCards: aNumberOfCards random: aRandomNumber [

	aNumberOfCards < 0 ifTrue: [self error: 'Number of cards cannot be negative'].
	(aRandomNumber < 0 or: [ aRandomNumber > 1 ]) ifTrue: [self error: 'Random number must be between 0 and 1'].
	
	^ self new initializeWithNumberOfCards: aNumberOfCards random: aRandomNumber .
]

{ #category : 'translating' }
FixedCardsGenerator >> generate [

	| cards |

	cards := OrderedCollection new.

	1 to: numberOfCards do: [ :index |cards add: self generateCard].

	^ cards
]

{ #category : 'as yet unclassified' }
FixedCardsGenerator >> generateCard [

	| randomNumber |

	randomNumber := random.

	randomNumber <= 0.1666 ifTrue: [^ OverloadCard new].

	randomNumber <= 0.3333 ifTrue: [^ SpeedCard new].

	randomNumber <= 0.5 ifTrue: [^ AccelerationCard new].

	randomNumber <= 0.6667 ifTrue: [^ CancellationCard new ].

	randomNumber <= 0.8333 ifTrue: [^ RedoCard new].
	
	^ RepeatCard new
]

{ #category : 'initialization' }
FixedCardsGenerator >> initializeWithNumberOfCards: aNumberOfCards random: aRandomNumber [

	numberOfCards := aNumberOfCards.
	random := aRandomNumber.
]
