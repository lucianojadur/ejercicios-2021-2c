!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:34:20'!
test01FInderShouldntFindAnySentenceWhenCreated
	| finder aPrefix aStack|
	aStack := OOStack new.
	finder := SentenceFinderByPrefix in: aStack.
	aPrefix := PrefixController withValue: 'asdfg'.
	
	self assert: 0 equals: (finder find: aPrefix) size.
		
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:25:48'!
test02FinderMustFindSentencesThatMatchWithThePrefix
	|stack finder match prefix sentenceOne sentenceTwo sentenceThree|
	
	stack := OOStack new.
	prefix := PrefixController withValue: 'That'.
	sentenceOne := 'Thats what she said'.
	sentenceTwo := 'This is America'.
	sentenceThree := 'That escalated quickly'.
	stack push: sentenceOne; push: sentenceTwo; push: sentenceThree.
	
	finder := SentenceFinderByPrefix in: stack.
	match := finder find: prefix .
	
	self assert: sentenceOne equals: match pop.
	self assert: sentenceThree equals: match pop.
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:55:34'!
test03FinderMustKeepInitialOrderAferFindingSentences
	|finder sentenceOne sentenceTwo prefix stack |
	
	stack := OOStack new .
	prefix := PrefixController withValue: 'Hell'.
	sentenceOne := 'Hello'.
	sentenceTwo := 'Hello World'.
	stack push: sentenceOne.
	stack push: sentenceTwo.
	
	finder := SentenceFinderByPrefix in: stack .
	finder find: prefix.
	
	self assert: sentenceTwo equals: finder removeLastSavedSentence .
	self assert: sentenceOne equals: finder removeLastSavedSentence .! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:26:29'!
test04FinderReturnsAnEmptyStackIfPrefixDoesNotMatchWithAnySentence
	|finder match sentenceOne sentenceTwo prefix stack |
	
	stack := OOStack new .
	prefix := PrefixController withValue: 'bye'.
	sentenceOne := 'Hello'.
	sentenceTwo := 'Hello World'.
	stack push: sentenceOne.
	stack push: sentenceTwo.
	
	finder := SentenceFinderByPrefix in: stack .
	match := finder find: prefix.
	self assert: 0 equals: match size.
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:51:16'!
test05FinderByPrefixWorksCaseSensitive
	|finder sentenceOne sentenceTwo sentenceThree prefix stack foundSentences|
	
	stack := OOStack new .
	prefix := PrefixController withValue: 'Fo'.
	sentenceOne := 'Forrest, run!!'.
	sentenceTwo := 'forget about it'.
	sentenceThree := 'For Frodo'.
	stack push: sentenceOne.
	stack push: sentenceTwo.
	stack push: sentenceThree.
	
	finder := SentenceFinderByPrefix in: stack .
	foundSentences := finder find: prefix.
	
	[0 < foundSentences size] whileTrue: [
		self deny: (sentenceTwo = foundSentences pop).
	]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:40:33'!
test06SearchWithSpacesInPrefixDoesNotWork
	|prefix finder  stack |
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix in: stack.
	prefix := PrefixController withValue: 'hi '.
	self
		should: [ finder find: prefix ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = InvalidPrefix invalidPrefixErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 18:02:09'!
test07SearchWithAnEmptyPrefixDoesNotWork
	|prefix finder  stack |
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix in: stack.
	prefix := PrefixController withValue: ''.
	self
		should: [ finder find: prefix ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = InvalidPrefix invalidPrefixErrorDescription ]! !


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:09:39'!
content
	self subclassResponsibility .! !


!classDefinition: #EmptyNode category: 'Stack-Exercise'!
Node subclass: #EmptyNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 20:26:54'!
content
	"Preguntar si es correcto enviar una excepción hacia 'arrbia' (stack) y maniobrarla o si se puede desde acá mismo devolver un
	error: OOStack stackEmpty... (me parece falopa esto último pero la primera opción creo que rompe con lo que pide la consigna)."
	 self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #FilledNode category: 'Stack-Exercise'!
Node subclass: #FilledNode
	instanceVariableNames: 'content next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledNode methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:24:02'!
content

	^ content.! !

!FilledNode methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 20:30:25'!
initializeWith: anElement after: aNode
	content := anElement.
	next := aNode.! !

!FilledNode methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:06:01'!
next
	
	^ next .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledNode class' category: 'Stack-Exercise'!
FilledNode class
	instanceVariableNames: ''!

!FilledNode class methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 20:32:47'!
with: anElement after: aNode
	
	^ self new initializeWith: anElement after: aNode! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'updating messages' stamp: 'lj 11/1/2021 20:43:25'!
pop
	|element|
	
	element := self top.
	top := top next.
	size := size - 1.
	^ element.
	 
	! !

!OOStack methodsFor: 'updating messages' stamp: 'lj 11/1/2021 20:33:06'!
push: anElement
	top := FilledNode with: anElement after: top.
	size := size + 1.
	! !


!OOStack methodsFor: 'status-check messages' stamp: 'lj 11/1/2021 20:42:07'!
initialize

	top := EmptyNode new.
	"delegar el método del mensaje size a los nodos"
	size := 0 .! !

!OOStack methodsFor: 'status-check messages' stamp: 'lj 11/1/2021 20:09:38'!
isEmpty
	
	^ size = 0.! !

!OOStack methodsFor: 'status-check messages' stamp: 'lj 10/31/2021 23:51:24'!
size
	^ size.! !

!OOStack methodsFor: 'status-check messages' stamp: 'lj 11/1/2021 20:41:07'!
top
	
	^ top content! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'lj 11/1/2021 20:26:24'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #PrefixController category: 'Stack-Exercise'!
Object subclass: #PrefixController
	instanceVariableNames: 'charString'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixController methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 18:33:45'!
findMatchesIn: aStack
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixController class' category: 'Stack-Exercise'!
PrefixController class
	instanceVariableNames: ''!

!PrefixController class methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 18:04:39'!
withValue: aString
	(aString size = 0) | (aString includesSubString: ' ') ifTrue:[^ InvalidPrefix new. ].
	^ CorrectPrefix new initializeWith: aString.! !


!classDefinition: #CorrectPrefix category: 'Stack-Exercise'!
PrefixController subclass: #CorrectPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!CorrectPrefix methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 16:34:07'!
findMatchesWith: aFinder
	^ aFinder matchSentencesWith: self.! !

!CorrectPrefix methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 16:50:00'!
initializeWith: aString
	charString := aString.! !

!CorrectPrefix methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 15:36:49'!
matchWith: aString
	(aString includesSubString: charString ) ifTrue:[
		^ aString.	
	].! !

!CorrectPrefix methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:23:35'!
matchWith: aString andPushTo: aStack
	(aString includesSubString: charString ) ifTrue:[
		^ aStack push: aString.	
	].! !


!classDefinition: #InvalidPrefix category: 'Stack-Exercise'!
PrefixController subclass: #InvalidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!InvalidPrefix methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:39:55'!
findMatchesWith: aStack
 	self error: InvalidPrefix invalidPrefixErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefix class' category: 'Stack-Exercise'!
InvalidPrefix class
	instanceVariableNames: ''!

!InvalidPrefix class methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 15:39:05'!
invalidPrefixErrorDescription
	^ 'The prefix contains empty spaces'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 12:17:26'!
add: aSentence
	sentences push: aSentence.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:32:25'!
find:  aPrefix

	^ aPrefix findMatchesWith: self.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 17:57:53'!
matchSentencesWith: aPrefix 
	| auxiliarStack matches |
	auxiliarStack  := OOStack  new .
	matches := OOStack new. 
	
	"We use a conditional loop bc there's no need to define a polymorphic behavior as <self> just needs to inspect
	the sentences in the stack, which only allows it by unstacking each element, and this reduces its size until being empty always,
	so it won't work other way in any other situation."
	[sentences size > 0] whileTrue: [
		auxiliarStack push: sentences pop.
		 aPrefix matchWith: auxiliarStack top andPushTo: matches.
	].
	self restartSentencesFrom: auxiliarStack .	
	^ matches.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'lj 11/4/2021 14:14:12'!
initializeWith: aStack
	sentences := aStack.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'lj 11/4/2021 17:55:00'!
removeLastSavedSentence
	"This message was code in order to check that the original order of the stack remains the same 
	by modifying it from the SentenceFinder and not from outside it."
	^ sentences pop.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'lj 11/4/2021 17:03:08'!
restartSentencesFrom: anAuxiliarStack
	[anAuxiliarStack size > 0] whileTrue: [
		sentences push: anAuxiliarStack pop.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'lj 11/4/2021 18:07:32'!
in: aStack
	"By decision, a SentenceFinder instance MUST contain a certain and unique stack from which it'll find 
	sentences to match with a certain prefix (the latter will be an external colab.)."
	^ self new initializeWith: aStack.! !
