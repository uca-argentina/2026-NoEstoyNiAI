Class {
	#name : 'SpeedUpSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'actions' }
SpeedUpSquare >> triggerEffect: aTurnContext [
    aTurnContext moveCurrentSpaceshipForward: 4.
    ^ self. 
]
