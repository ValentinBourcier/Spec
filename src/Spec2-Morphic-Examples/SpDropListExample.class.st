"
A DropListExample is a simple example of how to use drop lists.

self example
"
Class {
	#name : #SpDropListExample,
	#superclass : #SpPresenter,
	#instVars : [
		'container',
		'morph1',
		'morph2',
		'morph3',
		'uniformDropList',
		'heterogeneousDropList'
	],
	#category : #'Spec2-Morphic-Examples'
}

{ #category : #layout }
SpDropListExample class >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		add:
			(SpBoxLayout newLeftToRight
				add: #uniformDropList;
				add: #heterogeneousDropList;
				yourself)
			height: self toolbarHeight;
		add: #container;
		yourself
]

{ #category : #examples }
SpDropListExample class >> example [

	<sampleInstance>
	^ self new open
]

{ #category : #specs }
SpDropListExample class >> title [

	^ 'Drop list'
]

{ #category : #accessing }
SpDropListExample >> container [
	^ container
]

{ #category : #initialization }
SpDropListExample >> containerMorph [
	^ container morph
]

{ #category : #accessing }
SpDropListExample >> heterogeneousDropList [
	^ heterogeneousDropList
]

{ #category : #initialization }
SpDropListExample >> initializePresenters [

	uniformDropList := self newDropList.
	heterogeneousDropList := self newDropList.
	container := self newMorph.
	container morph: PanelMorph new.
	self instantiateMorphs.
	self containerMorph
		changeTableLayout;
		listDirection: #bottomToLeft.
	uniformDropList
		items: {
				morph1.
				morph2.
				morph3 };
		display: [ :m | m color name capitalized , ' morph' ];
		displayIcon: [ :e | self iconNamed: #testGreen ];
		whenSelectedItemChangedDo: [ :m |
			self containerMorph
				removeAllMorphs;
				addMorph: m ].
	heterogeneousDropList
		addItemLabeled: 'Option one'
		do: [  ]
		icon: (self iconNamed: #smallOk);
		addItemLabeled: 'Inspect current morph'
		do: [ self systemNavigation inspect: uniformDropList selectedItem ]
		icon: (self iconNamed: #testRed).

	"If this is uncommented, it will fire the action of the first item, which is not what we want:
	heterogeneousDropList setSelectedIndex: 1.
	same for:
	heterogeneousDropList setIndex: 1"
	uniformDropList selectIndex: 1.
	self setFocus
]

{ #category : #initialization }
SpDropListExample >> instantiateMorphs [

	morph1 := Morph new
					color: Color red;
					width: 60;
					height: 20.
	morph2 := Morph new
					color: Color blue;
					width: 20;
					height: 60.
	morph3 := Morph new
					color: Color green;
					width: 50;
					height: 50
]

{ #category : #initialization }
SpDropListExample >> setFocus [

	self focusOrder
		add: uniformDropList;
		add: heterogeneousDropList
]

{ #category : #accessing }
SpDropListExample >> uniformDropList [

	^ uniformDropList
]
