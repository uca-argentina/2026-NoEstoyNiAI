Class {
	#name : 'AtomicBombSquare',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'actions' }
AtomicBombSquare >> triggerEffect: aTurnContext [
    aTurnContext moveAllSpaceshipsToStart.
    ^ self.
]
