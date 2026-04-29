Class {
	#name : 'FixedDiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
FixedDiceTest >> test001WhenAFixedDiceIsThrowThenTheFixedDiceReturnANumberBetween1and6 [

 | diceResult aDice |

aDice:= FixedDice withFixedResult: 10.
diceResult:= aDice throw.
self assert: diceResult equals: 10.
]
