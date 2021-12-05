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
	           / 'pharo-local/iceberg/kek/advent-of-code-2021/3/input')
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

{ #category : #removing }
SubmarineDiagnosticReport >> keepLeastCommonAt: position [

	| mostCommon |
	mostCommon := self mostCommonBitAt: position.
	items size = 1 ifFalse: [ 
		self discard: [ :item | 
			
			mostCommon = -1
				ifTrue: [ (item at: position) = 1 ]
				ifFalse: [ mostCommon = (item at: position) ] ] ]
]

{ #category : #removing }
SubmarineDiagnosticReport >> keepMostCommonAt: position [

	| leastCommon |
				leastCommon := self leastCommonBitAt: position.
	items size = 1 ifFalse: [ 
		self discard: [ :item | 

			leastCommon = -1
				ifTrue: [ (item at: position) = 0 ]
				ifFalse: [ leastCommon = (item at: position) ] ] ]
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
	ones = zeros ifTrue: [ ^ -1 ].
	^ zeros < ones
		  ifTrue: 0
		  ifFalse: 1
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
	ones = zeros ifTrue: [ ^ -1 ].
	^ ones > zeros
		  ifTrue: 1
		  ifFalse: 0
]
