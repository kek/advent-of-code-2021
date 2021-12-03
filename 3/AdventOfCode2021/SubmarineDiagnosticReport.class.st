"
The submarine has been making some odd creaking noises, so you ask it to produce a diagnostic report just in case.

The diagnostic report (your puzzle input) consists of a list of binary numbers which, when decoded properly, can tell you many useful things about the conditions of the submarine.

I produce a stream from a file. 

"
Class {
	#name : #SubmarineDiagnosticReport,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #AdventOfCode2021
}

{ #category : #converting }
SubmarineDiagnosticReport class >> bitsToDecimal: bits [
	| result significance |
	result := 0.
	bits reverse withIndexCollect: [ :bit :index | 
		significance := 2 raisedTo: index - 1.
		result := result + (bit * significance).
	].
	^ result
]

{ #category : #calculating }
SubmarineDiagnosticReport >> bitWidth [
	^ items first size.
	
]

{ #category : #accessing }
SubmarineDiagnosticReport >> epsilonRate [ 
	^ self class bitsToDecimal: self epsilonRateBits.
]

{ #category : #calculating }
SubmarineDiagnosticReport >> epsilonRateBits [
	| maxIndex |
	maxIndex := self bitWidth.
	^ (1 to: maxIndex) collect: [ :index | self leastCommonBitAt: index ]
]

{ #category : #accessing }
SubmarineDiagnosticReport >> gammaRate [ 
	^ self class bitsToDecimal: self gammaRateBits.
]

{ #category : #calculating }
SubmarineDiagnosticReport >> gammaRateBits [
	| maxIndex |
	maxIndex := self bitWidth.
	^ (1 to: maxIndex) collect: [ :index | self mostCommonBitAt: index ]
]

{ #category : #initialization }
SubmarineDiagnosticReport >> initialize [
	| dir stream bytes |
	super initialize.
	dir := FileSystem disk workingDirectoryPath.
	stream := (dir / 'pharo-local/iceberg/kek/advent-of-code-2021/3/input') asFileReference readStream.
	items := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ 
		bytes := stream nextLine asByteArray.
		items add: (bytes collect: [:v | v - 48]) 
	].
]

{ #category : #accessing }
SubmarineDiagnosticReport >> items [
	^ items.
]

{ #category : #calculating }
SubmarineDiagnosticReport >> leastCommonBitAt: index [
	| ones zeros bit |
	ones := 0.
	zeros := 0.
	items do: [ :item |
		bit := item at: index.
		bit = 1 ifTrue: [ones := ones + 1].
		bit = 0 ifTrue: [zeros := zeros + 1].
	].
	ones = zeros ifTrue: [ self error: 'Both bits are equally common. Undefined requirements.' ].
	^ ones < zeros ifTrue: 1 ifFalse: 0.
	

]

{ #category : #calculating }
SubmarineDiagnosticReport >> mostCommonBitAt: index [
	| ones zeros bit |
	ones := 0.
	zeros := 0.
	items do: [ :item |
		bit := item at: index.
		bit = 1 ifTrue: [ones := ones + 1].
		bit = 0 ifTrue: [zeros := zeros + 1].
	].
	ones = zeros ifTrue: [ self error: 'Both bits are equally common. Undefined requirements.' ].
	^ ones > zeros ifTrue: 1 ifFalse: 0.
	

]
