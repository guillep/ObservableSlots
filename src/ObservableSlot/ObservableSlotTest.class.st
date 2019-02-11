Class {
	#name : #ObservableSlotTest,
	#superclass : #TestCase,
	#category : #ObservableSlot
}

{ #category : #tests }
ObservableSlotTest >> testObservableSlotWorksAsNormalSlot [

	| point |
	point := ObservablePoint new.
	point x: 17.
	point y: 299.
	
	self assert: point x equals: 17.
	self assert: point y equals: 299.
]
