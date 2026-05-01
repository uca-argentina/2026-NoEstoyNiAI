Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'size',
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
	aCollectionOfDices add: (FixedDice withFixedResults: #(10)).
	^ (self new) initializeWithDices: aCollectionOfDices andSize: 30 andPlayers: 1.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices [ 	

	^self new initializeWithDices: aCollectionOfDices andSize: 30 andPlayers: 1.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices withSize: aSize [ 
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize andPlayers: 1.
]

{ #category : 'as yet unclassified' }
Game class >> withDices: aCollectionOfDices withSize: aSize withPlayers: aNumberOfPlayers [
	aSize < 2 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 2 Squares' ].
	aCollectionOfDices isEmpty ifTrue: [ Error signal: 'You Cannot Create A Game With No Dices' ].
	aNumberOfPlayers < 1 ifTrue: [ Error signal: 'You Cannot Create A Game With Less Than 1 Player'].
	^self new initializeWithDices: aCollectionOfDices andSize: aSize andPlayers: aNumberOfPlayers.
]

{ #category : 'initialization' }
Game >> initializeWithDices: aCollectionOfDices andSize: aSize andPlayers: aNumberOfPlayers [ 
	dices := aCollectionOfDices.
	size := aSize.
	
	currentShift := 1.
	gameEnded := false.
	players := (1 to: aNumberOfPlayers) collect: [ :index | Ship withName: index ].
]

{ #category : 'testing' }
Game >> isEnded [
	^ gameEnded.
]

{ #category : 'as yet unclassified' }
Game >> numberOfWinner [
	| maxPosition |
	gameEnded ifFalse: [ Error signal: 'There is no winner yet. The game is not finished' ].

	maxPosition := players max: [:nave | nave returnPosition ].
	^players indexOf: (players detect: [:nave | nave returnPosition = maxPosition]).
]

{ #category : 'as yet unclassified' }
Game >> playTurn [

	| result currentPlayerPosition |
	
	gameEnded ifTrue: [ Error signal: 'You Cannot Throw, The Game Ended' ].
	result:= self throwDices .
	(players at: currentShift) moveFoward: result.
	currentPlayerPosition := (players at: currentShift) returnPosition.
	gameEnded := size <= currentPlayerPosition.
	currentShift := ((currentShift) \\ players size) + 1.
	^currentPlayerPosition.
]

{ #category : 'as yet unclassified' }
Game >> showPositions [

	| result |
    result := String new writeStream.
    players do: [:ship | result nextPutAll: '[Player ' , (ship returnName) printString , ' is on square ' , (ship returnPosition) printString, '] '].
    ^result contents.
    
]

{ #category : 'as yet unclassified' }
Game >> throwDices [

	| sumOfDices |
	
	sumOfDices:= dices inject: 0 into: [:sum :dice | sum + dice throw ].

	^sumOfDices .
	
	
]
