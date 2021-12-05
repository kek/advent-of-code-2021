"
I check power consumption of an elvish submarine.

I need to use the binary numbers in the diagnostic report to generate two new binary numbers (called the gamma rate and the epsilon rate). The power consumption can then be found by multiplying the gamma rate by the epsilon rate.

I read from a SubmarineDiagnosticReport stream.

"
Class {
	#name : #PowerConsumptionChecker,
	#superclass : #Object,
	#instVars : [
		'diagnosticReport'
	],
	#category : #AdventOfCode2021
}

{ #category : #calculating }
PowerConsumptionChecker class >> lifeSupportRating [

	^ self new oxygenRatingDestructive
	* self new co2ScrubberRatingDestructive
]

{ #category : #calculating }
PowerConsumptionChecker >> bitRun: block [
	^ (1 to: diagnosticReport bitWidth) collect: block
]

{ #category : #calculating }
PowerConsumptionChecker >> calculate [
	^ self epsilonRate * self gammaRate.
]

{ #category : #calculating }
PowerConsumptionChecker >> co2ScrubberRatingDestructive [

	| bits |
	1 to: diagnosticReport bitWidth do: [ :i | 
		diagnosticReport items size = 1 ifFalse: [ 
			diagnosticReport keepLeastCommonAt: i ] ].
	bits := diagnosticReport items first.
	^ SubmarineTools bitsToDecimal: bits
]

{ #category : #accessing }
PowerConsumptionChecker >> epsilonRate [ 
	^ SubmarineTools bitsToDecimal: self epsilonRateBits.
]

{ #category : #calculating }
PowerConsumptionChecker >> epsilonRateBits [
	^ self bitRun: [ :index | diagnosticReport leastCommonBitAt: index ].
]

{ #category : #accessing }
PowerConsumptionChecker >> gammaRate [ 
	^ SubmarineTools bitsToDecimal: self gammaRateBits.
]

{ #category : #calculating }
PowerConsumptionChecker >> gammaRateBits [

	^ self bitRun: [ :index | diagnosticReport mostCommonBitAt: index ]
]

{ #category : #initialization }
PowerConsumptionChecker >> initialize [
	super initialize.
	diagnosticReport := SubmarineDiagnosticReport new.
]

{ #category : #calculating }
PowerConsumptionChecker >> oxygenRatingDestructive [

	| bits |
	1 to: diagnosticReport bitWidth do: [ :i | 
	diagnosticReport keepMostCommonAt: i ].
	bits := diagnosticReport items first.
	^ SubmarineTools bitsToDecimal: bits
]
