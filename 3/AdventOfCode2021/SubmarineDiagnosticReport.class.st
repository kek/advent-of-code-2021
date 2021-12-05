"
The submarine has been making some odd creaking noises, so you ask it to produce a diagnostic report just in case.

The diagnostic report (your puzzle input) consists of a list of binary numbers which, when decoded properly, can tell you many useful things about the conditions of the submarine.

I produce a list of bit lists from a file. 

"
Class {
	#name : #SubmarineDiagnosticReport,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #AdventOfCode2021
}

{ #category : #calculating }
SubmarineDiagnosticReport >> bitWidth [
	^ items first size.
	
]

{ #category : #removing }
SubmarineDiagnosticReport >> discard: block [

	items := items removeAllSuchThat: block.
]

{ #category : #initialization }
SubmarineDiagnosticReport >> initialize [

	| dir stream bytes |
	super initialize.
	dir := FileSystem disk workingDirectoryPath.
	stream := (dir
	           / 'pharo-local/iceberg/kek/advent-of-code-2021/3/example')
		          asFileReference readStream.
	items := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ 
		bytes := stream nextLine asByteArray.
		items add: (bytes collect: [ :v | v - 48 ]) ]
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
		bit = 1 ifTrue: [ ones := ones + 1 ].
		bit = 0 ifTrue: [ zeros := zeros + 1 ] ].
	^ ones = zeros ifTrue: [ 0 ] ifFalse: [ 
		  ones < zeros
			  ifTrue: 1
			  ifFalse: 0 ]
]

{ #category : #calculating }
SubmarineDiagnosticReport >> mostCommonBitAt: index [

	| ones zeros bit |
	ones := 0.
	zeros := 0.
	items do: [ :item | 
		bit := item at: index.
		bit = 1 ifTrue: [ ones := ones + 1 ].
		bit = 0 ifTrue: [ zeros := zeros + 1 ] ].
	ones = zeros ifTrue: [ ^ 1 ].
	^ ones > zeros
		  ifTrue: 1
		  ifFalse: 0
]

{ #category : #removing }
SubmarineDiagnosticReport >> removeLeastCommonAt: position [

	self discard: [ :item | 
		items size = 1
			ifFalse: [ (self leastCommonBitAt: position) = (item at: position) ]
			ifTrue: false ]
]

{ #category : #removing }
SubmarineDiagnosticReport >> removeMostCommonAt: position [

	self discard: [ :item | 
		items size = 1 ifFalse: [ 
			(self mostCommonBitAt: position) = (item at: position) ] 
		ifTrue: false ]
]
