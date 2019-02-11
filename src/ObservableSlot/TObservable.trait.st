Trait {
	#name : #TObservable,
	#category : #ObservableSlot
}

{ #category : #events }
TObservable >> property: aString whenChangedDo: aBlockClosure [ 
	
	"Obtain the raw value.
	We need to access the underlying value holder to subscribe to it"
	(self instVarNamed: aString) whenChangedDo: aBlockClosure
]
