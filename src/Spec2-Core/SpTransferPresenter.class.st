"
I am a model representing a transfer during a drag and drop operation. I keep a pointer the source of the drag, and a pointer to what is dragged
"
Class {
	#name : #SpTransferPresenter,
	#superclass : #SpAbstractWidgetPresenter,
	#instVars : [
		'#passenger => ObservableSlot',
		'#source => ObservableSlot'
	],
	#category : #'Spec2-Core-Support'
}

{ #category : #specs }
SpTransferPresenter class >> adapterName [

	^ #TransferAdapter
]

{ #category : #accessing }
SpTransferPresenter >> from: aModel [
	source := aModel
]

{ #category : #accessing }
SpTransferPresenter >> passenger [
	^ passenger
]

{ #category : #accessing }
SpTransferPresenter >> source [
	^ source
]

{ #category : #accessing }
SpTransferPresenter >> transfer: anObject [
	passenger := anObject
]
