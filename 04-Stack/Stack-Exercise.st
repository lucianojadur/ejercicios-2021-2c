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


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: 'content next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'lj 10/31/2021 23:36:27'!
add: anElement
	content := anElement
	! !

!Node methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:09:39'!
content
	self subclassResponsibility .! !

!Node methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:06:17'!
next
	self subclassResponsibility .! !

!Node methodsFor: 'as yet unclassified' stamp: 'lj 10/31/2021 23:43:39'!
next: aNode
	next := aNode .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:18:54'!
with: anElement
	|node|
	node := FilledNode new .
	node add: anElement.
	^ node.! !

!Node class methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:19:59'!
with: anElement after: aNode
	|node|
	node := FilledNode new .
	node add: anElement.
	node next: aNode .
	^ node.! !


!classDefinition: #EmptyNode category: 'Stack-Exercise'!
Node subclass: #EmptyNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:30:54'!
content
	"Preguntar si es correcto enviar una excepción hacia 'arrbia' (stack) y maniobrarla o si se puede desde acá mismo devolver un
	error: OOStack stackEmpty... (me parece falopa esto último pero la primera opción creo que rompe con lo que pide la consigna)."
	 self error: 'Empty node'.! !

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:30:49'!
next
	"Preguntar si es correcto enviar una excepción hacia 'arrbia' (stack) y maniobrarla ahí o si se puede desde acá mismo devolver un
	error: OOStack stackEmpty... (me parece falopa esto último pero la primera opción creo que rompe con lo que pide la consigna)."
	 self error: 'Empty node'.! !


!classDefinition: #FilledNode category: 'Stack-Exercise'!
Node subclass: #FilledNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledNode methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:24:02'!
content

	^ content.! !

!FilledNode methodsFor: 'as yet unclassified' stamp: 'lj 11/1/2021 02:06:01'!
next
	
	^ next .! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'updating messages' stamp: 'lj 11/1/2021 02:20:47'!
pop
	|element|
	
	[	
		element := top content.
		top := top next.
		size := size - 1.
		^ element.
	 ]on: Error do: [self error: OOStack stackEmptyErrorDescription].
	! !

!OOStack methodsFor: 'updating messages' stamp: 'lj 10/31/2021 23:49:03'!
push: anElement
	top := Node with: anElement after: top.
	size := size + 1.
	! !


!OOStack methodsFor: 'status-check messages' stamp: 'lj 11/1/2021 00:09:27'!
initialize

	top := EmptyNode new.
	size := 0 .! !

!OOStack methodsFor: 'status-check messages' stamp: 'lj 10/31/2021 23:48:13'!
isEmpty
	
	^ size = 0.! !

!OOStack methodsFor: 'status-check messages' stamp: 'lj 10/31/2021 23:51:24'!
size
	^ size.! !

!OOStack methodsFor: 'status-check messages' stamp: 'lj 11/1/2021 02:05:32'!
top
	
	[^ top content] on: Error do: [ self error: OOStack stackEmptyErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
