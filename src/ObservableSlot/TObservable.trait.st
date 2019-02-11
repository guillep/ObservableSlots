Trait {
	#name : #TObservable,
	#category : #ObservableSlot
}

{ #category : #events }
TObservable >> observablePropertyNamed: aName [
	
	(self class slotNamed: aName) isObservableSlot
		ifFalse: [ NonObservableSlotError signal: aName ].

	"Obtain the raw value.
	We need to access the underlying value holder to subscribe to it"
	^ self instVarNamed: aName
]

{ #category : #events }
TObservable >> property: aName whenChangedDo: aBlockClosure [ 
	
	"Obtain the raw value.
	We need to access the underlying value holder to subscribe to it"
	(self observablePropertyNamed: aName) whenChangedDo: aBlockClosure
]
