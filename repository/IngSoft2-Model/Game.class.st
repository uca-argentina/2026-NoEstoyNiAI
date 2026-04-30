Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'size',
		'position',
		'players',
		'currentShift',
		'gameEnded'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Game class >> default [
	| aCollectionOfDices |
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (FixedDice withFixedResult: #(10)).
	^ (self new) initializeWithDices: aCollectionOfDices andSize: 30.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices [ 	

	^self new initializeWithDices: aCollectionOfDices andSize: 30.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices withSize: aSize [ 
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices withSize: aSize withPlayers: aCollectionOfPlayersPositions [
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize andPlayers: aCollectionOfPlayersPositions.
]

{ #category : 'initialization' }
Game >> initializeWithDices: aCollectionOfDices andSize: aSize [ 
	dices := aCollectionOfDices .
	size := aSize. 
	position := 0.
]

{ #category : 'initialization' }
Game >> initializeWithDices: aCollectionOfDices andSize: aSize andPlayers: aNumberOfPlayers [ 
	dices := aCollectionOfDices.
	size := aSize.
	players := OrderedCollection new.
	position:=0.
	currentShift := 1.
	gameEnded := false.
	aNumberOfPlayers timesRepeat: [players add: 0]
]

{ #category : 'testing' }
Game >> isEnded [
	^ gameEnded.
]

{ #category : 'as yet unclassified' }
Game >> numberOfWinner [
	| maximo |
	gameEnded ifFalse: [ Error signal: 'There is no winner yet. The game is not finished' ].
	maximo := players max.
	^ players indexOf: maximo.
]

{ #category : 'as yet unclassified' }
Game >> playTurn [

	| result currentPlayerPosition |
	
	gameEnded ifTrue: [ Error signal: 'You Cannot Throw, The Game Ended' ].
	result:= self throwDices .
	players at: currentShift incrementBy: result.
	currentPlayerPosition := players at: currentShift.
	gameEnded := size <= currentPlayerPosition.
	currentShift := ((currentShift) \\ players size) + 1.
	^currentPlayerPosition.
]

{ #category : 'as yet unclassified' }
Game >> throwDices [

	| sumaDados |
	
	sumaDados:= dices inject: 0 into: [:suma :dado | suma + dado throw ].

	^sumaDados .
	
	
]
