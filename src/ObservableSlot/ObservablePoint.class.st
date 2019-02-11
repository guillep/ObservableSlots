Class {
	#name : #ObservablePoint,
	#superclass : #Object,
	#traits : 'TObservable',
	#classTraits : 'TObservable classTrait',
	#instVars : [
		'#x => ObservableSlot',
		'#y => ObservableSlot'
	],
	#category : #ObservableSlot
}

{ #category : #initialization }
ObservablePoint >> initialize [
	super initialize.
	self class initializeSlots: self.
]

{ #category : #events }
ObservablePoint >> notifyPropertyChanged: aName [

	(self observablePropertyNamed: aName) valueChanged
]

{ #category : #accessing }
ObservablePoint >> x [
	^ x
]

{ #category : #accessing }
ObservablePoint >> x: anInteger [ 
	x := anInteger
]

{ #category : #accessing }
ObservablePoint >> y [
	^ y
]

{ #category : #accessing }
ObservablePoint >> y: anInteger [ 
	y := anInteger
]
