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
