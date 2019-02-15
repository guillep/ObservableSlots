Class {
	#name : #BaselineOfObservableSlot,
	#superclass : #BaselineOf,
	#category : #BaselineOfObservableSlot
}

{ #category : #baselines }
BaselineOfObservableSlot >> baseline: spec [
	<baseline>
	spec
		for: #common do: [ 
			spec
				package: 'ObservableSlot' ]

]
