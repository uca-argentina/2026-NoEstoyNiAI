Class {
	#name : 'FixedSquaresGenerator',
	#superclass : 'Object',
	#instVars : [
		'numberOfSquares',
		'random',
		'moonWalkN',
		'units'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
FixedSquaresGenerator class >> withNumberOfSquares: aNumberOfSquares random: aRandomNumber moonWalkN: aMoonWalkN hyperJumpParsecs: someParsecs [

	aNumberOfSquares < 0 ifTrue: [self error: 'Number of squares cannot be negative'].

	(aRandomNumber < 0 or: [ aRandomNumber > 1 ]) ifTrue: [self error: 'Random number must be between 0 and 1'].

	aMoonWalkN <= 0 ifTrue: [self error: 'MoonWalk N must be positive'].
	
	^ self new
		initializeWithNumberOfSquares: aNumberOfSquares
		random: aRandomNumber
		moonWalkN: aMoonWalkN
		hyperJumpParsecs: someParsecs.
]

{ #category : 'translating' }
FixedSquaresGenerator >> generate [
	| squares |

	squares := OrderedCollection new.

	1 to: numberOfSquares do: [ :index |squares add: self generateSquare].

	^ squares
]

{ #category : 'as yet unclassified' }
FixedSquaresGenerator >> generateSquare [

	| randomNumber |

	randomNumber := random.

	randomNumber <= 0.30 ifTrue: [^ NoEffectSquare new].
	
	randomNumber <= 0.40 ifTrue: [^ CardGeneratorSquare new].

	randomNumber <= 0.60 ifTrue: [^ WormHoleSquare new].

	randomNumber <= 0.80 ifTrue: [^ SpeedUpSquare new].

	randomNumber <= 0.90 ifTrue: [^ MoonWalkSquare withN: moonWalkN ].

	randomNumber <= 0.98 ifTrue: [^ HyperJumpSquare  withUnits: units].

	^ AtomicBombSquare new
]

{ #category : 'initialization' }
FixedSquaresGenerator >> initializeWithNumberOfSquares: aNumberOfSquares random: aRandomNumber moonWalkN: aMoonWalkN hyperJumpParsecs: someParsecs [
	numberOfSquares := aNumberOfSquares.
	random := aRandomNumber.
	moonWalkN := aMoonWalkN.
	units := someParsecs.
]
