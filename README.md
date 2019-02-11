# ObservableSlots

Pharo language extension to have slots that announce changes

# Installation

Clone this project with Iceberg and load the single package.
Check the tutorial in [here](https://github.com/pharo-vcs/iceberg/wiki/Tutorial).
This project will be soon integrated as part of the Pharo distribution or the Spec UI framework.

# Usage

## Defining Observable Slots

Once the package is loaded, you will be able to create new classes with observable slots like this:

```smalltalk
Object subclass: #ObservablePoint
	slots: { #x => ObservableSlot. 
				#y }
	classVariables: {  }
	package: 'ObservableSlot'
```

An observable slot works like a normal slot, and hides completely the announcement mechanism that is behind:

```smalltalk
"Create Accessors"
ObservablePoint >> x: aNumber [
  x := aNumber
].
ObservablePoint >> x [
  ^ x
].

"Create an observable point and use it normally"
point := ObservablePoint new.
point x: 17.
self assert: point x equals: 17.
```

## Subscribing to Slots Changes

To subscribe to the ObservableSlot changes, your object can use the `TObservable` trait, that contains some methods for subscription and explicit notification.

```smalltalk
Object subclass: #ObservablePoint
  uses: TObservable
	slots: { #x => ObservableSlot. 
				#y }
	classVariables: {  }
	package: 'ObservableSlot'
```

Then we can subscribe to it doing

```smalltalk
"Create an observable point and use it normally"
point property: #x whenChangedDo: [ "your code" ].
```

The method `property:whenChangedDo:` receives as first argument the name of the instance variable (as a symbol) and as second argument a block.
The block has either a single parameter (where it will be passed the value that has just changed) or no parameter at all.

## Manually Announce Slots Changes

Sometimes we want to have control on the announcements and manually announce that a value changed.
For example, imagine a (not so) more complex graph like:

```
abObservablePoint -- x (observable) --> someObject -- someOtherInstVar (non-observable) --> someOtherObject
```

If `someObject` has its `someOtherInstVar` changed, we could want to announce that `x` changed too.
That could be done by doing:

```smalltalk
point notifyPropertyChanged: #x.
```

## Expected exceptions

If the property we want to subscribe or notify to does not exist a `SlotNotFound` will be risen.
If the property exists but is not observable a `NonObservableSlotError` will be risen.
