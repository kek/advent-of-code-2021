"
I provide useful tools for submarines.
"
Class {
	#name : #SubmarineTools,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #converting }
SubmarineTools class >> bitsToDecimal: bits [
	| result significance |
	result := 0.
	bits reverse withIndexDo: [ :bit :index | 
		significance := 2 raisedTo: index - 1.
		result := result + (bit * significance).
	].
	^ result
]
