Class {
	#name : 'SpaceshipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
SpaceshipTest >> test001WhenASpaceshipNameIsRequestedThenTheNameIsReturn [

| aSpaceship |
aSpaceship:= Spaceship withName: 'Player 1'.

self assert: aSpaceship returnName equals: 'Player 1'.
]

{ #category : 'as yet unclassified' }
SpaceshipTest >> test002WhenASpaceshipIsCreatedIsInitializeThenTheSpaceshipPositionIs0 [

| aSpaceship |
aSpaceship:= Spaceship withName: 'Player 1'.

self assert: aSpaceship returnPosition equals: 0.
]

{ #category : 'as yet unclassified' }
SpaceshipTest >> test003WhenASpaceshipMoveFoward10PositionsThenTheSpaceshipPositionIs10 [

| aSpaceship |
aSpaceship:= Spaceship withName: 'Player 1'.
aSpaceship moveFoward: 10.

self assert: aSpaceship returnPosition equals: 10.
]
