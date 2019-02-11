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

{ #category : #tests }
ObservableSlotTest >> testSubscribeToChangeRaisesEventWithNewValue [

	| point newValue |
	point := ObservablePoint new.
	point property: #x whenChangedDo: [ :new :old | newValue := new ].

	point x: 17.

	self assert: newValue equals: 17.
]

{ #category : #tests }
ObservableSlotTest >> testSubscribeToChangeRaisesEventWithOldValue [

	| point oldValue |
	point := ObservablePoint new.
	point x: 'old'.
	point property: #x whenChangedDo: [ :new :old | oldValue := old ].

	point x: 17.

	self assert: oldValue equals: 'old'.
]
