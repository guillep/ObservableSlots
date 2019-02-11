Class {
	#name : #ObservableSlotTest,
	#superclass : #TestCase,
	#category : #ObservableSlot
}

{ #category : #tests }
ObservableSlotTest >> testChangeInInstanceVariableRaisesEventOnlyOnce [

	| point  count |
	count := 0.
	point := ObservablePoint new.
	point property: #x whenChangedDo: [ count := count + 1 ].

	point x: 17.

	self assert: count equals: 1.
]

{ #category : #tests }
ObservableSlotTest >> testExplicitNotificationRaisesEventOnlyOnce [

	| point  count |
	count := 0.
	point := ObservablePoint new.
	point property: #x whenChangedDo: [ count := count + 1 ].

	point notifyPropertyChanged: #x.

	self assert: count equals: 1.
]

{ #category : #tests }
ObservableSlotTest >> testExplicitNotificationRaisesEventWithNewValue [

	| point newValue |
	point := ObservablePoint new.
	point x: 17.
	point property: #x whenChangedDo: [ :new | newValue := new ].

	point notifyPropertyChanged: #x.

	self assert: newValue equals: 17.
]

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
ObservableSlotTest >> testSubscribeBlockWithoutParametersIsCalled [

	| point  called |
	called := false.
	point := ObservablePoint new.
	point property: #x whenChangedDo: [ called := true ].

	point x: 17.

	self assert: called.
]

{ #category : #tests }
ObservableSlotTest >> testSubscribeToChangeRaisesEventWithNewValue [

	| point newValue |
	point := ObservablePoint new.
	point property: #x whenChangedDo: [ :new | newValue := new ].

	point x: 17.

	self assert: newValue equals: 17.
]
