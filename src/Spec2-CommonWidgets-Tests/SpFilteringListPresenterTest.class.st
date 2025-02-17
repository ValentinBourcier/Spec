"
A SpListWithFilterPresenterTest is a test class for testing the behavior of SpListWithFilterPresenter
"
Class {
	#name : #SpFilteringListPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'listWithFilter'
	],
	#category : #'Spec2-CommonWidgets-Tests'
}

{ #category : #accessing }
SpFilteringListPresenterTest >> classToTest [

	^ SpFilteringListPresenter
]

{ #category : #running }
SpFilteringListPresenterTest >> setUp [

	super setUp.
	listWithFilter := self classToTest new
]

{ #category : #tests }
SpFilteringListPresenterTest >> testEnableItemBeginsWithFilter [

	listWithFilter matchBeginOfString.
	listWithFilter items: { 
			Number.
			Character.
			String.
			OrderedCollection.
			HashedCollection.
			Array }.
	listWithFilter applyFilter:  'NUM'.
	self assert: listWithFilter items size equals: 1.
	listWithFilter applyFilter:  'COLLECTION'.
	self assert: listWithFilter items size equals: 0.
	listWithFilter applyFilter:  'ARACTER'.
	self assert: listWithFilter items size equals: 0.
	listWithFilter applyFilter:  'STRIN'.
	self assert: listWithFilter items size equals: 1.
	listWithFilter applyFilter:  'arrAY'.
	self assert: listWithFilter items size equals: 1.
	listWithFilter applyFilter:  ''.
	self assert: listWithFilter items size equals: 6
]

{ #category : #tests }
SpFilteringListPresenterTest >> testEnableItemSubstringFilter [

	listWithFilter matchSubstring.
	listWithFilter items: { 
			Number.
			Character.
			String.
			OrderedCollection.
			HashedCollection.
			Array }.
	listWithFilter applyFilter: 'BER'.
	self assert: listWithFilter items size equals: 1.
	listWithFilter applyFilter: 'COLLECTION'.
	self assert: listWithFilter items size equals: 2.
	listWithFilter applyFilter:  'TRIN'.
	self assert: listWithFilter items size equals: 1.
	listWithFilter applyFilter:  'arrAY'.
	self assert: listWithFilter items size equals: 1.
	listWithFilter applyFilter: ''.
	self assert: listWithFilter items size equals: 6
]

{ #category : #tests }
SpFilteringListPresenterTest >> testFilterListItems [

	| listItems |
	listItems := { 
		             OrderedCollection.
		             Array.
		             SequenceableCollection.
		             Set.
		             Dictionary }.
	listWithFilter items: listItems.
	listWithFilter filterListItems: 'collection'.
	self assertCollection: listWithFilter items hasSameElements: { 
			OrderedCollection.
			SequenceableCollection }.
	listWithFilter filterListItems: 'xyz'.
	self assertEmpty: listWithFilter items.
	listWithFilter filterListItems: 'array'.
	self
		assertCollection: listWithFilter items
		hasSameElements: { Array }.
	listWithFilter filterListItems: ''.
	self
		assertCollection: listWithFilter items
		hasSameElements: listItems.
	listItems := 1 to: 10.
	listWithFilter items: listItems.
	listWithFilter filterListItems: 'collection'.
	self assertEmpty: listWithFilter items.
	listWithFilter filterListItems: '5'.
	self assertCollection: listWithFilter items hasSameElements: #( 5 ).
	listWithFilter filterListItems: ''.
	self
		assertCollection: listWithFilter items
		hasSameElements: listItems.
	listItems := #( 'a' 'e' 'i' 'o' 'u' ).
	listWithFilter listPresenter items: listItems.
	listWithFilter filterListItems: '5'.
	self assertEmpty: listWithFilter items.
	listWithFilter filterListItems: 'a'.
	self assertCollection: listWithFilter items hasSameElements: #( 'a' ).
	listWithFilter filterListItems: ''.
	self
		assertCollection: listWithFilter items
		hasSameElements: listItems
]

{ #category : #tests }
SpFilteringListPresenterTest >> testFilterListItemsWithDifferentDisplay [

	| listItems |
	listItems := { OrderedCollection.
		             Array.
		             SequenceableCollection.
		             Set.
		             Dictionary }.
	listWithFilter  items: listItems.
	listWithFilter  display: [ :each | each name asHex ].
	listWithFilter applyFilter: 'Collection' asHex.
	self assertCollection: listWithFilter  items hasSameElements: { 
			OrderedCollection.
			SequenceableCollection }.
	listWithFilter applyFilter: 'xyz'.
	self assertEmpty: listWithFilter  items.
	listWithFilter applyFilter: 'Array' asHex.
	self
		assertCollection: listWithFilter  items
		hasSameElements: { Array }.
	listWithFilter applyFilter: ''.
	self
		assertCollection: listWithFilter  items
		hasSameElements: listItems
]

{ #category : #tests }
SpFilteringListPresenterTest >> testItemFilter [

	| filterBlock |
	filterBlock := [ :item :pattern | 
	               item asLowercase =
		               pattern asLowercase ].
	listWithFilter itemFilter: filterBlock.
	self assert: listWithFilter itemFilter equals: filterBlock
]

{ #category : #tests }
SpFilteringListPresenterTest >> testItems [

	listWithFilter items: { Array }.
	self assertCollection: listWithFilter items hasSameElements: { Array }
]

{ #category : #tests }
SpFilteringListPresenterTest >> testWhenSelectionChangedDo [ 
	| changed |

	changed := false.
	listWithFilter whenSelectionChangedDo: [ :selection | 
		changed := true ].

	listWithFilter items: #(a b c).
	
	listWithFilter listPresenter selectIndex: 2.
	
	self assert: changed
]
