"
Display the toolbar with icons only
"
Class {
	#name : #SpIconToolbarDisplayMode,
	#superclass : #SpToolbarDisplayMode,
	#category : #'Spec2-Core-Widgets'
}

{ #category : #configuring }
SpIconToolbarDisplayMode >> configureButton: aButton item: aToolbarItem [
	"ask for icon (no label)"
	aButton getIconSelector: #icon.
	aButton badgeSelector: #badge.
	aButton getStateSelector: #state
]

{ #category : #accessing }
SpIconToolbarDisplayMode >> extent [

	^ (30@30) scaledByDisplayScaleFactor
]

{ #category : #accessing }
SpIconToolbarDisplayMode >> label [

	^ 'Icon'
]

{ #category : #accessing }
SpIconToolbarDisplayMode >> styleName [ 

	^ 'toolBar.icons'
]
