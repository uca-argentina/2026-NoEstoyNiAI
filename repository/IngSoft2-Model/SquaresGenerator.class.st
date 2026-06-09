Class {
	#name : 'SquaresGenerator',
	#superclass : 'Object',
	#instVars : [
		'numberOfSquares',
		'hyperJumpParsecs',
		'hyperJumpRelation',
		'moonWalkN',
		'random'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
SquaresGenerator class >> withNumberOfSquares: aNumberOfSquares moonWalkN: aMoonWalkN hyperJumpParsecs: someParsecs hyperJumpRelation: aRelation [

	aNumberOfSquares < 0 ifTrue: [self error: 'Number of squares cannot be negative'].

	aMoonWalkN <= 0 ifTrue: [self error: 'MoonWalk N must be positive'].

	(aRelation isInteger not or: [ aRelation <= 0 ]) ifTrue: [self error: 'HyperJump relation must be a positive integer'].

	^ self new
		initializeWithNumberOfSquares: aNumberOfSquares
		moonWalkN: aMoonWalkN
		hyperJumpParsecs: someParsecs
		hyperJumpRelation: aRelation
]

{ #category : 'translating' }
SquaresGenerator >> generate [

	| squares |

	squares := OrderedCollection new.

	1 to: numberOfSquares do: [ :index |squares add: self generateSquare].

	^ squares
]

{ #category : 'as yet unclassified' }
SquaresGenerator >> generateSquare [

	| randomNumber |

	randomNumber := random next.

	randomNumber <= 0.40 ifTrue: [^ NoEffectSquare new].

	randomNumber <= 0.60 ifTrue: [^ WormHoleSquare new].

	randomNumber <= 0.80 ifTrue: [^ SpeedUpSquare new].

	randomNumber <= 0.90 ifTrue: [^ MoonWalkSquare withN: moonWalkN ].

	randomNumber <= 0.98 ifTrue: [^ HyperJumpSquare  withParsecs: hyperJumpParsecs andRelation: hyperJumpRelation].

	^ AtomicBombSquare new
]

{ #category : 'initialization' }
SquaresGenerator >> initializeWithNumberOfSquares: aNumberOfSquares moonWalkN: aMoonWalkN hyperJumpParsecs: someParsecs hyperJumpRelation: aRelation [
	
	numberOfSquares := aNumberOfSquares.
	random := Random  new.
	moonWalkN := aMoonWalkN.
	hyperJumpParsecs := someParsecs.
	hyperJumpRelation := aRelation.
]
