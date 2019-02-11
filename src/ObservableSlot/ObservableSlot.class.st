Class {
	#name : #ObservableSlot,
	#superclass : #IndexedSlot,
	#category : #ObservableSlot
}

{ #category : #'code generation' }
ObservableSlot >> emitStore: aMethodBuilder [
	| temp |
	temp := Object new.
	"We pop the value from the stack into a temp to push it back in the right order"
	aMethodBuilder addTemp: temp.
	aMethodBuilder storeTemp: temp.
	
	"Push the value holder into the stack, then the value again, then send"
	aMethodBuilder pushInstVar: index.
	aMethodBuilder pushTemp: temp.
	aMethodBuilder send: #value:
]

{ #category : #'code generation' }
ObservableSlot >> emitValue: aMethodBuilder [
	"Push the value holder into the stack"
	aMethodBuilder pushInstVar: index.
	aMethodBuilder send: #value
]

{ #category : #initialization }
ObservableSlot >> initialize: anObject [

	super write: nil asValueHolder to: anObject
]

{ #category : #testing }
ObservableSlot >> isObservableSlot [
	
	^ true
]

{ #category : #initialization }
ObservableSlot >> read: anObject [

	^ (super read: anObject) value
]

{ #category : #initialization }
ObservableSlot >> wantsInitalization [

	^ true
]

{ #category : #initialization }
ObservableSlot >> write: aValue to: anObject [

	(super read: anObject) value: aValue.
	^ aValue
]
