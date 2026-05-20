Class {
	#name : 'HyperJumpSquare',
	#superclass : 'Object',
	#instVars : [
		'parsecs',
		'currentParsecPosition',
		'relation'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJumpSquare class >> withParsecs: aCollectionOfParsecs andRelation: aRelation [
	^self new initializeWithParsecs: aCollectionOfParsecs andRelation: aRelation.
]

{ #category : 'initialization' }
HyperJumpSquare >> initializeWithParsecs: aCollectionOfParsecs andRelation: aRelation [
	parsecs := aCollectionOfParsecs.
	relation := aRelation.
	currentParsecPosition := 1.
]

{ #category : 'as yet unclassified' }
HyperJumpSquare >> triggerEffect: spaceships and: theCurrentSpaceship [
	|positionsToAdvance|
	positionsToAdvance := (parsecs at: currentParsecPosition) * relation.
	currentParsecPosition := currentParsecPosition \\ parsecs size + 1.
	theCurrentSpaceship moveForward: positionsToAdvance.
	
]
