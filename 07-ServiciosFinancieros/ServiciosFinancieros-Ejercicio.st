!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 02:54:51'!
test01ANewPortfolioIsCreatedEmpty
	
	|aPortfolio|
	
	aPortfolio  := Portfolio new .
	
	self assert: aPortfolio isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:34:40'!
test02APortfolioWithAccountsIsNotEmpty
	
	|aPortfolio |
	
	aPortfolio := Portfolio new.
	aPortfolio register: ReceptiveAccount new.
	
	self deny: aPortfolio isEmpty.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:35:26'!
test03APortfoliosBalanceIsTheSumOfItsAccountsBalance

	|aPortfolio firstAccount secondAccount|
	
	aPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount  := ReceptiveAccount new.
	
	aPortfolio register: firstAccount ; register: secondAccount .
	Deposit register: 100 * peso on: firstAccount .
	Deposit  register: 200 * peso on: secondAccount .
	
	self assert: 300 * peso equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:35:44'!
test04APortfolioWithAnInnerPortfolioIsNotEmpty
	
	|mainPortfolio innerPortfolio|
	
	mainPortfolio := Portfolio new.
	innerPortfolio := Portfolio new.
	
	mainPortfolio register: innerPortfolio .
	self deny: mainPortfolio isEmpty.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:36:00'!
test05AnInnerPortfoliosBalanceContributesToThePortfoliosBalanceWichContainsIt
	
	|mainPortfolio innerPortfolio anAccount|
	
	mainPortfolio := Portfolio new.
	innerPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	mainPortfolio register: innerPortfolio .
	innerPortfolio register: anAccount .
	
	Deposit register: 100 * peso on: anAccount .
	self assert: 100 * peso equals: mainPortfolio balance .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 04:13:30'!
test06APortfolioKnowsHowManyTransactionsItsInnerAccountsHave
	
	|aPortfolio anAccount aTransaction|
	
	aPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	
	aPortfolio register: anAccount .
	aTransaction := Deposit register: 100 * peso on: anAccount .

"Estos primeros asserts no van, pero los dejé para chequear que efectivamente se guarde la plata en el portafolio
y que la transacción se guarde en la cuenta.  Hay que revisar el hasRegistered de Portfolio.
	self assert: 100 * peso equals: (aPortfolio balance ).
	self assert: (anAccount hasRegistered: aTransaction). "
	
"Acabo de corregir el mensaje y la prueba pasa, pero la implementación está bien fea.
Intenté con el detect pero me daba un error así que  usé un do: con un if dentro. Habría que refactorizarlo para que sea menos falopa"
	self assert: (aPortfolio hasRegistered: aTransaction).! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lj 11/28/2021 01:37:39'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
	
	"Ojo que acá creo que estamos testeando más de una funcionalidad (x un lado que crezca su tamaño y por el otro
	que se pueda saber si una transacción fue registrada en la cuenta."
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lj 11/28/2021 01:55:21'!
test08AnAccountCanReceiveMoneyFromAnotherAccount
	
	|receiver emitter someMoney|
	
	receiver := ReceptiveAccount new.
	emitter := ReceptiveAccount new.
	someMoney := 100 * peso.
	
	emitter transfer: someMoney to: receiver.
	
	self assert: someMoney equals: receiver balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lj 11/28/2021 02:25:52'!
test09AnAccountLosesMoneyIfItTransfersToAnotherAccount

	|receiver emitter someMoney emittersInitialBalance|
	
	receiver := ReceptiveAccount new.
	emitter := ReceptiveAccount new.
	someMoney := 100 * peso.
	emittersInitialBalance  := 2 * someMoney .
	Deposit register: emittersInitialBalance on: emitter.
	
	emitter transfer: someMoney to: receiver .
	self assert:  someMoney equals: emitter balance.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'IB 11/25/2021 20:10:44'!
updateBalance
	^ self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'IB 11/25/2021 20:12:58'!
updateBalance
	^ [:balance | balance + value].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'IB 11/25/2021 20:13:14'!
updateBalance
	^ [:balance | balance - value].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialEntity category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinancialEntity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!FinancialEntity methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:30:18'!
balance
	^ self subclassResponsibility .! !

!FinancialEntity methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:42:52'!
hasRegistered: aTransaction
	^ self subclassResponsibility .! !

!FinancialEntity methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:31:13'!
register: aFinancialEntity
	^ self subclassResponsibility .! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
FinancialEntity subclass: #Portfolio
	instanceVariableNames: 'innerStuff'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:37:36'!
balance

	^ innerStuff sum: [:stuff | stuff balance] ifEmpty: [0].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 04:11:17'!
hasRegistered: aTransaction
	
	^ innerStuff do: [:someStuff| (someStuff hasRegistered: aTransaction) ifTrue: [^ true]].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:32:31'!
initialize
	
	innerStuff := OrderedCollection new.
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:33:37'!
isEmpty

	 ^ (innerStuff size) = 0.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'lj 11/28/2021 03:38:11'!
register: aFinancialEntity
	
	innerStuff add: aFinancialEntity .! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
FinancialEntity subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'IB 11/25/2021 20:15:37'!
balance
	| balance |
	balance := 0.
	transactions do: [ :aTransaction | balance := aTransaction updateBalance value: balance].
	^ balance.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'lj 11/28/2021 02:10:19'!
transfer: anAmountOfMoney to: anotherAccount
	|aDeposit aWithdraw|
	
	aDeposit := Deposit register: anAmountOfMoney on: anotherAccount .
	aWithdraw := Withdraw register: anAmountOfMoney on: self.! !
