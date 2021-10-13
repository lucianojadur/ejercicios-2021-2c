!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 10/12/2021 12:13:24'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook timeLimit |
	
	customerBook := CustomerBook new.
	timeLimit := Duration milliSeconds: 50.
	
	self should: [ customerBook addCustomerNamed: 'John Lennon' ] notTakeMoreThan: timeLimit.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 10/12/2021 12:18:06'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook timeLimit customer|
	
	customer := 'Paul McCartney'.
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: customer.
	timeLimit := Duration milliSeconds: 100.
	
	self should: [ customerBook removeCustomerNamed: customer ] notTakeMoreThan: timeLimit.

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 10/12/2021 15:20:14'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self should: [ customerBook addCustomerNamed: '' ] raise: Error withMessageText: (CustomerBook customerCanNotBeEmptyErrorMessage).
	self assert: customerBook isEmpty.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 10/12/2021 15:24:35'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'John Lennon'.
	
	self should: [ customerBook removeCustomerNamed: 'Paul McCartney' ] raise: NotFound.
	self assert: 1 equals: (customerBook numberOfCustomers).
	self assert: (customerBook includesCustomerNamed: 'John Lennon').
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NR 4/3/2019 10:50:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 10/12/2021 16:41:10'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'John Lennon'.
	
	self should: [ customerBook suspendCustomerNamed: 'Ringo Starr' ] raise: CantSuspend.
	self assert: 1 equals: (customerBook numberOfCustomers).
	self assert: (customerBook includesCustomerNamed: 'John Lennon').! !

!CustomerBookTest methodsFor: 'tests' stamp: 'IB 10/12/2021 16:36:34'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook customer |
			
	customerBook := CustomerBook new.
	customer := 'John Lennon'.
	customerBook addCustomerNamed: customer.
	customerBook suspendCustomerNamed: customer.
	
	self should: [ customerBook suspendCustomerNamed: customer ] raise: CantSuspend.
	self assert: 1 equals: (customerBook numberOfCustomers).
	self assert: (customerBook includesCustomerNamed: customer).! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'IB 10/13/2021 13:31:28'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'IB 10/13/2021 13:33:29'!
removeCustomerNamed: aName 
 
	active remove: aName ifAbsent: [
			suspended remove: aName ifAbsent: [
					^ NotFound signal.
				].
		].
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'IB 10/13/2021 13:32:12'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
