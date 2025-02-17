"
A superclass for particular Spec demo pages, that need to define a page name and priority in the list of demos.
"
Class {
	#name : #SpDemoPage,
	#superclass : #SpPresenter,
	#instVars : [
		'tabManager'
	],
	#category : #'Spec2-Examples-Demo'
}

{ #category : #accessing }
SpDemoPage class >> availablePages [
	^ self allSubclasses sort: #priority ascending
]

{ #category : #initialization }
SpDemoPage class >> pageName [

	self subclassResponsibility 

]

{ #category : #initialization }
SpDemoPage class >> priority [

	^ 999
]

{ #category : #initialization }
SpDemoPage >> codeFor: aClass [
	^ TonelWriter sourceCodeOf: aClass
]

{ #category : #initialization }
SpDemoPage >> codeTab [
	^ SpNotebookPage
		title: 'Code'
		icon: (self iconNamed: #changeUpdate)
		provider: [ self newText
				text: (self codeFor: self pageClass);
				yourself ]
]

{ #category : #layout }
SpDemoPage >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: tabManager;
		  yourself
]

{ #category : #initialization }
SpDemoPage >> exampleTab [
	^ SpNotebookPage title: 'Example' icon: (self iconNamed: #smallPaint) provider: [ self instantiate: self pageClass ]
]

{ #category : #initialization }
SpDemoPage >> initializePresenters [

	tabManager := self newNotebook.
	"tabManager whenTabSelected: [ self updateTitle ]."
	tabManager
		addPage: self exampleTab;
		addPage: self codeTab.
]

{ #category : #initialization }
SpDemoPage >> pageClass [

	self subclassResponsibility 

]

{ #category : #accessing }
SpDemoPage >> tabManager [
	^ tabManager
]

{ #category : #accessing }
SpDemoPage >> tabManager: anObject [
	tabManager := anObject
]
