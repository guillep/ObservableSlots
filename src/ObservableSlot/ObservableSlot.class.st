Class {
	#name : #ObservableSlot,
	#superclass : #IndexedSlot,
	#category : #ObservableSlot
}

{ #category : #initialization }
ObservableSlot >> initialize: anObject [

	super write: nil asValueHolder to: anObject
]

{ #category : #initialization }
ObservableSlot >> read: anObject [

	^ (super read: anObject) value
]

{ #category : #initialization }
ObservableSlot >> write: aValue to: anObject [

	(super read: anObject) value: aValue.
	^ aValue
]
