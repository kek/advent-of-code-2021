"
The submarine has been making some odd creaking noises, so you ask it to produce a diagnostic report just in case.

The diagnostic report (your puzzle input) consists of a list of binary numbers which, when decoded properly, can tell you many useful things about the conditions of the submarine.

I produce a stream from a file. 

"
Class {
	#name : #SubmarineDiagnosticReport,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #AdventOfCode2021
}

{ #category : #initialization }
SubmarineDiagnosticReport >> initialize [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| dir |
	super initialize.
	dir := FileSystem disk workingDirectoryPath.
	stream := (dir / 'pharo-local/iceberg/kek/advent-of-code-2021/3/input') asFileReference readStream.
]

{ #category : #accessing }
SubmarineDiagnosticReport >> next [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| line |
	line := stream nextLine.
	^ line.
]
