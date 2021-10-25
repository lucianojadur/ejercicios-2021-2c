!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:15:37'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:11:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:16:19'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:26:23'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:44:24'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: (Numero with: negativeOne over: two)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'initialization' stamp: 'NR 9/8/2019 20:40:14'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Numero methodsFor: 'initialization' stamp: 'NR 9/8/2019 20:40:23'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:=#Fraccion.
	numerator := aNumerator.
	denominator := aDenominator ! !


!Numero methodsFor: 'accessing' stamp: 'IB 10/25/2021 12:57:20'!
denominator

	self subclassResponsibility.! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Numero methodsFor: 'printing' stamp: 'IB 10/25/2021 17:11:28'!
printOn: aStream
	
	self subclassResponsibility.! !


!Numero methodsFor: 'comparing' stamp: 'IB 10/25/2021 12:55:56'!
= anObject

	self subclassResponsibility.! !

!Numero methodsFor: 'comparing' stamp: 'IB 10/25/2021 14:02:31'!
hash
	self subclassResponsibility.! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'IB 10/25/2021 12:53:20'!
// aDivisor 
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:37:11'!
addFraction: aFraction
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 06:35:11'!
addInteger: aValue
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:38:00'!
divideByFraction: aFraction
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:39:16'!
divideByInteger: anIntegerValue
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'IB 10/25/2021 14:00:56'!
greatestCommonDivisorWith: anEntero 
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:39:31'!
multiplyByInteger: anIntegerValue
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:37:47'!
mutiplyByFraction: aFraction
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:38:24'!
substractFraction: aFraction
	self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 06:42:29'!
substractInteger: anIntegerValue
	self subclassResponsibility .! !


!Numero methodsFor: 'as yet unclassified' stamp: 'lj 10/18/2021 21:25:39'!
with: aValue
	|number|
	number := Entero new .
	number valueIs: aValue .
	^ number .! !

!Numero methodsFor: 'as yet unclassified' stamp: 'lj 10/18/2021 21:28:18'!
with: aNumerator over: aDenominator
	|number|
	number := Fraccion new .
	number valuesAre: aNumerator and: aDenominator .
	^ number.! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Nï¿½mero Invï¿½lido'! !


!Numero class methodsFor: 'instance creation' stamp: 'lj 10/25/2021 03:13:31'!
with: aValue 
	|number|
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	number := Entero new .
	number valueIs: aValue .
	
	^ number .! !

!Numero class methodsFor: 'instance creation' stamp: 'lj 10/25/2021 04:40:19'!
with: aDividend over: aDivisor

	|number greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^ Entero with: numerator integerValue].
	number := Fraccion with: numerator over: denominator .
	^ number.! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'as yet unclassified' stamp: 'IB 10/25/2021 12:57:47'!
denominator
	^ 1.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'lj 10/18/2021 21:24:28'!
valueIs: aNewValue
	value := aNewValue.! !


!Entero methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 08:36:04'!
* aMultiplier 

	^aMultiplier multiplyByInteger: value.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 06:28:01'!
+ anAdder 

	^ anAdder addInteger: value .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 06:45:16'!
- aSubtrahend 
	
	^ (aSubtrahend substractInteger: value) negated.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 08:24:29'!
/ aDivisor 

	^ (aDivisor divideByInteger: value) inverse .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 08:05:18'!
inverse
	^ Fraccion with: (Entero with: 1) over: self.! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'lj 10/24/2021 18:48:09'!
initalizeWith: aValue 
	|number|
	number := Entero new .
	number valueIs: aValue .
	
	^ number .! !


!Entero methodsFor: 'accessing' stamp: 'lj 10/24/2021 18:34:13'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^ value! !


!Entero methodsFor: 'printing' stamp: 'IB 10/25/2021 17:09:54'!
printOn: aStream
	
	aStream print value.! !


!Entero methodsFor: 'testing' stamp: 'lj 10/25/2021 06:54:52'!
isNegative
	
	^ value < 0! !

!Entero methodsFor: 'testing' stamp: 'lj 10/24/2021 18:41:27'!
isOne
	
	^ value = 1! !

!Entero methodsFor: 'testing' stamp: 'lj 10/24/2021 18:41:23'!
isZero
	
	^ value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 07:39:34'!
addFraction: aFraction
	|numerator|
	numerator := (value * (aFraction denominator) integerValue) + (aFraction numerator) integerValue .
	
	^Fraccion with: (Entero with: numerator) over: (aFraction denominator) .! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 06:35:26'!
addInteger: aValue
	^ Entero with: value + aValue .! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 07:48:31'!
divideByFraction: aFraction
	^ Fraccion with: self * (aFraction denominator) over: aFraction numerator! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 07:52:52'!
divideByInteger: anIntegerValue
	^ Fraccion with: (Entero with: value) over: (Entero with: anIntegerValue) .! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 07:46:15'!
divideFraction: aFraction
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:26:30'!
multiplyByFraction: aFraction
	^ Fraccion with: (aFraction numerator * self) over: aFraction denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:27:24'!
multiplyByInteger: aValue
	^ Entero with: value * aValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:21:05'!
substractFraction: aFraction
	| newNumerator |
	
	newNumerator := (aFraction denominator * self) - (aFraction numerator).
	
	^ Fraccion with: newNumerator over: aFraction denominator .
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 06:29:23'!
substractInteger: anIntegerValue
	^ Entero with: value - anIntegerValue . ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no estï¿½ definido aquï¿½ para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'lj 10/25/2021 06:55:23'!
with: aValue 
	|number|
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].

	number := Entero new .
	number valueIs: aValue .
	
	^ number.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'IB 10/25/2021 12:52:33'!
// aDivisor
	self error: 'Tipo de número no soportado'.
	! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'IB 10/25/2021 14:01:35'!
greatestCommonDivisorWith: anEntero 
	self error: 'Tipo de número no soportado'! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'lj 10/25/2021 07:05:18'!
valuesAre: aNumerator and: aDenominator

	numerator := aNumerator .
	denominator := aDenominator .! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 08:35:52'!
* aMultiplier 

	^aMultiplier multiplyByFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 08:24:42'!
+ anAdder 
	
	^ anAdder addFraction: self .! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 08:24:50'!
- aSubtrahend 
	
	^ (aSubtrahend substractFraction: self) negated.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 08:24:55'!
/ aDivisor 

	^ (aDivisor divideByFraction: self) inverse.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'lj 10/25/2021 08:01:28'!
inverse
	^ Fraccion with: denominator over: numerator.! !


!Fraccion methodsFor: 'comparing' stamp: 'IB 10/25/2021 12:55:36'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'lj 10/25/2021 06:53:24'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].

		
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'lj 10/25/2021 07:00:53'!
isNegative
	
	^ numerator isNegative or: denominator isNegative.! !

!Fraccion methodsFor: 'testing' stamp: 'lj 10/24/2021 18:41:32'!
isOne
	
	^ false! !

!Fraccion methodsFor: 'testing' stamp: 'lj 10/24/2021 18:41:37'!
isZero
	
	^ false! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 07:36:14'!
addFraction: aFraction
	| newNumerator newDenominator |
	
	newNumerator := (numerator * aFraction denominator) + (denominator * aFraction numerator).
	newDenominator := denominator * aFraction denominator.
	
	^ Fraccion with: newNumerator over: newDenominator .! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 06:50:38'!
addInteger: aValue
	|newNumerator|
	newNumerator := aValue * (denominator integerValue) + numerator integerValue.
	^ Fraccion with: (Entero with: newNumerator ) over: denominator .! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:12:07'!
divideByFraction: aFraction
	^ Fraccion with: (numerator * aFraction denominator) over: (denominator * aFraction numerator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 07:51:36'!
divideByInteger: anIntegerValue
	^ Fraccion with: numerator over: (Entero with: anIntegerValue * (denominator integerValue)).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:29:06'!
multiplyByFraction: aFraction
	^Fraccion with: (numerator * aFraction numerator) over: (denominator * aFraction denominator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:33:50'!
multiplyByInteger: anIntegerValue
	|newNumerator|
	newNumerator := (numerator integerValue) * anIntegerValue.
	^ Fraccion with: (Entero with: newNumerator) over: denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 08:14:13'!
substractFraction: aFraction
	|newNumerator newDenominator|
	
	newNumerator := (numerator * aFraction denominator) - (denominator * aFraction numerator).
	newDenominator := denominator * aFraction denominator.
	
	^ Fraccion with: newNumerator over: newDenominator .
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'lj 10/25/2021 06:51:06'!
substractInteger: anIntegerValue
	|newNumerator|
	newNumerator := (numerator integerValue) - (anIntegerValue * denominator integerValue) .
	^ Fraccion with: (Entero with: newNumerator) over: denominator! !


!Fraccion methodsFor: 'printing' stamp: 'IB 10/25/2021 17:11:09'!
printOn: aStream

	aStream
			print: numerator;
			nextPut: $/;
			print: denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'lj 10/25/2021 08:42:39'!
with: aDividend over: aDivisor

	|number numerator denominator remainder greatestCommonDivisor |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero  ifTrue: [ ^ Numero with: 0 ].
	
	number := Fraccion new .
	
	remainder := aDividend integerValue \\ aDivisor integerValue .
	remainder = 0 ifTrue: [^ Numero with: (aDividend integerValue / aDivisor integerValue)] .

"	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator :=  Entero with: (aDivisor integerValue / greatestCommonDivisor integerValue).
	denominator :=  Entero with: (aDividend integerValue / greatestCommonDivisor integerValue).
"	
	aDivisor isOne ifTrue: [ ^ Numero with: aDividend ].
	number valuesAre: aDividend and: aDivisor .
	^ number
	! !
